import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import '../../../../core/widgets/modified_container.dart';

class ExpansionChild extends StatelessWidget {
  const ExpansionChild(
      {required this.title,
      required this.value,
      this.valueColor,
      this.color,
      super.key});
  final Color? valueColor, color;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      padding: const EdgeInsets.symmetric(vertical: 7),
      color: color ?? Theme.of(context).primaryColor.withOpacity(0.08),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: AppFontFamily.regular,
                fontSize: 14.sp,
                color: Theme.of(context).primaryColor.withOpacity(0.80),
              ),
            ),
          ),
          // const Gap(15) ,
          Flexible(
            child: Text(
              ' $value',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: AppFontFamily.regular,
                  fontSize: 14.sp,
                  color: valueColor),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpansionWidget extends StatefulWidget {
  const ExpansionWidget(
      {required this.title,
      required this.text,
      required this.children,
      this.leading,
      super.key});
  final Widget? leading;
  final String title, text;
  final List<Widget> children;

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                dense: true,
                childrenPadding: EdgeInsets.zero,
                tilePadding: EdgeInsets.zero,
                initiallyExpanded: false,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: AppFontFamily.regular,
                          color: AppColors.greyTextColor),
                    ),
                    const Gap(8),
                    Icon((state is ExpansionChangeState) && state.isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios),
                  ],
                ),
                title: Row(
                  children: [
                    widget.leading ?? const SizedBox.shrink(),
                    const Gap(8),
                    Text(
                      widget.title,
                      style: TextStyle(fontFamily: AppFontFamily.regular),
                    )
                  ],
                ),
                children: widget.children,
                onExpansionChanged: (value) {
                  context
                      .read<ProfileBloc>()
                      .add(ExpansionChangeEvent(isExpanded: value));
                },
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
//

class LinkedAccounts extends StatefulWidget {
  const LinkedAccounts({super.key});

  @override
  _LinkedAccountsState createState() => _LinkedAccountsState();
}

class _LinkedAccountsState extends State<LinkedAccounts> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Linked Accounts'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ExpansionTile(
          leading: Icon(Icons.link),
          title: Text('Linked Accounts'),
          trailing: Text('3 accounts'),
          children: [
            AccountTile(
              profileImage:
                  'assets/shotpulse.png', // Replace with your image asset or network image
              name: 'ShotPulse',
              username: '@username',
              iconColor: Colors.green,
              initials: 'Δ',
            ),
            AccountTile(
              profileImage: 'assets/coachv.png',
              name: 'Coach V',
              username: '@username',
              iconColor: Colors.orange,
              initials: 'CV',
            ),
            AccountTile(
              profileImage: 'assets/rt.png',
              name: 'RT',
              username: '@username',
              iconColor: Colors.blue,
              initials: 'RT',
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final String profileImage;
  final String name;
  final String username;
  final Color iconColor;
  final String initials;

  const AccountTile({
    super.key,
    required this.profileImage,
    required this.name,
    required this.username,
    required this.iconColor,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImage),
        child: Text(initials),
      ),
      title: Text(name),
      subtitle: Text(username),
      trailing: TextButton(
        onPressed: () {
          // Handle remove action here
        },
        child: const Text(
          'Remove',
          style: TextStyle(color: Colors.orange),
        ),
      ),
    );
  }
}
