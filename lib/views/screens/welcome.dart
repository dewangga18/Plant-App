import 'package:flutter/material.dart';
import 'package:plant_app/configs/routes/app_route.dart';
import 'package:plant_app/configs/constants/app_asset.dart';
import 'package:plant_app/views/components/c_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600 ) {
          return _mainMobile(context);
        } else {
          return _mainWeb(context);
        }
      },
    );
  }

  void tapButton(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoute.dashboard);
  }

  Widget _mainWeb(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAsset.onboard2,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned.fill(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: 'Welcome to',
                    color: Colors.grey.shade300,
                    size: 50,
                  ),
                  const CText(
                    text: 'Plant App',
                    size: 50,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 30),
                  const CText(
                    text: 'Grow your knowlegde about plants in one application',
                    color: Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () => tapButton(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(text: 'Get Started '),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainMobile(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Image.asset(
              AppAsset.onboard,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CText(
                    text: 'Welcome to',
                    color: Colors.grey,
                    size: 28,
                  ),
                  const CText(
                    text: 'Plant App',
                    size: 35,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 20),
                  const CText(
                    text: 'Grow your knowlegde about plants in one application',
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(height: 35),
                  Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => tapButton(context),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(text: 'Get Started '),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
