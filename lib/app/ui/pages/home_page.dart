import 'dart:math';

import 'package:expensesmanager/app/model/transaction.dart';
import 'package:expensesmanager/app/ui/components/transaction_form.dart';
import 'package:expensesmanager/app/ui/components/transaction_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 400, date: DateTime.now()),
    Transaction(id: 't3', title: 'Playstation 4', value: 1200, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _openTransactionFormModal,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Gráfico'),
            ),
          ),
          TransactionList(
            transactions: _transactions,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _openTransactionFormModal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _openTransactionFormModal() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onAddTransaction: _addTransaction);
        });
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.pop(context);
  }
}
