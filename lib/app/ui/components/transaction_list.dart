import 'package:expensesmanager/app/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDeleteTransaction;

  const TransactionList({Key key, this.transactions, this.onDeleteTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              SizedBox(height: 16),
              Text(
                'Nenhuma transação cadastrada',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 24),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (_, index) {
              final transaction = transactions[index];
              return _transactionItem(context, transaction);
            },
          );
  }

  Widget _transactionItem(BuildContext context, Transaction transaction) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                'R\$ ${transaction.value.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(transaction.date),
          style: TextStyle(fontSize: 12, color: Colors.black38),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {
            onDeleteTransaction(transaction.id);
          },
        ),
      ),
    );
  }
}
