import 'package:flutter/material.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/locator.dart';

class PiggyBankCardDeleteButton extends StatefulWidget {
  final PiggyBankModel model;

  const PiggyBankCardDeleteButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  static const route = '/home-page';

  @override
  State<PiggyBankCardDeleteButton> createState() =>
      _PiggyBankCardDeleteButtonState();
}

class _PiggyBankCardDeleteButtonState extends State<PiggyBankCardDeleteButton> {
  final controller = locator.get<PiggyBankController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Deletar'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Deseja excluir esse Porkinio?'),
              content: Text(
                'Essa ação não poderá ser desfeita.',
                style: Theme.of(context).textTheme.overline?.copyWith(
                      color: Colors.redAccent,
                    ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  child: const Text('Confirmar'),
                  onPressed: () async {
                    Navigator.of(context).pushReplacementNamed(HomePage.route);
                    await controller.deletePiggyBank(widget.model);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
