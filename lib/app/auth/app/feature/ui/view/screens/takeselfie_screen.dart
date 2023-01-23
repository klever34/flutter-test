import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/camera_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';

class TakeSelfie extends StatefulWidget {
  const TakeSelfie({super.key});

  @override
  State<TakeSelfie> createState() => _TakeSelfieState();
}

class _TakeSelfieState extends State<TakeSelfie> {
  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      // Navigator.push<String>(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const LoginScreen(),
      //   ),
      // );
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
                        'Make sure your shop is visible in the',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text(
                      'background. Remove your hat and/or glasses',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'for the photo. Smile! 😃',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: SharaButton(
                buttonType: 'non-inverted',
                title: 'Take a selfie',
                showIcon: true,
                // onPress: navigateScreen,
                onPress: () async {
                  await availableCameras().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CameraPage(cameras: value),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
