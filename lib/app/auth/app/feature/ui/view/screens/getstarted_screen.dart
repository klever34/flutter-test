import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/createaccount_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';

class GetStarted extends ConsumerWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;

    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateAccount(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: deviceSize.height,
            width: double.infinity,
            child: Image.asset(
              'assets/images/happy-customer-bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/shara_white_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Buy and sell on credit to\ngrow your business',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Hellix',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: SharaButton(
                      showIcon: true,
                      title: 'Get Started',
                      buttonType: 'inverted',
                      onPress: navigateScreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
