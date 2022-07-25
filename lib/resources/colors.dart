import 'dart:ui';

class AppColor{
  static Color primary = HexColor.fromHex("#FFFFFF");
  static Color secondary = HexColor.fromHex("#0F432D");
  static Color inputColor = const Color(0xff80000000);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
