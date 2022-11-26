import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_flutter/controllers/transaction_controller.dart';
import 'package:projeto_flutter/models/transaction_model.dart';
import 'package:provider/provider.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({super.key});

  static const formTransaction = '/formTransaction';

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  final _form = GlobalKey<FormState>();
  final _formName = TextEditingController();
  final _formValue = TextEditingController();
  final _formDate = TextEditingController();

  final Map<String, dynamic> _formData = {};

  void _loadFormData(TransactionModel data) {
    _formData['id'] = data.id;
    _formData['name'] = data.name;
    _formData['value'] = data.value;
    _formData['date'] = data.date;
    //   _formData['iconUrl'] = data.iconUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as TransactionModel?;
    if (args != null) {
      _loadFormData(args);
    }
  }

  @override
  Widget build(BuildContext context) {
//    final args = ModalRoute.of(context)!.settings.arguments as TransactionModel?;
//    if (args != null) {
//      _loadFormData(args);
//    }
    final argsModel =
        ModalRoute.of(context)?.settings.arguments as TransactionModel?;

    print(argsModel?.name);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                controller: _formName,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatorio';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['value'],
                controller: _formValue,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'valor'),
                validator: (value) {
                  if (value == null || value.toString().trim().isEmpty) {
                    return 'Campo obrigatorio';
                  }
                  return null;
                },
                onSaved: (value) =>
                    _formData['value'] = double.tryParse(value!),
              ),
              TextFormField(
                initialValue: _formData['date'],
               controller: _formDate,
                decoration: const InputDecoration(
                  labelText: "Escolha a data",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Campo obrigatorio';
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    setState(() {
                      _formDate.text = formattedDate;
                    });
                  }
                },
                onSaved: (value) => _formData['date'] = DateTime.parse(value!),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _form.currentState!.validate();
          if (isValid) {
            _form.currentState!.save();

            Provider.of<TransactionController>(context, listen: false).put(
              TransactionModel(
                id: _formData['id'],
                name: _formData['name'],
                value: _formData['value'],
                date: _formData['date'],
                //        iconUrl: _formData['iconUrl'],
              ),
            );

            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
