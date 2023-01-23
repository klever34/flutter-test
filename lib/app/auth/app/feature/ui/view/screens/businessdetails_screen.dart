import 'package:flutter/material.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/businesslicense_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaButton.dart';
import 'package:freebank/app/auth/app/feature/ui/view/widget/SharaInput.dart';

const List<String> listTwo = <String>[
  'State/Province',
];

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  String dropdownValue = listTwo.first;

  @override
  Widget build(BuildContext context) {
    void navigateScreen() {
      Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessLicense(),
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
                      'Business Details',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                      child: Text(
                        'Ensure location details are accurate to',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'improve chances of approval',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SharaInput('Business Category'),
                    const SharaInput('House number and street'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Hellix',
                            fontSize: 16,
                          ),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: listTwo
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SharaInput('City'),
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
