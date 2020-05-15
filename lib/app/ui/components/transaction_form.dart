import 'package:expensesmanager/app/ui/components/adaptative_button.dart';
import 'package:expensesmanager/app/ui/components/adaptative_date_picker.dart';
import 'package:expensesmanager/app/ui/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onAddTransaction;

  TransactionForm({Key key, this.onAddTransaction}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                AdaptativeTextField(
                  controller: _titleController,
                  placeholder: 'Título',
                  onSubmitted: (_) => _submitForm(),
                ),
                SizedBox(height: 8),
                AdaptativeTextField(
                  controller: _valueController,
                  placeholder: 'Valor (R\$)',
                  inputFormatters: [WhitelistingTextInputFormatter(RegExp("[,.0-9]"))],
                  inputType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 12,
                ),
                AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                AdaptativeButton(
                  label: 'Nova Transação',
                  onTap: _submitForm,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (_isFormValid(title, value)) {
      widget.onAddTransaction(title, value, _selectedDate);
    }
  }

  _isFormValid(String title, double value) {
    return title.isNotEmpty && value > 0 && _selectedDate != null;
  }
}
