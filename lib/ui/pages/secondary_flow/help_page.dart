import 'package:cursus_app/model/help_model/help_model.dart';
import 'package:cursus_app/model/help_response_model/help_response_model.dart';
import 'package:cursus_app/store/dashboard/dashboard_state.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  DashboardState dashboardState = GetIt.I<DashboardState>();
  List<HelpResponseModel> _questionCategories = [];

  bool isOpen = true;

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  Future<void> getInfo() async {
    if (dashboardState.helpResponseList.isEmpty) {
      await dashboardState.getHelpQuestions();
    }
    // _questionCategories.clear();
    // _questionCategories.addAll(dashboardState.helpResponseList);
    // for (int i = 0; i < dashboardState.helpResponseList.length; i++) {
    //   _questionCategories.add( HelpResponseModel(
    //     name: dashboardState.helpResponseList[i].name,
    //     children: dashboardState.helpResponseList[i].children,
    //     isOpen: isOpen,
    //   ),);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'keywords.help',
        textAndIconColor: AppColors.dashboardTextColor,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        toolBarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'howWeCanHelpYou',
                style: TextStyle(
                  fontSize: 28,
                  color: AppColors.dashboardTextColor,
                  fontWeight: FontWeight.w900,
                ),
              ).tr(),
              Divider(
                thickness: 1.5,
                height: 30,
              ),
              Observer(
                builder: (_) => Column(children: [
                  for (int i = 0;
                      i < dashboardState.helpResponseList.length;
                      i++)
                    _HelpTile(
                      label: dashboardState.helpResponseList[i].name,
                      questionAndAnswers:
                          dashboardState.helpResponseList[i].children,
                      isOpen: dashboardState.helpResponseList[i].isOpen!,
                      onPressed: () {
                        HelpResponseModel helpResponseModel = HelpResponseModel(
                            children:
                                dashboardState.helpResponseList[i].children,
                            name: dashboardState.helpResponseList[i].name,
                            isOpen:
                                !dashboardState.helpResponseList[i].isOpen!);

                        dashboardState.helpResponseList.removeAt(i);

                        dashboardState.helpResponseList
                            .insert(i, helpResponseModel);
                      },
                    ),
                ]

                    // dashboardState.helpResponseList
                    //     .map(
                    //       (e) => _HelpTile(
                    //         label: e.name,
                    //         questionAndAnswers: e.children,
                    //         isOpen: e.isOpen!,
                    //         onPressed: () => {
                    //         //  dashboardState.helpResponseList.clear(),
                    //           // for (int i = 0;
                    //           //     i < dashboardState.helpResponseList.length;
                    //           //     i++)
                    //           //   {
                    //           //     dashboardState.helpResponseList
                    //           //         .add(_questionCategories[i])
                    //           //   },
                    //           setState(() {}),
                    //         },
                    //       ),
                    //     )
                    //     .toList(),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HelpTile extends StatelessWidget {
  final String label;
  final List<HelpModel> questionAndAnswers;
  final bool isOpen;
  final VoidCallback onPressed;

  _HelpTile({
    required this.label,
    required this.questionAndAnswers,
    required this.isOpen,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDarkPurpleColor,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: SvgPicture.asset(
                  isOpen
                      ? 'assets/icons/ic_minus.svg'
                      : 'assets/icons/ic_bold_plus.svg',
                  color: AppColors.textDarkPurpleColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Divider(
          height: 30,
          thickness: 2.5,
          color: AppColors.grey350,
        ),
        Visibility(
          visible: isOpen,
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: questionAndAnswers.length,
              itemBuilder: (context, index) => _QuestionTile(
                questionAndAnswer: questionAndAnswers[index],
                isOpen: isOpen,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuestionTile extends StatelessWidget {
  final HelpModel questionAndAnswer;
  bool isOpen;

  _QuestionTile({
    required this.questionAndAnswer,
    required this.isOpen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                questionAndAnswer.question,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                isOpen = !isOpen;
                setState() {}
                ;
              },
              child: Icon(
                isOpen ? Icons.remove : Icons.add,
                size: 28,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Visibility(
          visible: isOpen,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              questionAndAnswer.answer,
            ),
          ),
        ),
        Divider(
          height: 30,
          thickness: 1.5,
        ),
      ],
    );
  }
}
