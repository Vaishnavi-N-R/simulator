import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions, // Nullable now
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = true,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions; // Nullable
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:0),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: leadingIcon != null
            ? IconButton(
                // Show the leadingIcon if provided
                onPressed: leadingOnPressed ?? () => Get.back(),
                icon: Icon(leadingIcon),
              )
            : showBackArrow // Otherwise, show the back arrow if it's set to true
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  )
                : null,
        title: title,
        actions: actions ?? [], // Fallback to empty list if actions is null
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
