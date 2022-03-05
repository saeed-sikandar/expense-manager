import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Shoe Purchase',
      amount: 22.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Cookies Purchase',
      amount: 2.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Jacket Purchase',
      amount: 22.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'tie Purchase',
      amount: 22.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: '5',
      title: 'shirt Purchase',
      amount: 22.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: '6',
      title: 'laptop Purchase',
      amount: 22.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: '545',
      title: 'Bike Purchase',
      amount: 2222.4,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTransaction: _addNewTransaction,
        ),
        TransactionLists(userTransactions: _userTransactions),
      ],
    );
  }
}
