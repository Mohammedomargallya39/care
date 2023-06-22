/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:care/core/util/resources/translation_manager.dart';
import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/antonio-Regular.ttf
  String get antonioRegular => 'assets/fonts/antonio-Regular.ttf';

  /// File path: assets/fonts/nunito-Medium.ttf
  String get nunitoMedium => 'assets/fonts/nunito-Medium.ttf';

  /// File path: assets/fonts/poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/poppins-Light.ttf';

  /// File path: assets/fonts/tajawal-Regular.ttf
  String get tajawalRegular => 'assets/fonts/tajawal-Regular.ttf';

  /// List of all assets
  List<String> get values =>
      [antonioRegular, nunitoMedium, poppinsLight, tajawalRegular];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesLottiGen get lotti => const $AssetsImagesLottiGen();
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}


class $AssetsImagesLottiGen {
  const $AssetsImagesLottiGen();

  /// File path: assets/images/lotti/loading.json
  String get loading => 'assets/images/lotti/loading.json';


  /// List of all assets
  List<String> get values => [loading];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();


  /// File path: assets/images/png/up.png
  String get up => 'assets/images/png/up.png';

  /// File path: assets/images/png/logo.png
  String get logo => 'assets/images/png/logo.png';

  /// File path: assets/images/png/bars.png
  String get bars => 'assets/images/png/bars.png';

  /// File path: assets/images/png/hi.png
  String get hi => 'assets/images/png/hi.png';

  /// File path: assets/images/png/doc.png
  String get doc => 'assets/images/png/doc.png';

  /// File path: assets/images/png/microScope.png
  String get microScope => 'assets/images/png/microScope.png';

  /// File path: assets/images/png/capsules.png
  String get capsules => 'assets/images/png/capsules.png';

  /// File path: assets/images/png/virus.png
  String get virus => 'assets/images/png/virus.png';

  /// File path: assets/images/png/virusButton.png
  String get virusButton => 'assets/images/png/virus_button.png';

  /// List of all assets
  List<String> get values => [
    up,
    hi
  ];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  String get arrowBack => 'assets/images/svg/arrow_back.svg';
  String get email => 'assets/images/svg/email.svg';
  String get lock => 'assets/images/svg/lock.svg';
  String get login => 'assets/images/svg/login.svg';
  String get user => 'assets/images/svg/user.svg';
  String get search => 'assets/images/svg/search.svg';

  /// List of all assets
  List<String> get values => [
    arrowBack,
    email,
    lock,
    login,
    user,
    search
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}