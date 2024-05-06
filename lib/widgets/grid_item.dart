import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.name, required this.iconData, required this.navigate});
  final VoidCallback navigate;
  final String name;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigate,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              iconData,
              size: 36,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ))
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
