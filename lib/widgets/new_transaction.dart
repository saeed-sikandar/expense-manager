import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction({Key? key, required this.addTransaction}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  var _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
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
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(child: Text( _selectedDate == null ? 'No Chosen Date!' : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}")),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: submitTransaction,
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  void submitTransaction() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) return;

    widget.addTransaction(title, amount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
        if(pickedDate == null) return;
        setState(() {
          _selectedDate = pickedDate;
        });
    });
  }
}
