// ignore_for_file: prefer_const_constructors

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/Chart.dart';
import './models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Jogers Levi\'s',
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
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(
            addTransaction: _addNewTransaction,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Expense Tracker'),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(Icons.add),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ignore: avoid_unnecessary_containers

            Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3,
              child: Chart(_recentTransactions),
            ),
            _userTransactions.isEmpty
                ? Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
                  child: Column(
                      children: <Widget>[
                        Text(
                          'No transactions added yet!',
                          style: TextStyle(fontSize: 22),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          height: 200,
                          child: Image(
                            image: AssetImage('assets/images/waiting.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                )
                : Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7 ,
                  child: TransactionLists(
                      userTransactions: _userTransactions,
                      deleteTransaction: _deleteTransaction,
                    ),
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.add,
          )),
    );
  }
}
