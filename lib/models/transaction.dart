import 'dart:ffi';

class Transaction {
  String id;
  String title;
  double amount;
  DateTime transactionDate;

  Transaction(this.id, this.title, this.amount, this.transactionDate);
}