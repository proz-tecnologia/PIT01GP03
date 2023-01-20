import 'package:flutter/material.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_form.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';
import 'package:porkinio/locator.dart';

class PiggyBankCardEditButton extends StatefulWidget {
  final PiggyBankModel model;
  const PiggyBankCardEditButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  static const route = '/home-page';

  @override
  State<PiggyBankCardEditButton> createState() =>
      _PiggyBankCardEditButtonState();
}

class _PiggyBankCardEditButtonState extends State<PiggyBankCardEditButton> {
  final controller = locator.get<PiggyBankController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Editar'),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: PiggyBankForm(
                controller: controller,
                model: widget.model,
              ),
            ),
          );
        },
      ),
    );
  }
}
