import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'T-shirt', amount: 120.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Shoes', amount: 100, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 10,
              child: Text('Chart Goes Here'),
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black)),
                      padding: EdgeInsets.all(10),
                      child: Text(transaction.amount.toString()),
                    ),
                    Column(
                      children: [
                        Text(transaction.title.toString()),
                        Text(transaction.date.toString())
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
