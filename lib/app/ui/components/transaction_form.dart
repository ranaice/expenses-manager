import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

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
              decoration: InputDecoration(labelText: 'Valoe (R\$)'),
            ),
            SizedBox(
              height: 12,
            ),
            FlatButton(
              child: Text('Nova Transação'),
              textColor: Colors.purple,
              onPressed: () {
                print(_titleController.text);
                print(_valueController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
