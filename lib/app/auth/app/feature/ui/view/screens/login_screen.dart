import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/otp_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaInput.dart';

const List<String> list = <String>[
  '🇳🇬 234',
  '🇰🇪 254',
];

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const OtpVerification(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Enter phone number',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'We will confirm this number by sending a\n6 digit code to enter on the next screen.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFECECEC),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Please use the number associated with your MPesa account',
                          style: TextStyle(
                              fontFamily: 'Hellix',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5C5C5C)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black87),
                                underline: Container(
                                  height: 2,
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const SharaInput(
                            'Phone number',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: SharaButton(
                  buttonType: 'non-inverted',
                  title: 'Next',
                  showIcon: false,
                  onPress: navigateScreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
