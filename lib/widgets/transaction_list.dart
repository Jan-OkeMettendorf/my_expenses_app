import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (ctx, index){
          return Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.all(10),
            child: Card(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 1.0),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Text('\$${transactions[index].amount.toStringAsFixed(2)}'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${transactions[index].title}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat().format(transactions[index].transactionDate),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }, itemCount: transactions.length,
      ),
    );
  }
}
