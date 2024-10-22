import 'package:flutter/material.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top:TDeviceUtils.getAppBarHeight(),right: TSizes.defaultspace,child: TextButton(onPressed: () {},child:Text('Skip')));
  }
}