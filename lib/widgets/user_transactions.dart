import 'package:flutter/material.dart';
import 'package:myexpensesapp/widgets/transaction_list.dart';
import 'package:myexpensesapp/widgets/new_transactions.dart';

import '../models/transaction.dart';


class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  List<Transaction> _myTransactions = [
    Transaction("T1", "Shoes", 33.99, DateTime.now()),
    Transaction("T2", "Shirt", 13.99, DateTime.now()),
    Transaction("T2", "Shirt", 13.99, DateTime.now()),
    Transaction("T2", "Shirt", 13.99, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    void newTransactionHandler(String titleInput, String amountInput){
      int countTransactions = _myTransactions.length + 1;
      Transaction transaction = Transaction("T" + countTransactions.toString() , titleInput, double.parse(amountInput), DateTime.now());
      setState(() {
        _myTransactions = [..._myTransactions, transaction];
      });
    };

    return Column(
      children:[
        NewTransaction(newTransactionHandler),
        TransactionList(_myTransactions),
      ]
    );
  }
}
