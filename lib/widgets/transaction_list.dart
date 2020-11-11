import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _userTransactions.isEmpty
          ? Column(children: [
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ))
            ])
          : ListView.builder(
              itemCount: _userTransactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_userTransactions[index].title.toString(),
                              style: Theme.of(context).textTheme.title),
                          Text(DateFormat.yMMMd()
                              .format(_userTransactions[index].date))
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
