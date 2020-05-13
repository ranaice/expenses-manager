import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onAddTransaction;

  TransactionForm({Key key, this.onAddTransaction}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
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
              onSubmitted: (_) => _submitForm(),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[,.0-9]"))],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 12,
            ),
            FlatButton(
              child: Text('Nova Transação'),
              textColor: Colors.purple,
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (_isFormValid(title, value)) {
      widget.onAddTransaction(title, value);
    }
  }

  _isFormValid(String title, double value) {
    return title.isNotEmpty && value > 0;
  }
}
