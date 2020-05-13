import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final void Function(String, double) onAddTransaction;

  TransactionForm({Key key, this.onAddTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[,.0-9]"))],
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 12,
            ),
            FlatButton(
              child: Text('Nova Transação'),
              textColor: Colors.purple,
              onPressed: () {
                onAddTransaction(_titleController.text, double.parse(_valueController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
