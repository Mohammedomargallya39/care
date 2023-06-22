import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../resources/assets.gen.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Lottie.asset(
          Assets.images.lotti.loading,
            height: 20.h,
            width: 40.w
          ),
        );
  }
}
