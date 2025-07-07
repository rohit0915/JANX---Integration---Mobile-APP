// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:jan_x/auth/signIn_screen.dart';
import 'package:jan_x/buy_add/buy_add_screen.dart';
import 'package:jan_x/future_services/tutorial_videos/tutorial_video_screen.dart';
import 'package:jan_x/inspection_request/inspection_request_screen.dart';
import 'package:jan_x/mandi_rate/mandi_rate_screen.dart';
import 'package:jan_x/packaging_labeling/packaging_and_labeling_screen.dart';
import 'package:jan_x/post_buy_ads/post_by_ad_screen.dart';
import 'package:jan_x/post_sell_ad/post_sell_ad_screen.dart';
import 'package:jan_x/profile/profile_screen.dart';
import 'package:jan_x/sale_ads/sale_ads_screen.dart';
import 'package:jan_x/trade_setllement/trade_settlement_screen.dart';
import 'package:jan_x/transport_facility/transport_facility_screen.dart';
import 'package:jan_x/utilz/colors.dart';
import 'package:jan_x/wallet/wallet_screen.dart';
import 'package:jan_x/widgets/app_widgets.dart';
import 'package:jan_x/widgets/custom_button.dart';
import 'package:jan_x/wish_karo_screen/wish_karo_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> indemand = [
  "assets/banner2.png",
  "assets/banner2.png",
  "assets/banner2.png",
  "assets/banner2.png",
  "assets/banner2.png",
];
int imageIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff444444),
            image: DecorationImage(
              image: AssetImage("assets/splash3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
            children: [
              buildVSpacer(50),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: buildCustomTextField2(
                        hintText: "Search...",
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ));
                      },
                      child: Image.asset("assets/profile.png")),
                  buildHSpacer(20),
                ],
              ),
              // Image.asset(
              //   "assets/banner.png",
              //   scale: 0.9,
              // ),
              bannerSliderMethod(),
              buildVSpacer(1.h),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildText(title: 'Trade Creation'),
                  ),
                ),
              ),
              buildVSpacer(3.h),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostSellAdScreen(),
                            ),
                          );
                        },
                        child: HomeItemWidgets(
                          images: 'hometrade1',
                          title: "Post Sell Ad’s",
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostBuyAdScreen(),
                            ),
                          );
                        },
                        child: HomeItemWidgets(
                          images: 'hometrade2',
                          title: "Post Buy Ad’s",
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WishKaroScreen(),
                            ),
                          );
                        },
                        child: HomeItemWidgets(
                          images: 'hometrade3',
                          title: "WishKaro",
                        )),
                  ),
                ],
              ),
              buildVSpacer(2.h),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildText(title: 'Market Place'),
                  ),
                ),
              ),
              // buildVSpacer(1.h),

              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SaleAddScreen(),
                              ));
                        },
                        child: Image.asset("assets/market1.png",
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeBuyerAddScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/market2.png")),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TradeSettlementScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/market3.png")),
                  ),
                ],
              ),
              buildVSpacer(1.h),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildText(title: 'Support Services'),
                  ),
                ),
              ),
              // buildVSpacer(1.h),

              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => InspectionRequestScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/service1.png")),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TransportFacilityScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/service2.png")),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PackagingAndLabelinScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/service3.png")),
                  ),
                ],
              ),
              buildVSpacer(2.h),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildText(title: 'Other Services'),
                  ),
                ),
              ),
              // buildVSpacer(1.h),

              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignInScreen(isMitra: true),
                              ));
                        },
                        child: Image.asset("assets/otherservice1.png")),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MandiRateScreen(),
                              ));
                        },
                        child: Image.asset("assets/otherservice2.png")),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WalletScreen(),
                              ));
                        },
                        child: Image.asset("assets/otherservice3.png")),
                  ),
                ],
              ),
              //  buildVSpacer(1.h),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF4BC1C),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildText(title: 'Future Services'),
                  ),
                ),
              ),
              // buildVSpacer(1.h),

              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(flex: 1, child: Image.asset("assets/future1.png")),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TutorialVideoScreen(),
                              ));
                        },
                        child: Image.asset("assets/future2.png")),
                  ),
                  Expanded(flex: 1, child: Image.asset("assets/future3.png")),
                ],
              ),
              buildVSpacer(80),
              CustomButton_continue(
                text: 'Continue',
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => SignInScreen(),
                  //   ),
                  // );
                },
              ),
              buildVSpacer(100)
            ],
          )),
        ),
      ),
    );
  }

  Stack bannerSliderMethod() {
    return Stack(
      children: [
        CarouselSlider(
          items: indemand.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 100.w,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 20.h,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                imageIndex = index;
              });
            },
            //    aspectRatio: 15/2,
            viewportFraction: 1,
            // enlargeCenterPage: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Positioned(
          bottom: Adaptive.h(1),
          left: Adaptive.w(40),
          child: DotsIndicator(
            dotsCount: 5,
            position: imageIndex,
            reversed: false,
            decorator: DotsDecorator(
                spacing: EdgeInsets.only(right: Adaptive.w(2)),
                color: Colors.white, // Inactive color
                activeColor: buttonColor,
                activeSize: Size(Adaptive.w(4), Adaptive.h(3)),
                size: Size(Adaptive.w(3), Adaptive.h(1.5))),
          ),
        ),
      ],
    );
  }
}

class HomeItemWidgets extends StatelessWidget {
  const HomeItemWidgets({super.key, required this.images, required this.title});
  final String images;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: Adaptive.w(20),
            height: Adaptive.h(9),
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp), color: white),
            child: Center(
                child: Image.asset(
              "assets/$images.png",
              fit: BoxFit.cover,
              scale: 0.9,
            ))),
        buildVSpacer(1.h),
        Center(
          child: _buildText2(
              title: title,
              size: 10.px,
              fontWeight: FontWeight.w700,
              color: Colors.white70.withOpacity(0.8)),
        )
      ],
    );
  }
}

Widget _buildTextHeader(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w500, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}

Widget _buildText2(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Text(
    title,
    style: TextStyle(
        fontSize: size ?? 14,
        fontWeight: fontWeight ??
            FontWeight
                .w400, // Use the provided fontWeight or default to FontWeight.w500
        fontFamily: 'Poppins',
        color: color ?? Colors.black),
  );
}

Widget _buildText(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 18.0,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            fontSize: size ?? 14,
            fontWeight: fontWeight ??
                FontWeight
                    .w400, // Use the provided fontWeight or default to FontWeight.w500
            fontFamily: 'Poppins',
            color: color ?? Colors.black),
      ),
    ),
  );
}
