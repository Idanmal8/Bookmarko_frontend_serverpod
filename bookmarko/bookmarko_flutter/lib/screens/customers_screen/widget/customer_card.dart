import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;

  const CustomerCard({
    required this.customer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 234, 221, 255),
                  shape: BoxShape.circle),
              child: Text(
                customer.firstName[0] + customer.lastName[0],
                style: const TextStyle(
                    fontFamily: 'VarelaRound',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(width: 15), // Add this line
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${customer.firstName} ${customer.lastName}',
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                    ),
                    Text(
                      customer.phone,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
