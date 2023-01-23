import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/businessdetails_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaInput.dart';

const List<String> list = <String>[
  '🇳🇬 +234',
  '🇰🇪 +254',
];

class NextOfKin extends StatefulWidget {
  const NextOfKin({super.key});

  @override
  State<NextOfKin> createState() => _NextOfKinState();
}

class _NextOfKinState extends State<NextOfKin> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessDetails(),
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
                      'Next of Kin',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                      child: Text(
                        'This information is only required in the event',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text(
                      'of an emergency or if you become',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'unreachable for an extended period of time',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SharaInput('First Name'),
                    const SharaInput('Last Name'),
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
                          width: MediaQuery.of(context).size.width * 0.25,
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
                          width: MediaQuery.of(context).size.width * 0.68,
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
