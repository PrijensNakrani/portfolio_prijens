import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({Key? key}) : super(key: key);

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          const Center(
            child: Text(
              "Contacts",
              style: TextStyle(
                  color: Color(0xffD3F3FF),
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          const Text(
            "Getting in touch is easy!",
            style: TextStyle(
                color: Color(0xffD3F3FF),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          ListTile(
            leading: const Icon(
              Icons.mail,
              color: Color(0xff64FFDA),
            ),
            title: const Text(
              'Email ID: prijensnakrani62@gmail.com',
              style: TextStyle(
                color: Color(0xff64FFDA),
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xff64FFDA),
              ),
            ),
            onTap: () => launch('mailto:' + "prijensnakrani62@gmail.com"),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    elevation: 8.0,
                    backgroundColor: const Color(0xff245F76),
                    contentPadding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    content: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () => launch('tel:' + "8530157531"),
                            child: Container(
                              height: 50.0,
                              alignment: Alignment.center,
                              child: const Text(
                                'Call',
                                style: TextStyle(color: Color(0xff64FFDA)),
                              ),
                            ),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () => launch('sms:' + "8530157531"),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              child: const Text(
                                'Message',
                                style: TextStyle(color: Color(0xff64FFDA)),
                              ),
                            ),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () =>
                                launch('https://wa.me/' + "8530157531"),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              child: const Text(
                                'WhatsApp',
                                style: TextStyle(color: Color(0xff64FFDA)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const ListTile(
              leading: Icon(
                Icons.phone,
                color: Color(0xff64FFDA),
              ),
              title: Text(
                'Phone NO:+91 8530157531',
                style: TextStyle(
                  color: Color(0xff64FFDA),
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff64FFDA),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  launch('https://github.com/' + "PrijensNakrani");
                },
                child: Container(
                  height: width * 0.025,
                  width: width * 0.025,
                  decoration: const BoxDecoration(
                      color: Color(0xff64FFDA), shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/MdiGithub.svg",
                      height: width * 0.02,
                      width: width * 0.02,
                      color: Color(0xff0A192F),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              InkWell(
                onTap: () {
                  launch('https://twitter.com/' + "prijens_nakrani");
                },
                child: Container(
                  height: width * 0.025,
                  width: width * 0.025,
                  decoration: const BoxDecoration(
                      color: Color(0xff64FFDA), shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/MdiTwitter.svg",
                      height: width * 0.02,
                      width: width * 0.02,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              InkWell(
                onTap: () {
                  launch('https://www.linkedin.com/in/prijens-nakrani/');
                },
                child: Container(
                  height: width * 0.025,
                  width: width * 0.025,
                  decoration: const BoxDecoration(
                      color: Color(0xff64FFDA), shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/AkarIconsLinkedinv2Fill.svg",
                      height: width * 0.02,
                      width: width * 0.02,
                      color: const Color(0xff0A192F),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              InkWell(
                onTap: () {
                  launch('https://www.instagram.com/' + "prijens_nakrani7/");
                },
                child: Container(
                  height: width * 0.025,
                  width: width * 0.025,
                  decoration: const BoxDecoration(
                      color: Color(0xff64FFDA), shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/MdiInstagram .svg",
                      height: width * 0.02,
                      width: width * 0.02,
                      color: const Color(0xff0A192F),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
