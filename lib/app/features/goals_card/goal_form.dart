import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/features/goals_card/goals_card_controller.dart';
import 'package:porkinio/app/features/goals_card/goals_card_model.dart';

class GoalForm extends StatefulWidget {
  final GoalsCardController goalsCardController; // TODO: REVER SE USA O LOCATOR
  final GoalsCardModel? goalsCardModel;

  const GoalForm({
    Key? key,
    required this.goalsCardController,
    this.goalsCardModel,
  }) : super(key: key);

  static const routeGoalForm = '/goal-form';

  @override
  State<GoalForm> createState() => _GoalFormState();
}

const List<String> list = <String>['Entrada', 'Saída'];

class _GoalFormState extends State<GoalForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  final _networkImageController = TextEditingController();

  String? dropdownValue;
  GoalsCardModel? newGoalsCardModel;

  @override
  void initState() {
    super.initState();
    newGoalsCardModel = widget.goalsCardModel;
    _titleController.text = widget.goalsCardModel?.title ?? '';
    _amountController.text = widget.goalsCardModel?.amount.toString() ?? '';
    _networkImageController.text =
        widget.goalsCardModel?.networkImage.toString() ?? '';
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
        // TODO: MUDAR CASO SEJA PARA CADASTRAR UMA NOVA TRANSAÇÃO OU EDITAR UMA EXISTENTE
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
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
                          newGoalsCardModel = GoalsCardModel(
                            id: widget.goalsCardModel?.id,
                            title: _titleController.text,
                            amount: double.parse(_amountController.text),
                            networkImage: _networkImageController.text,
                          );
                          if (widget.goalsCardModel != null) {
                            widget.goalsCardController
                                .updateGoal(newGoalsCardModel!);
                          } else {
                            widget.goalsCardController
                                .createGoal(newGoalsCardModel!);
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
    );
  }
}
