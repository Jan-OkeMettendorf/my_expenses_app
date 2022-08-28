import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function newTransaction;
  final textInputController = TextEditingController();
  final amountInputController = TextEditingController();
  NewTransaction(this.newTransaction);

  void submitHandler(BuildContext bctx) {
    final enteredTitle = textInputController.text;
    final enteredAmount = double.parse(amountInputController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    newTransaction(textInputController.text, amountInputController.text);
    Navigator.of(bctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(label: Text('title')),
              controller: textInputController,
              onSubmitted: (_) {
                submitHandler(context);
              },
            ),
            TextField(
              decoration: InputDecoration(label: Text('Amount')),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: amountInputController,
              onSubmitted: (_) {
                submitHandler(context);
                },
            ),
            Container(
              width: 100,
              child: FlatButton(
                  onPressed: () {
                    submitHandler(context);
                  },
                  color: Colors.blue,
                  child: Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}
