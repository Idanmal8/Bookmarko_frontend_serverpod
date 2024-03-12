// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchBarHandler<T extends Object> extends StatefulWidget {
  // Explicitly bound T to Object
  final List<T> items;
  final String Function(T) itemToString;
  final Function(List<T>) onSearch; // Add this line

  const SearchBarHandler({
    required this.items,
    required this.itemToString,
    required this.onSearch,
    super.key,
  });

  @override
  State<SearchBarHandler<T>> createState() => _SearchBarHandlerState<T>();
}

class _SearchBarHandlerState<T extends Object>
    extends State<SearchBarHandler<T>> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Autocomplete<T>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return Iterable<T>.empty();
          }
          return widget.items.where((T item) {
            return widget
                .itemToString(item)
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        displayStringForOption: widget.itemToString,
        fieldViewBuilder: (
          BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted,
        ) {
          return TextField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Search',
            ),
          );
        },
        onSelected: (T selection) {
          widget.onSearch([selection]); // Pass the selected item to the onSearch method
        },
      ),
    );
  }
}
