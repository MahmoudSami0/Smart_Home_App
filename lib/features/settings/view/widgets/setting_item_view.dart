import 'package:flutter/material.dart';
import 'package:smarthome/core/utils/widgets/custom_text.dart';
import 'package:smarthome/features/auth/profile/Model/icon_model.dart';

class SettingItemView extends StatelessWidget {
  const SettingItemView({Key? key, required this.item, this.onTap, this.isLoading = false}) : super(key: key);

  final IconModel item;
  final void Function()? onTap;
 final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isLoading ? const Center(child: CircularProgressIndicator(),) : Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
              
                child: Image.asset(item.iconPath,width: 30,height: 30,)),
            CustomText(text: item.itemName,fontSize: 18,),
            const Icon(
                Icons.arrow_forward_ios_outlined
            )
          ],
        ),
      ),
    );
  }
}
