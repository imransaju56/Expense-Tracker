import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle= titleController.text;
    final enteredAmount= double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <=0)
      {
        return;
      }
    addTx(
      enteredTitle,enteredAmount,
    );
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

                // keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),

              ),
              TextButton(
                onPressed:submitData,

                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                    color: Colors.purple,
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
