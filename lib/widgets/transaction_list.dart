import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionLists extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  const TransactionLists({Key? key, required this.userTransactions, required this.deleteTransaction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )),
                    child: FittedBox(
                      child: Text(
                        '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        userTransactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(userTransactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => deleteTransaction(userTransactions[index].id),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,

                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
