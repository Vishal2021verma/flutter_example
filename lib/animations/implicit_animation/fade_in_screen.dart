import 'package:flutter/material.dart';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

class FadeInScreen extends StatefulWidget {
  const FadeInScreen({super.key});

  @override
  State<FadeInScreen> createState() => _FadeInScreenState();
}

class _FadeInScreenState extends State<FadeInScreen> {
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fade In'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/stephen-wheeler-hBh9JbyeCtg-unsplash.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (opacity == 1) {
                          opacity = 0;
                        } else {
                          opacity = 1;
                        }
                      });
                    },
                    child:
                        Text(opacity == 1 ? 'Hide Details' : 'Show Details')),
                const SizedBox(
                  height: 16,
                ),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 700),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Bengaluru, India',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        'India 22 km to Bannerghatta National Park',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '24–29 Mar ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            '₹1500',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'night',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
