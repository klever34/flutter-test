import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/takeselfie_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaInput.dart';

class ValidateIdentity extends StatefulWidget {
  const ValidateIdentity({super.key});

  @override
  State<ValidateIdentity> createState() => _ValidateIdentityState();
}

class _ValidateIdentityState extends State<ValidateIdentity> {
  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const TakeSelfie(),
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
                      'Validate identity',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                      child: Text(
                        'Identity verification is how we',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text(
                      'keep accounts secure.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SharaInput('ID Number'),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          size: 24,
                        ),
                        label: const Text(
                          'Take a photo of your ID',
                          style: TextStyle(
                              fontFamily: 'Hellix',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
    );
  }
}
