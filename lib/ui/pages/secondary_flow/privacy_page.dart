import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'keywords.privacy',
        toolBarHeight: 50,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: _privacySections
                      .map(
                        (e) => _PrivacyTile(
                          label: e.name,
                          privacyCategories: e.privacySections,
                          isOpen: e.isOpen,
                          onPressed: () {
                            e.isOpen = !e.isOpen;
                            setState(() {});
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PrivacyTile extends StatelessWidget {
  final String label;
  final List<PrivacySection> privacyCategories;
  final bool isOpen;
  final VoidCallback onPressed;

  _PrivacyTile({
    required this.label,
    required this.privacyCategories,
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
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.dashboardTextColor,
                  ),
                ),
              ),
              SvgPicture.asset(
                isOpen
                    ? 'assets/icons/ic_minus.svg'
                    : 'assets/icons/ic_bold_plus.svg',
                color: AppColors.dashboardTextColor,
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
          thickness: 1.5,
          color: AppColors.dividerColor,
        ),
        Visibility(
          visible: isOpen,
          child: Column(
            children: privacyCategories
                .map((e) => _PrivacySection(privacySection: e))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _PrivacySection extends StatefulWidget {
  final PrivacySection privacySection;

  _PrivacySection({
    required this.privacySection,
    Key? key,
  }) : super(key: key);

  @override
  State<_PrivacySection> createState() => _PrivacySectionState();
}

class _PrivacySectionState extends State<_PrivacySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            widget.privacySection.isOpen = !widget.privacySection.isOpen;
            setState(() {});
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.privacySection.title,
                  style: TextStyle(
                    color: AppColors.textDarkPurpleColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                widget.privacySection.isOpen
                    ? 'assets/icons/ic_minus.svg'
                    : 'assets/icons/ic_bold_plus.svg',
                color: AppColors.textDarkPurpleColor,
              ),
              // Icon(
              //   widget.privacySection.isOpen ? Icons.remove : Icons.add,
              //   size: 28,
              //   color: AppColors.dashboardTextColor,
              //
              // ),
            ],
          ),
        ),
        Visibility(
          visible: widget.privacySection.isOpen,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.privacySection.description,
            ),
          ),
        ),
        Divider(
          color: AppColors.dividerColor,
          height: 20,
        ),
      ],
    );
  }
}

class PrivacySection {
  final String title;
  final String description;
  bool isOpen;

  PrivacySection({
    required this.title,
    required this.description,
    required this.isOpen,
  });
}

class PrivacyCategory {
  final String name;
  final List<PrivacySection> privacySections;
  bool isOpen;

  PrivacyCategory({
    required this.name,
    required this.privacySections,
    required this.isOpen,
  });
}

List<PrivacyCategory> _privacySections = [
  PrivacyCategory(
    name: 'privacy_policy'.tr(),
    privacySections: _questionAndAnswers,
    isOpen: false,
  ),
];

List<PrivacySection> _questionAndAnswers = [
  PrivacySection(
    title: 'pp1'.tr(),
    description: 'ans1'.tr(),
    isOpen: false,
  ),
  PrivacySection(
    title: 'pp2'.tr(),
    description: 'ans2'.tr(),
    isOpen: false,
  ),
  PrivacySection(
    title: 'pp3'.tr(),
    description: 'ans3'.tr(),
    isOpen: false,
  ),
  PrivacySection(
    title: 'pp4'.tr(),
    description: 'ans4'.tr(),
    isOpen: false,
  ),
  PrivacySection(
    title: 'pp5'.tr(),
    description: 'ans5'.tr(),
    isOpen: false,
  ),
  PrivacySection(
    title: 'pp6'.tr(),
    description: 'ans6'.tr(),
    isOpen: false,
  ),
  PrivacySection(
    title: 'pp7'.tr(),
    description: 'ans7'.tr(),
    isOpen: false,
  ),
  PrivacySection(
    title: 'pp8'.tr(),
    description: 'ans8'.tr(),
    isOpen: false,
  ),
];
