import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/goals_card/goal_form.dart';
import 'package:porkinio/app/features/goals_card/goals_card_controller.dart';
import 'package:porkinio/app/features/goals_card/goals_card_model.dart';

class GoalsCard extends StatelessWidget {
  GoalsCard({
    Key? key,
    required this.goalsCardController,
  }) : super(key: key);

  final GoalsCardController goalsCardController;
  GoalsCardModel? goalsCardModel;
  List<GoalsCardModel> goalsCards = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GoalsCardModel>>(
      stream: goalsCardController.readAllGoals().map(
            (event) => goalsCards = event,
          ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Encontramos um erro: "${snapshot.error}"');
        } else if (snapshot.hasData) {
          for (var goal in [...goalsCards]) {
            return AnimatedBuilder(
              animation: goalsCardController,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        // ICONE DE OPÇÕES
                        top: -8,
                        right: 8,
                        child: IconButton(
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => Center(
                                child: GoalForm(
                                  goalsCardModel: goalsCardModel,
                                  goalsCardController: goalsCardController,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        // ÁREA DO CARD
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.2,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FittedBox(
                                      // VALOR
                                      child: Text(
                                        'R\$ ${goal.amount.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    FittedBox(
                                      // DESCRIÇÃO
                                      child: Text(
                                        goal.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              // BARRA DE PROGRESSO
                              elevation: 4,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.4 *
                                        ((goal.amount) /
                                            400), // TODO: PEGAR VALOR DA CARTEIRA VIRTUAL
                                    height: MediaQuery.of(context).size.height *
                                        0.018,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            // BORDA DA IMAGEM
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).cardTheme.color,
                            ),
                            height: MediaQuery.of(context).size.width * 0.19,
                            width: MediaQuery.of(context).size.width * 0.19,
                          ),
                          ClipRRect(
                            // IMAGEM
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.width * 0.18,
                              width: MediaQuery.of(context).size.width * 0.18,
                              image: NetworkImage(goal.networkImage),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
