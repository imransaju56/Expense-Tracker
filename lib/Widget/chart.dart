import 'package:expense_tracker/Model/transaction.dart';
import 'package:expense_tracker/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenTransaction;

  Chart(this.recenTransaction);

  List<Map<String, Object>> get groupedTransactionValus {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;
      for (var i = 0; i < recenTransaction.length; i++) {
        if (recenTransaction[i].date.day == weekDay.day &&
            recenTransaction[i].date.month == weekDay.month &&
            recenTransaction[i].date.year == weekDay.year) {
          totalSum = totalSum + recenTransaction[i].amount;
        }
      }


      print('subtracted result is : '+ DateFormat.E().format(weekDay));
      print(totalSum);


      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};


    });
  }

  @override
  Widget build(BuildContext context) {
    
    print(groupedTransactionValus);

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(),
    );
  }
}
