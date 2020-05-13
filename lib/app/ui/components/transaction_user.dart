import 'dart:math';

import 'package:expensesmanager/app/model/transaction.dart';
import 'package:expensesmanager/app/ui/components/transaction_form.dart';
import 'package:expensesmanager/app/ui/components/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 400, date: DateTime.now()),
    Transaction(id: 't3', title: 'Playstation 3', value: 1200, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(
          transactions: _transactions,
        ),
        TransactionForm(
          onAddTransaction: _addTransaction,
        ),
      ],
    );
  }

  _addTransaction(String title, double value) {
    final newTransaction =
        Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }
}
