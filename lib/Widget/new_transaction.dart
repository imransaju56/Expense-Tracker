import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return  Card(

      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Amount',
              ),

              controller: amountController,
            ),
            TextButton(
              onPressed: (){
                addTx(titleController.text,num.parse(amountController.text));


              },

              child: Text("Add Transaction",style: TextStyle(
                color: Colors.purple,
              ),),
            ),

          ],
        ),
      ),
    );
  }
}
