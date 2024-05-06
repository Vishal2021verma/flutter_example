import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class ResourceDownloader extends StatefulWidget {
  const ResourceDownloader({super.key});

  @override
  State<ResourceDownloader> createState() => _ResourceDownloaderState();
}

class _ResourceDownloaderState extends State<ResourceDownloader> {
  ReceivePort port = ReceivePort();

  List<Map> downloadsListMaps = [];
  List<String> imageUrl = [
    'https://images.unsplash.com/photo-1711816769781-0a8194f44399?q=80&w=1968&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://play-lh.googleusercontent.com/C4kxR4j72V6ZlRZHCCLJPDK5dGeWlKZmC7ojoi-lkeaSnAb-EroaYbxvgvjmr31g2A=w240-h480'
  ];

  Future<void> requestDownload(String _url, String _name) async {
    final dir = await getApplicationDocumentsDirectory();
    //From path_provider package
    var localPath = dir.path + _name;
    final savedDir = Directory(localPath);
    await savedDir.create(recursive: true).then((value) async {
      String? taskid = await FlutterDownloader.enqueue(
        url: _url,
        fileName: _name,
        savedDir: localPath,
        showNotification: true,
        openFileFromNotification: false,
      );
    });
    task();
  }

  Future task() async {
    List<DownloadTask>? getTasks = await FlutterDownloader.loadTasks();
    getTasks!.forEach((task) {
      Map map = {};
      map['status'] = task.status;
      map['progress'] = task.progress;
      map['id'] = task.taskId;
      map['filename'] = task.filename;
      map['savedDirectory'] = task.savedDir;
      downloadsListMaps.add(map);
      log(map.toString());
    });
    setState(() {});
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    port.listen((dynamic data) {
      String id = data[0];
      int status = data[1];
      int progress = data[2];
      var task = downloadsListMaps.where((element) => element['id'] == id);
      task.forEach((element) {
        element['progress'] = progress;
        element['status'] = status;
        setState(() {});
      });
    });
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @override
  void initState() {
    super.initState();
    task();
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resource Downloader'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemCount: imageUrl.length,
          itemBuilder: (context, index) {
            var downloaded = downloadsListMaps
                .where((element) => element['filename'] == 'download2_$index')
                .toList();

            return Stack(
              children: [
                InkWell(
                  onTap: () {
                    // requestDownload(imageUrl[index], "download2_$index");
                    if (downloaded.last['progress'] == 100) {
                    } else {
                      requestDownload(imageUrl[index], "download_$index");
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        imageUrl[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                downloadsListMaps.isNotEmpty
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          backgroundColor:
                              const Color.fromARGB(45, 255, 255, 255),
                          color: const Color.fromARGB(255, 237, 237, 237),
                          value: downloadsListMaps.last["progress"] / 100,
                        ))
                    : SizedBox.shrink()
              ],
            );
          }),
    );
  }

  Widget downloadStatusWidget(int _status) {
    return _status == DownloadTaskStatus.canceled
        ? const Text('Download canceled')
        : _status == DownloadTaskStatus.complete
            ? const Text('Download completed')
            : _status == DownloadTaskStatus.failed
                ? const Text('Download failed')
                : _status == DownloadTaskStatus.paused
                    ? const Text('Download paused')
                    : _status == DownloadTaskStatus.running
                        ? const Text('Downloading..')
                        : const Text('Download waiting');
  }
}
