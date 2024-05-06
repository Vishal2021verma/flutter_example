import 'package:flutter/material.dart';
import 'package:flutter_example/animations/hero_animation/hero_page_two.dart';

class HeroPageOne extends StatefulWidget {
  const HeroPageOne({super.key});

  @override
  State<HeroPageOne> createState() => _HeroPageOneState();
}

class _HeroPageOneState extends State<HeroPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Page One"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HeroPageTwo()));
              },
              child: Hero(
                tag: "Animation",
                placeholderBuilder: (context, heroSize, child) {
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).width * .85,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/stephen-wheeler-hBh9JbyeCtg-unsplash.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Row(
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
                    ],
                  );
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).width * .85,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/stephen-wheeler-hBh9JbyeCtg-unsplash.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
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
                      const Text(
                        'India 22 km to Bannerghatta National Park',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        '24–29 Mar ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Row(
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
