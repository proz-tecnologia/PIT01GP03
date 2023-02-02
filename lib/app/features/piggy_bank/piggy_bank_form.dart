import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';

class PiggyBankForm extends StatefulWidget {
  final PiggyBankController controller;
  final PiggyBankModel? model;

  const PiggyBankForm({
    Key? key,
    required this.controller,
    this.model,
  }) : super(key: key);

  static const routePiggyBankForm = '/piggy-bank-form';

  @override
  State<PiggyBankForm> createState() => _PiggyBankFormState();
}

class _PiggyBankFormState extends State<PiggyBankForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  final _networkImageController = TextEditingController();

  PiggyBankModel? newPiggyBank;

  @override
  void initState() {
    super.initState();
    newPiggyBank = widget.model;
    _titleController.text = widget.model?.title ?? '';
    _amountController.text = widget.model?.amount.toString() ?? '';
    _networkImageController.text = widget.model?.networkImage.toString() ??
        'https://i.imgur.com/Ac6Vbgj.png';
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
        title: const Text('Formulário do Porkinio'),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  CustomFormField(
                    labelText: 'URL da Imagem',
                    validator: CustomFormFieldValidator.validateNull,
                    controller: _networkImageController,
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
                            newPiggyBank = PiggyBankModel(
                              id: widget.model?.id,
                              title: _titleController.text,
                              amount: double.parse(_amountController.text),
                              networkImage: _networkImageController.text,
                            );
                            if (widget.model != null) {
                              widget.controller.updatePiggyBank(newPiggyBank!);
                            } else {
                              widget.controller.createPiggyBank(newPiggyBank!);
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
