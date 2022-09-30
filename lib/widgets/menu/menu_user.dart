import 'package:flowy_infra/image.dart';
import 'package:flowy_infra/size.dart';
import 'package:flowy_infra/theme.dart';
import 'package:flowy_infra_ui/style_widget/text.dart';
import 'package:flowy_infra_ui/widget/spacing.dart';
import 'package:flutter/material.dart';

class MenuUser extends StatelessWidget {
  MenuUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _renderAvatar(context),
            const HSpace(10),
            _renderUserName(context),
            const Spacer(),
            _renderSettingsButton(context),
            //ToDo: when the user is allowed to create another workspace,
            //we get the below block back
            //_renderDropButton(context),
          ],
    );
  }

  Widget _renderAvatar(BuildContext context) {

    return SizedBox(
      width: 25,
      height: 25,
      child: ClipRRect(
          borderRadius: Corners.s5Border,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: svgWidget('deer'),
          )),
    );
  }

  Widget _renderUserName(BuildContext context) {
    return FlowyText("name", fontSize: 12);
  }

  Widget _renderSettingsButton(BuildContext context) {
    return Tooltip(
      message: "LocaleKeys.settings_menu_open.tr()",
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Container();
              // return SettingsDialog(userProfile);
            },
          );
        },
        icon: SizedBox.square(
          dimension: 20,
          child: svgWidget("home/settings", color: Colors.black26),
        ),
      ),
    );
  }
  //ToDo: when the user is allowed to create another workspace,
  //we get the below block back
  // Widget _renderDropButton(BuildContext context) {
  //   return FlowyDropdownButton(
  //     onPressed: () {
  //       debugPrint('show user profile');
  //     },
  //   );
  // }
}
