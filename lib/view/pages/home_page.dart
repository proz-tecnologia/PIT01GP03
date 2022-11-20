import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_flutter/controllers/movement_controller.dart';
import 'package:projeto_flutter/view/components/card_account_balance.dart';
import 'package:projeto_flutter/view/pages/form_movement.dart';
import '../themes/app_colors.dart';
import '../components/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const home = '/';
  final movement = MovementController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
        actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(FormMovement.formMovement);
                },
                icon: const Icon(Icons.add))
          ],
      ),
      drawer: const DrawerCustom(),
      body: Column(
        children: [
          
             const CardAccountBalance(),
       
            SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.02),
                    ),
          
          Observer(
            builder: (context) {
            return Expanded(
              child: ListView.builder(
                itemCount: movement.movementListMobx.length,
                itemBuilder: ((context, index) => ListTile(
                      leading:
                          null, //const CircleAvatar(child: Icon(Icons.add),)
                      title: Text(movement.movementListMobx
                          .elementAt(index)
                          .description),
                      subtitle: Text(movement.movementListMobx
                          .elementAt(index)
                          .valor
                          .toString()),
                        
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              color: Colors.orange,
                            ),
                            IconButton(
                              onPressed: () {
                                movement.removeMovement(
                                    movement.movementListMobx.elementAt(index));
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            );
          })
        ],
      ),
    );
  }
}


 /*
            const CardGraphPerformance(),
            const SizedBox(
              height: 36,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CardGoalsSmallPrimary(),
                  SizedBox(width: 16),
                  CardGoalsSmallSecondary(),
                  SizedBox(width: 16),
                  CardGoalsSmallPrimary(),
                  SizedBox(width: 16),
                  CardGoalsSmallSecondary(),
                  SizedBox(width: 16),
                  CardGoalsSmallPrimary(),
                  SizedBox(width: 16),
                  CardGoalsSmallSecondary(),
                  
                ],
              ),
            ),*/