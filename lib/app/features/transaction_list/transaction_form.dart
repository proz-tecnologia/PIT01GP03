import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionForm extends StatefulWidget {
  final TransactionController controller;
  final TransactionModel? model;

  const TransactionForm({
    Key? key,
    required this.controller,
    this.model,
  }) : super(key: key);

  static const routeTransactionForm = '/transaction-form';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

const List<String> list = <String>['Entrada', 'Saída'];

class _TransactionFormState extends State<TransactionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  String? dropdownValue;
  TransactionModel? newTransaction;

  @override
  void initState() {
    super.initState();
    newTransaction = widget.model;
    _titleController.text = widget.model?.title ?? '';
    _amountController.text = widget.model?.amount.toString() ?? '';
    _dateController.text = widget.model?.date.toString() ?? '';
    dropdownValue = newTransaction?.category == false ? list.last : list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Formulário de Transação'),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFormField(
                    labelText: 'Titulo',
                    validator: CustomFormFieldValidator.validateNull,
                    controller: _titleController,
                  ),
                  CustomFormField(
                    labelText: 'Valor',
                    validator: CustomFormFieldValidator.validateNull,
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _dateController,
                      validator: CustomFormFieldValidator.validateNull,
                      decoration: const InputDecoration(
                        labelText: "Data",
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(
                            () {
                              _dateController.text = formattedDate;
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color: Colors.black54),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
                        ),
                        onChanged: (String? value) {
                          setState(
                            () {
                              dropdownValue = value!;
                            },
                          );
                        },
                        items: list.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [Text(value)],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFlatButton(
                        text: 'VOLTAR',
                        color: Colors.grey,
                        width: 0.3,
                        height: 0.06,
                        fontSize: 20,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CustomFlatButton(
                        text: 'CONFIRMAR',
                        color: AppColors.primaryDark,
                        width: 0.6,
                        height: 0.06,
                        fontSize: 20,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            newTransaction = TransactionModel(
                              id: widget.model?.id,
                              title: _titleController.text,
                              amount: double.parse(_amountController.text),
                              date: DateTime.parse(_dateController.text),
                              category:
                                  dropdownValue == 'Entrada' ? true : false,
                            );
                            if (widget.model != null) {
                              widget.controller
                                  .updateTransaction(newTransaction!);
                            } else {
                              widget.controller
                                  .createTransaction(newTransaction!);
                            }
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
