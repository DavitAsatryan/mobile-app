part of values;

class Lists {
  static List menuItems = [
    'assets/icons/ic_diagnostics.svg',
    'assets/icons/ic_medical.svg',
    'assets/icons/ic_care.svg',

    //
    //     'keywords.medical'.tr(),
    //     'keywords.care'.tr(),
    //     'keywords.pharmacy'.tr(),
    //     'keywords.allServices'.tr(),
  ];

  static List gradientList = [
    const LinearGradient(colors: [
      AppColors.darkBlue,
      AppColors.menuPharmacyItemColor,
    ]),
    const LinearGradient(colors: [
      AppColors.menuPharmacyItemColor,
      AppColors.menuMedicalItemColor,
    ])
  ];

  static List<Color> menuItemColors = [
    AppColors.menuMedicalItemColor,
    AppColors.menuDiagnosticItemColor,
    AppColors.menuCareItemColor,
    AppColors.menuPharmacyItemColor,
    AppColors.menuAllItemColor,
  ];


  static List pharmacyList = [
    {'title': 'Headache', 'icon': 'assets/icons/ic_bundle.svg'},
    {'title': 'Nausea', 'icon': 'assets/icons/ic_pharmacy.svg'},
    {'title': 'Dug', 'icon': 'assets/icons/ic_care.svg'},
    {'title': 'Headache', 'icon': 'assets/icons/ic_bundle.svg'},
    {'title': 'Nausea', 'icon': 'assets/icons/ic_pharmacy.svg'},
    {'title': 'Dug', 'icon': 'assets/icons/ic_care.svg'},
  ];

  static List<String> languages = [
    'languages_do_not_translate.english'.tr(),
    'languages_do_not_translate.russian'.tr(),
    'languages_do_not_translate.armenian'.tr()
  ];
}
