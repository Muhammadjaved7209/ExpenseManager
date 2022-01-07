// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:udemy/widgets/new_transaction.dart';
import 'package:udemy/widgets/transcation_list.dart';
import 'models/transaction.dart';

void main(List<String> args) {
  runApp(const MyhomePage());
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final List<Transactions> _UserTransaction = [
    Transactions(
      id: "t1",
      title: "shoes",
      amount: 799.00,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t2",
      title: "jacket",
      amount: 3000.9,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String Txtitle, double Txamount) {
    // ignore: unused_local_variable
    final newTx = Transactions(
      title: Txtitle,
      amount: Txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _UserTransaction.add(newTx);
    });
  }

  Future<void> _StartAddNewTransaction(BuildContext ctx) async {
    await showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expenses Manager",
            style: TextStyle(color: Colors.amber),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => _StartAddNewTransaction(context),
                icon: const Icon(Icons.add))
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.white,
                child: const Card(
                  color: Colors.blue,
                  child: Text(
                    "CHART",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              TransactionList(_UserTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        /*
Builder(
  builder: (context) =>
        */
        floatingActionButton: Builder(
  builder: (context) =>
           FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _StartAddNewTransaction(context),
          ),
        ),
      ),
    );
  }
}
