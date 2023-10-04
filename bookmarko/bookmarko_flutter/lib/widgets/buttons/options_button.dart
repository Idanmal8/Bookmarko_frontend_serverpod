import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const OptionButtonInteractive();
  }
}

class OptionButtonInteractive extends StatefulWidget {
  const OptionButtonInteractive({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButtonInteractive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: () {
          // Add your desired functionality here
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0), // Add horizontal padding
                        child: OutlinedButton(
                          onPressed: () {
                            // print("Report");
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Center the content horizontally
                            children: [
                              Icon(Icons.report), // Use your desired icon
                              SizedBox(
                                  width:
                                      8.0), // Add some spacing between the icon and text
                              Text("Report"),
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            // print("Report");
                          },
                          child: const Text("Report")),
                      OutlinedButton(
                          onPressed: () {
                            // print("Report");
                          },
                          child: const Text("Report")),
                    ],
                  ),
                );
              });
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                5), // Adjust the border radius to match the container
          ),
        ),
        child: const Text('More',
            style: TextStyle(color: Colors.black, fontSize: 12)),
      ),
    );
  }
}
