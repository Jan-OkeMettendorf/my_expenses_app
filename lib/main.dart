import 'package:flutter/material.dart';
import 'package:myexpensesapp/widgets/new_transactions.dart';
import 'package:myexpensesapp/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late String titleInput = "";
  late int amountInput;

  List<Transaction> _myTransactions = [
    Transaction("T1", "Shoes", 33.99, DateTime.now()),
    Transaction("T2", "Shirt", 13.99, DateTime.now()),
    Transaction("T2", "Shirt", 13.99, DateTime.now()),
    Transaction("T2", "Shirt", 13.99, DateTime.now()),
  ];

  void newTransactionHandler(String titleInput, String amountInput) {
    int countTransactions = _myTransactions.length + 1;
    Transaction transaction = Transaction("T" + countTransactions.toString(),
        titleInput, double.parse(amountInput), DateTime.now());
    setState(() {
      _myTransactions = [..._myTransactions, transaction];
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(newTransactionHandler),
            onVerticalDragDown: (_){},
          );
        });
  }

  handleChange(val) => {titleInput = val};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TransactionList(_myTransactions),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
