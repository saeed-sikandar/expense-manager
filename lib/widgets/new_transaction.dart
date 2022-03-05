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
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
          ),
          FlatButton(
            onPressed: () {
              addTransaction(
                titleController.text,
                double.parse(amountController.text),
              );
            },
            child: Text('Add Transaction'),
            textColor: Colors.purple,
          )
        ],
      ),
    );
  }
}
