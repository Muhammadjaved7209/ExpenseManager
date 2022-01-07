import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
// ignore: unused_import
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1.5)),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMd()
                          .add_jm()
                          .format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}