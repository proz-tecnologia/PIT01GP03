import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionForm extends StatefulWidget {
  final TransactionListController transactionListController;
  final TransactionModel? transactionModel;

  const TransactionForm({
    Key? key,
    required this.transactionListController,
    this.transactionModel,
  }) : super(key: key);

  static const routeTransactionForm = '/transaction-form';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

const List<String> list = <String>['Entrada', 'Saída'];

class _TransactionFormState extends State<TransactionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();
  final _dateController = TextEditingController();

  String? dropdownValue;
  TransactionModel? newTransactionModel;

  @override
  void initState() {
    super.initState();
    newTransactionModel = widget.transactionModel;
    _titleController.text = widget.transactionModel?.title ?? '';
    _ammountController.text = widget.transactionModel?.ammount.toString() ?? '';
    _dateController.text = widget.transactionModel?.date.toString() ?? '';
    dropdownValue =
        newTransactionModel?.category == false ? list.last : list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: (MediaQuery.of(context).size.height * 0.03)),
                CustomFormField(
                  formFieldLabelText: 'Titulo',
                  formFieldBorder: false,
                  formFieldValidator: CustomFormFieldValidator.validateNull,
                  formFieldController: _titleController,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.03)),
                CustomFormField(
                  formFieldLabelText: 'Valor',
                  formFieldValidator: CustomFormFieldValidator.validateNull,
                  formFieldBorder: false,
                  formFieldController: _ammountController,
                  formFieldKeyboardType: TextInputType.number,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.03)),
                TextFormField(
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
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        _dateController.text = formattedDate;
                      });
                    }
                  },
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.05)),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    //elevation: 16,
                    style: const TextStyle(color: Colors.black54),
                    underline: Container(
                      height: 2,
                      color: Colors.black54,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [Text(value)],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate()) {
            newTransactionModel = TransactionModel(
              id: widget.transactionModel?.id,
              title: _titleController.text,
              ammount: double.parse(_ammountController.text),
              date: DateTime.parse(_dateController.text),
              category: dropdownValue == 'Entrada' ? true : false,
            );

            if (widget.transactionModel != null) {
              widget.transactionListController
                  .updateTransaction(newTransactionModel!);
            } else {
              widget.transactionListController
                  .createTransaction(newTransactionModel!);
            }

            Navigator.pop(context);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
