
import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:cursus_app/store/personal_data_state/personal_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  final personalDataState = GetIt.I<PersonalDataState>();
  String name = '';
  String surname = '';

  @override
  void initState() {
    super.initState();
    personalDataState.getUser();
    personalDataState.selectedImage = null;
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    name = await StorageHelper.getUserName();
    surname = await StorageHelper.getUserSurname();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => GestureDetector(
            onTap: () async {
              await personalDataState.pickImage();
              getUserInfo();
            },
            child: personalDataState.user != null
                ? Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: personalDataState.selectedImage != null
                              ? Image.file(
                                  personalDataState.selectedImage!,
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: 90,
                                )
                              : Image.network(
                                  personalDataState.user!.profilePicture != null
                                      ? 'https://api.cursus.am/${personalDataState.user!.profilePicture}'
                                      : 'https://api.cursus.am/profile_icon.png',
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: 90,
                                ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                surname,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox()));

    // personalDataState.user != null
    //     ? SizedBox(
    //         height: 100,
    //         width: 100,
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(80),
    //           child: personalDataState.selectedImage != null
    //               ? Image.file(
    //                   personalDataState.selectedImage!,
    //                   fit: BoxFit.cover,
    //                 )
    //               : personalDataState.user!.imageUrl == null
    //                   ? const SizedBox()
    //                   : Image.network(
    //                       personalDataState.user!.imageUrl!,
    //                       fit: BoxFit.cover,
    //                     ),
    //         ),
    //       )
    // : const SizedBox(),
    // ),
    // );
  }
}
