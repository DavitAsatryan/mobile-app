

//class PharmacyPage extends StatefulWidget {
//   const PharmacyPage({Key? key}) : super(key: key);
//
//   @override
//   _PharmacyPageState createState() => _PharmacyPageState();
// }
//
// class _PharmacyPageState extends State<PharmacyPage> {
//   TextEditingController searchController = TextEditingController();
//   var pharmacyState = PharmacyState();
//
//   @override
//   void initState() {
//     pharmacyState.init();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GradientContainer(
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         resizeToAvoidBottomInset: false,
//         appBar: CustomAppBar(
//           title: 'keywords.pharmacy'.tr(),
//           titleSize: 25,
//           textAndIconColor: AppColors.white,
//           padding: EdgeInsets.symmetric(horizontal: 25),
//           trailingIcon: CloseIcon(),
//         ),
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Image.asset(
//                 'assets/illustrations/ill_back.png',
//               ),
//               Positioned(
//                   right: -90,
//                   bottom: 0,
//                   width: MediaQuery.of(context).size.height / 2.5,
//                   height: MediaQuery.of(context).size.height / 2.5,
//                   child: SvgPicture.asset(
//                     'assets/icons/ic_pharmacy.svg',
//                     color: AppColors.black.withOpacity(.1),
//                   )),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 left: 0,
//                 bottom: 0,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             Observer(
//                               builder: (_) {
//                                 return SearchBox(
//                                   borderColor: Colors.transparent,
//                                   onChanged: (text) {
//                                     pharmacyState.search(text);
//                                   },
//                                   textEditingController: searchController,
//                                   hintText: 'search_by_pharmacy'.tr(),
//                                   borderRadius: pharmacyState.isSearching
//                                       ? const BorderRadius.only(
//                                           topRight: Radius.circular(6),
//                                           topLeft: Radius.circular(6))
//                                       : BorderRadius.circular(6),
//                                   fontColor: AppColors.black400,
//                                   fillColor: pharmacyState.isSearching
//                                       ? AppColors.white
//                                       : AppColors.white.withOpacity(.25),
//                                   hintStyle: const TextStyle(
//                                       fontSize: 16, color: AppColors.deepestPurple),
//                                 );
//                               },
//                             ),
//                             Observer(
//                               builder: (_) {
//                                 return _SearchOverlay(
//                                   isSearching: pharmacyState.isSearching,
//                                   searchBoxContent: searchController.text,
//                                   scrollController: ScrollController(),
//                                   dataList: [],
//                                   // dataList: Lists.servicesDataList,
//                                 );
//                               },
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'do_you_have_pain'.tr(),
//                               style: Styles.boldTextStyle.copyWith(
//                                   color: AppColors.white, fontSize: 22),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 IntrinsicWidth(
//                                   child: SearchBox(
//                                     filled: false,
//                                     hintText: 'search_anything'.tr(),
//                                     fontColor: AppColors.black,
//                                     suffixIcon: const SizedBox(),
//                                     onChanged: (val) {
//                                       pharmacyState.searchOnPains(val);
//                                     },
//                                   ),
//                                 ),
//                                 Transform.translate(
//                                     offset: const Offset(-40, 0),
//                                     child: UnconstrainedBox(
//                                         child: SvgPicture.asset(
//                                             'assets/icons/ic_search.svg')))
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 100,
//                         child: Observer(
//                           builder: (_) {
//                             return pharmacyState.painList.isEmpty
//                                 ? Center(
//                                     child: Text('no_results_found'.tr()),
//                                   )
//                                 : ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     itemBuilder: (listContext, index) {
//                                       return Container(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 15),
//                                         width: 100,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           color: AppColors.white,
//                                         ),
//                                         margin: EdgeInsets.only(
//                                             left: index == 0 ? 25 : 7,
//                                             right: 7),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               pharmacyState.painList[index]
//                                                   ['title'],
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             SvgPicture.asset(
//                                               pharmacyState.painList[index]
//                                                   ['icon'],
//                                               width: 35,
//                                               height: 35,
//                                             )
//                                           ],
//                                         ),
//                                       );
//                                     },
//                                     itemCount: pharmacyState.painList.length,
//                                   );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _SearchOverlay extends StatelessWidget {
//   final bool isSearching;
//   final String searchBoxContent;
//   final List<ServiceModel> dataList;
//   final ScrollController scrollController;
//
//   const _SearchOverlay({
//     required this.isSearching,
//     required this.searchBoxContent,
//     required this.dataList,
//     required this.scrollController,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Visibility(
//         visible: isSearching,
//         child: Container(
//           height: MediaQuery.of(context).size.height / 3,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: AppColors.accentColor.withOpacity(.8),
//               borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8))),
//           child: Observer(
//             builder: (_) {
//               return dataList.isEmpty
//                   ? Center(
//                       child: Text('no_results_found'.tr()),
//                     )
//                   : ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: dataList.length,
//                       controller: scrollController,
//                       itemBuilder: (listContext, index) {
//                         final title = dataList[index].name;
//                         final price = dataList[index].price ?? '0';
//                         final type = dataList[index].description;
//                         if (title
//                                 .toLowerCase()
//                                 .contains(searchBoxContent.toLowerCase()) ||
//                             price.contains(searchBoxContent) ||
//                             type!
//                                 .toLowerCase()
//                                 .contains(searchBoxContent.toLowerCase())) {
//                           return Observer(
//                             builder: (_) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 5),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(dataList[index].name),
//                                         const Spacer(),
//                                         Text(
//                                           'T3',
//                                           style: TextStyle(
//                                               color: AppColors.black100
//                                                   .withOpacity(.4)),
//                                         ),
//                                         const SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text(
//                                           '$price \$',
//                                           style: Styles.boldTextStyle
//                                               .copyWith(fontSize: 13),
//                                         ),
//                                       ],
//                                     ),
//                                     Container(
//                                       width: double.infinity,
//                                       height: 1,
//                                       color: AppColors.primaryText2
//                                           .withOpacity(.2),
//                                       margin: const EdgeInsets.symmetric(
//                                           vertical: 20),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                         }
//                         return const SizedBox();
//                       },
//                     );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//}
