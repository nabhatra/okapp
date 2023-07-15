import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';

class Constant {
  static LinearGradient linearBackgroundColor = LinearGradient(colors: [
    HexColor.fromHex("#9b59b6"),
    HexColor.fromHex("#e74c3c"),
  ], end: AlignmentDirectional.bottomEnd, begin: AlignmentDirectional.topEnd);
}
