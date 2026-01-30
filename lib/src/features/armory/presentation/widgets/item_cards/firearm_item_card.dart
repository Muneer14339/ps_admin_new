// lib/armory/presentation/widgets/item_cards/firearm_item_card.dart
import 'package:flutter/material.dart';
import '../../../../../core/enum/tab_enums.dart';
import '../../../domain/entities/armory_firearm.dart';
import '../common/common_delete_dilogue.dart';
import '../common/common_item_card.dart';

class FirearmItemCard extends StatelessWidget {
  final ArmoryFirearm firearm;
  final String userId;
  final bool showDelete;
  final String? title;

  const FirearmItemCard({
    super.key,
    required this.firearm,
    required this.userId,
    this.showDelete = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 Yeh decide karega kis text ko show karna hai (title ya caliber)
    final String detailText = title?.isNotEmpty == true
        ? title!
        : (firearm.caliber?.isNotEmpty == true ? firearm.caliber! : 'N/A');

    return CommonItemCard(
      item: firearm,
      title: '${firearm.brand} ${firearm.model}',
      showDelete: showDelete,
      details: [
        CardDetailRow(
          icon: 'assets/icons/armory_icons/firearm.png',
          text: detailText,
        ),
        if (firearm.nickname.isNotEmpty)
          CardDetailRow(
            icon: 'assets/icons/armory_icons/nickName.png',
            text: firearm.nickname,
          ),
      ],
      onDelete: showDelete
          ? () => CommonDialogs.showDeleteDialog(
        context: context,
        userId: userId,
        armoryType: ArmoryTabType.firearms,
        itemName: firearm.nickname,
        item: firearm,
      )
          : null,
    );
  }
}
