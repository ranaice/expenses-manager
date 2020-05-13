import 'package:expensesmanager/app/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((transaction) {
          return _transactionItem(transaction);
        }).toList()
      ],
    );
  }

  Card _transactionItem(Transaction transaction) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2),
              ),
              child: Text(
                'R\$ ${transaction.value.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.purple),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('d MMM y').format(transaction.date),
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
