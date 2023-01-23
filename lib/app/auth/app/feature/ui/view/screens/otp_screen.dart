import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/homeaddress_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeAddress(),
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
                      'Confirm number',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Enter the 6 digit code sent to',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        '+234xxxxxxxx71',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 90),
                      child: OTPTextField(
                        length: 5,
                        width: MediaQuery.of(context).size.width * 0.8,
                        style: const TextStyle(fontSize: 14),
                        // textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 45,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        },
                      ),
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
