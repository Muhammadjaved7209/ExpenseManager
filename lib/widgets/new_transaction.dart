// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

// ignore: non_constant_identifier_names
  final TitleController = TextEditingController();
  // ignore: non_constant_identifier_names
  final AmountController = TextEditingController();

  

  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: TitleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: AmountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () { 
                if(TitleController.text.isEmpty || double.parse(AmountController.text) <= 0 )
                {
                  return;
                }
                addTx(
                    TitleController.text, double.parse(AmountController.text));
              },
            ),
          ],
        ),
      ),
    );
    
  }
}
