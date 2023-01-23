import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/nextofkin_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaInput.dart';

class HomeAddress extends StatefulWidget {
  const HomeAddress({super.key});

  @override
  State<HomeAddress> createState() => _HomeAddressState();
}

class _HomeAddressState extends State<HomeAddress> {
  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const NextOfKin(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Home address',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                      child: Text(
                        'Enter KYC information to create an account',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text(
                      'Ensure all details are correct.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SharaInput('House number and street'),
                    const SharaInput('State/Province'),
                    const SharaInput('City'),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: SharaButton(
                    buttonType: 'non-inverted',
                    title: 'Next',
                    showIcon: false,
                    onPress: navigateScreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
