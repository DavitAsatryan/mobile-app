import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'keywords.cards',
        toolBarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Observer(
          builder: (_) => checkoutState.storeState.state == StoreStates.loading
              ? Loading(
                  color: Colors.transparent,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: checkoutState.cardsList.length,
                  itemBuilder: (context, index) => checkoutState
                          .cardsList.isEmpty
                      ? Center(
                          child: Text(
                            'noCards',
                            style:
                                TextStyle(color: AppColors.black, fontSize: 20),
                          ).tr(),
                        )
                      : Dismissible(
                          key: Key(UniqueKey().toString()),
                          background: Container(),
                          secondaryBackground: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'delete',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800),
                                  ).tr(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: AppColors.anotherPurple,
                                  )
                                ],
                              ),
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            checkoutState.deleteCard(index);
                          },
                          child: _BankCard(
                            colors: [
                              AppColors.purpleDots,
                              AppColors.purpleLight,
                            ],
                            cardNumber:
                                checkoutState.cardsList[index].maskedNumber,
                            cardName: checkoutState.cardsList[index].cardholderName,
                            date: '12 22',
                          ),
                        ),
                ),
        ),
      ),
    );
  }

  Future<void> getInfo() async {
    await checkoutState.getCards();
    print('oooooooooooo ${checkoutState.cardsList.isEmpty}');
  }
}

class _BankCard extends StatelessWidget {
  final List<Color> colors;
  final String cardName;
  final String cardNumber;
  final String date;

  const _BankCard({
    required this.colors,
    Key? key,
    required this.cardName,
    required this.cardNumber,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Material(
        elevation: 15,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: colors,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  cardNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: AppColors.grey100.withOpacity(0.9),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
