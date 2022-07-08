import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_demo/constant/constant.dart';
import 'package:portfolio_demo/widget/about_me_app.dart';
import 'package:portfolio_demo/widget/carousel_slider_app.dart';
import 'package:portfolio_demo/widget/contact_us_app.dart';
import 'package:portfolio_demo/widget/custome_text.dart';
import 'package:portfolio_demo/widget/mobile_project.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPortfolioApp extends StatefulWidget {
  @override
  _MyPortfolioAppState createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index!,
      child: child,
    );
  }

  double offset = 0;

  AppBarTitle({required String text}) {
    // TODO: implement AppBarTitle
    Text(text);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final nameStyle = Theme.of(context).textTheme.headline2;
    final descriptionStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: Container(
          color: Colors.black,
          height: height * 0.1,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16),
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.track_changes_rounded,
                      size: 22.0,
                      color: Color(0xff64FFDA),
                    ),
                    onPressed: () {}),
                Spacer(),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //     child: DefaultTabController(
                //       length: 3,
                //       child: TabBar(
                //         indicatorColor: Colors.transparent,
                //         onTap: (index) async {
                //           _scrollToIndex(index);
                //         },
                //         tabs: const [
                //           Tab(
                //             child: Text(
                //               'About',
                //             ),
                //           ),
                //           Tab(
                //             child: Text(
                //               'Project',
                //             ),
                //           ),
                //           Tab(
                //             child: Text(
                //               'Contact Us',
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: height * 0.05,
                    width: height * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff0A192F),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: height,
                                width: width * 0.5,
                                decoration: const BoxDecoration(
                                  color: Color(0xff0A192F),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/prijens-nakrani-resume.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          launch(
                                              "https://firebasestorage.googleapis.com/v0/b/prijens-nakrani.appspot.com/o/prijens-nakrani-resume.pdf?alt=media&token=ab515922-bd29-4ad4-9146-3922186e8b9d");
                                        },
                                        icon: const Icon(
                                          Icons.download_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Resume",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff64FFDA),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: updateOffsetAccordingToScroll,
        child: ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // Positioned(
              //   top: -.25 * offset,
              //   child: FadeInImage.memoryNetwork(
              //     // From the transparent_image package
              //     placeholder: kTransparentImage,
              //     image: kHeroImage,
              //     height: height,
              //     width: width,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Positioned(
                top: -.25 * offset,
                child: Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("$kHeroImage"), fit: BoxFit.cover),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 200,
                          ),
                          FadeInLeft(
                            duration: const Duration(milliseconds: 180),
                            child: const Text(
                              'Hi ! I am',
                              style: TextStyle(
                                color: Color(0xff59bd99),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInLeft(
                            duration: Duration(milliseconds: 600),
                            child: Wrap(children: const [
                              Text(
                                'Prijens Nakrani',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(height: 8),
                          FadeInLeft(
                              duration: Duration(milliseconds: 1200),
                              child: Wrap(
                                children: [
                                  Text(
                                    ' I Build Flutter Application',
                                    style: descriptionStyle?.copyWith(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: height * 0.3,
                          ),
                          _wrapScrollTag(
                            index: 0,
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: CustomScrollView(
                  controller: _autoScrollController,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(height: height),
                          _wrapScrollTag(
                            index: 0,
                            child: Container(
                              height: height,
                              width: width,
                              color: const Color(0xff0A192F),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: AboutMeApp(),
                              ),
                            ),
                          ),
                          //SizedBox(height: height),
                          _wrapScrollTag(
                            index: 1,
                            child: Column(
                              children: [
                                Container(
                                  width: width,
                                  color: const Color(0xff245F76),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                            text: "My Projects",
                                            textsize: 20,
                                            color: Color(0xff0A192F),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/game_app.jpg",
                                          ontab: () {},
                                          projectDesc:
                                              "A Mobile App for both Android and IOS. Game info ,which game is free for pc . The purpose of this projcet is to Learn Flutter Api integration .",
                                          projectTitle: "Pc game info",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "Api",
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/afg-1.gif",
                                              height: height * 0.5,
                                              width: width * 0.2,
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Image.asset(
                                              "assets/images/afg-2.gif",
                                              height: height * 0.5,
                                              width: width * 0.2,
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Image.asset(
                                              "assets/images/afg-3.gif",
                                              height: height * 0.5,
                                              width: width * 0.2,
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Image.asset(
                                              "assets/images/afg-4.gif",
                                              height: height * 0.5,
                                              width: width * 0.2,
                                            ),
                                          ],
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/Project Thumb App 28.png",
                                          ontab: () {},
                                          projectDesc:
                                              "Animated Sign Up& Login with Firebase",
                                          projectTitle: "Email Auth Firebase",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "Flutter",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/tic_tac_toe.jpg",
                                          ontab: () {},
                                          projectDesc:
                                              "A Mobile Game for both Android and IOS. Play game, enjoy. The purpose of this projcet is to Learn Flutter complex Neumorphic UI Design .",
                                          projectTitle: "Tic Tac Toe",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "UI",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/App Mockups 51.jpg",
                                          ontab: () {},
                                          projectDesc:
                                              "Complete Hotel Booking Ui",
                                          projectTitle: "Hotel Booking",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "UI",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/App Mockups 53.png",
                                          ontab: () {},
                                          projectDesc:
                                              "Edufly Book Ordering App",
                                          projectTitle: "Edufly Book",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "UI",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/App Mockups 54.png",
                                          ontab: () {},
                                          projectDesc:
                                              "Fashion hub online ordering Ui",
                                          projectTitle: "Fashion Hub Ui",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "UI",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath: "assets/images/news.jpg",
                                          ontab: () {},
                                          projectDesc:
                                              "Complete news Application using news Api .",
                                          projectTitle: "News app",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "Api",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/App Mockups 16.jpg",
                                          ontab: () {},
                                          projectDesc: "WhatsApp UI clone .",
                                          projectTitle: "WhatsApp Ui",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "UI",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/Play Store 1.jpg",
                                          ontab: () {},
                                          projectDesc:
                                              "Complete Movie Application using Tmdb Api .",
                                          projectTitle: "Movie info app",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "Api",
                                        ),
                                        FeatureProjectMobile(
                                          imagePath:
                                              "assets/images/meal_monkey.jpg",
                                          ontab: () {},
                                          projectDesc:
                                              "Online ordering food App for UI .",
                                          projectTitle: "Food Delivering App",
                                          tech1: "Flutter",
                                          tech2: "Dart",
                                          tech3: "UI",
                                        ),
                                        CustomText(
                                          text: "Ui Challenges",
                                          textsize: 18,
                                          color: Color(0xffD3F3FF),
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.75,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.02),
                                    color: const Color(0xff245F76),
                                    child: CarouselSliderWidgetApp())
                              ],
                            ),
                          ),
                          _wrapScrollTag(
                            index: 2,
                            child: Container(
                              height: height,
                              width: width,
                              color: const Color(0xff0A192F),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: ContactUSApp(),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns true to cancel the notification bubbling.
  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    setState(() => offset = scrollNotification.metrics.pixels);
    return true;
  }
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
