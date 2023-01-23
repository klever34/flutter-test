import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/validate_identity_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';

class BusinessLicense extends StatefulWidget {
  const BusinessLicense({super.key});

  @override
  State<BusinessLicense> createState() => _BusinessLicenseState();
}

class _BusinessLicenseState extends State<BusinessLicense> {
  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const ValidateIdentity(),
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
                      'Upload a photo of business license',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                      child: Text(
                        'Make sure the photo is clear and legible.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 24,
                        ),
                        label: const Text(
                          'Upload business license',
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
