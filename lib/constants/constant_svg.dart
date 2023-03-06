import 'package:flutter_svg/flutter_svg.dart';

enum ConstantSVG {
  entrance0,
  entrance1,
  entrance2,
  login,
  signup,
}

extension ExtensionConstantSVG on ConstantSVG {
  SvgPicture get getSVG => SvgPicture.asset("assets/images/$name.svg");
  String get getAdressOfSVG => "assets/images/$name.svg";
}
