import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:fluent_ui/fluent_ui.dart';

class ThemeApp {
  static lightTheme() {
    return FluentThemeData(
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent),
      buttonTheme: ButtonThemeData(
          filledButtonStyle: ButtonStyle(
              backgroundColor: ButtonState.all(Palette.secondColor))),
      scaffoldBackgroundColor: Colors.white,
      shadowColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
