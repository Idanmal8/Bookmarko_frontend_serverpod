import 'package:flutter/material.dart';

class DropDownButtonWidget extends StatefulWidget {
  final List<String> list; // Change 'list' to 'List<String>'
  const DropDownButtonWidget({super.key, required this.list});

  @override
  State<DropDownButtonWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropDownButtonWidget> {
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.list[0]; // Initialize with an empty string
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        if (value == null)
          return; // Add this line (or check for null in some other way
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
