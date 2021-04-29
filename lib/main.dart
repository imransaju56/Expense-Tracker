
import 'package:expense_tracker/Model/transaction.dart';
import 'package:expense_tracker/Widget/chart.dart';
import 'package:expense_tracker/Widget/new_transaction.dart';
import 'package:expense_tracker/Widget/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Quicksand',

    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  List<Transaction> get _recentTransaction{
    return _usertransactions.where((element) =>
        element.date.isAfter(DateTime.now().subtract(Duration(days: 7)
        )
        )
    ).toList();
    
  }
  


  final List<Transaction> _usertransactions= [];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _usertransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {
          },
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_recentTransaction.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Chart(_recentTransaction),
            TransactionList(transactions:_usertransactions,),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),

      ),
    );
  }
}
