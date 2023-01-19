// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:porkinio/app/features/home/goals_card_model.dart';
// import 'package:porkinio/app/features/transaction_list/transaction_delete_button.dart';
// import 'package:porkinio/app/features/transaction_list/transaction_edit_button.dart';
// import 'package:porkinio/app/models/transaction_model.dart';

// Widget buildTransactionList(GoalsCardModel goalsCardModel) => Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 16,
//             ),
//             child: Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 Positioned(
//                   // ICONE DE OPÇÕES
//                   top: -8,
//                   right: 8,
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.more_horiz,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 SizedBox(
//                   // ÁREA DO CARD
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   height: MediaQuery.of(context).size.width * 0.4,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Card(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.4,
//                           height: MediaQuery.of(context).size.width * 0.2,
//                           padding: const EdgeInsets.all(8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               FittedBox(
//                                 // VALOR
//                                 child: Text(
//                                   title,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline6
//                                       ?.copyWith(
//                                         color: Colors.white,
//                                       ),
//                                 ),
//                               ),
//                               FittedBox(
//                                 // DESCRIÇÃO
//                                 child: Text(
//                                   'R\$ ${amount.toStringAsFixed(2)}',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .caption
//                                       ?.copyWith(
//                                         color: Colors.white,
//                                       ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Card(
//                         // BARRA DE PROGRESSO
//                         elevation: 4,
//                         child: Stack(
//                           alignment: Alignment.centerLeft,
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.4,
//                               height: MediaQuery.of(context).size.height * 0.02,
//                               color: Colors.white,
//                             ),
//                             Container(
//                               width: MediaQuery.of(context).size.width *
//                                   0.4 *
//                                   (amount),
//                               height:
//                                   MediaQuery.of(context).size.height * 0.018,
//                               color: AppColors.primary,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       // BORDA DA IMAGEM
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Theme.of(context).cardTheme.color,
//                       ),
//                       height: MediaQuery.of(context).size.width * 0.19,
//                       width: MediaQuery.of(context).size.width * 0.19,
//                     ),
//                     ClipRRect(
//                       // IMAGEM
//                       borderRadius: BorderRadius.circular(100),
//                       child: Image(
//                         fit: BoxFit.cover,
//                         height: MediaQuery.of(context).size.width * 0.18,
//                         width: MediaQuery.of(context).size.width * 0.18,
//                         image: NetworkImage(networkImage),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
