import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/login_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaInput.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
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
                      'Create account',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Enter details as seen on your official ID.\nThese details help us verify your identity.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SharaInput('First Name'),
                    const SharaInput('Last Name'),
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
