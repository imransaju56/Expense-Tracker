import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle= titleController.text;
    final enteredAmount= double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <=0)
      {
        return;
      }
    widget.addTx(
      enteredTitle,enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                ),
                controller: titleController,
                onSubmitted: (_)=> submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                ),
                controller: amountController,
                onSubmitted: (_) => submitData(),

                keyboardType: TextInputType.number,

              ),
              TextButton(
                onPressed:submitData,

                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                    color: Colors.purple,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
