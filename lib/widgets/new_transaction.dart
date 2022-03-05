import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  NewTransaction({Key? key, required this.addTransaction}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
            onSubmitted: (_) => submitTransaction,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitTransaction,
          ),
          FlatButton(
            onPressed: submitTransaction,
            child: Text('Add Transaction'),
            textColor: Colors.purple,
          )
        ],
      ),
    );
  }

  void submitTransaction() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) return;

    addTransaction(title, amount);
  }
}
