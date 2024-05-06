import 'package:flutter/material.dart';

class HeroPageTwo extends StatefulWidget {
  const HeroPageTwo({super.key});

  @override
  State<HeroPageTwo> createState() => _HeroPageTwoState();
}

class _HeroPageTwoState extends State<HeroPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // const SliverAppBar(
          //   backgroundColor: Colors.transparent,
          // ),
          SliverToBoxAdapter(
            child: Hero(
              tag: 'Animation',
              placeholderBuilder: (context, heroSize, child) {
                return Material(
                  child: Column(
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
                  ),
                );
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width * .85,
                      child: Image.asset(
                        'assets/images/stephen-wheeler-hBh9JbyeCtg-unsplash.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'Farm stay in Hosur, India ',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
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
                          // Text(
                          //   'India 22 km to Bannerghatta National Park',
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: TextStyle(
                          //       color: Colors.black45,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          // Text(
                          //   '24–29 Mar ',
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: TextStyle(
                          //       color: Colors.black45,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       '₹1500',
                          //       style: TextStyle(
                          //           fontSize: 16, fontWeight: FontWeight.w600),
                          //     ),
                          //     SizedBox(
                          //       width: 4,
                          //     ),
                          //     Text(
                          //       'night',
                          //       style: TextStyle(
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w400,
                          //           color: Colors.black87),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
