import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/screens/customers_screen/widget/customer_card.dart';
import 'package:bookmarko_flutter/utils/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

List<Customer> mockCustomers = [
  Customer(
    firstName: "John",
    lastName: "Doe",
    phone: "123-456-7890",
    email: "john.doe@example.com",
    joined: DateTime(2023, 1, 15),
    businessId: 1,
  ),
  Customer(
    firstName: "Jane",
    lastName: "Smith",
    phone: "987-654-3210",
    email: "jane.smith@example.com",
    joined: DateTime(2023, 2, 10),
    businessId: 2,
  ),
  Customer(
    firstName: "Alice",
    lastName: "Johnson",
    phone: "555-123-4567",
    email: null, // Assuming email is optional
    joined: DateTime(2023, 3, 5),
    businessId: 3,
  ),
];

class CustomersScreen extends StatefulWidget {
  final List<Customer>? businessCustomers;

  const CustomersScreen({
    this.businessCustomers,
    super.key,
  });

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  List<Customer> filteredCustomers =
      mockCustomers; // Initially display all customers

  void handleSearch(List<Customer> results) {
    setState(() {
      print('Results: $mockCustomers');
      filteredCustomers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarHandler<Customer>(
              items: mockCustomers,
              itemToString: (Customer customer) =>
                  '${customer.firstName} ${customer.lastName}',
              onSearch: handleSearch,
            ),
            for (var customer in filteredCustomers)
              CustomerCard(customer: customer),
          ],
        ),
      ),
    );
  }
}
