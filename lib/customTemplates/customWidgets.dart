import 'package:flutter/material.dart';

import 'colours.dart';
import 'themes.dart';

class CircleButton extends MaterialButton {
  final double size;
  const CircleButton({
    Key key,
    @required VoidCallback onPressed,
    VoidCallback onLongPress,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    @required this.size,
    @required Widget child,
  }) : assert(clipBehavior != null),
       assert(autofocus != null),
       super(
         key: key,
         onPressed: onPressed,
         //onLongPress: onLongPress,
         onHighlightChanged: onHighlightChanged,
         textTheme: textTheme,
         textColor: textColor,
         disabledTextColor: disabledTextColor,
         color: color,
         disabledColor: disabledColor,
         focusColor: focusColor,
         hoverColor: hoverColor,
         highlightColor: highlightColor,
         splashColor: splashColor,
         colorBrightness: colorBrightness,
         padding: padding,
         clipBehavior: clipBehavior,
         focusNode: focusNode,
         autofocus: autofocus,
         materialTapTargetSize: materialTapTargetSize,
         child: child,
      );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);

    return Container (
      width: size,
      height: size,
      padding: EdgeInsets.all(size/18),

      decoration: new BoxDecoration(
        border: Border.all(color: buttonTheme.getFillColor(this), width: 2.0),
        shape: BoxShape.circle,
      ),

      child: RawMaterialButton(
        onPressed: onPressed,
        //onLongPress: onLongPress,
        onHighlightChanged: onHighlightChanged,

        /* Some bugs in setting localized button theme --- temporary fix, need to fix later */

        fillColor: buttonTheme.getFillColor(this),
        textStyle: theme.textTheme.button,
        focusColor: buttonTheme.getFocusColor(this),
        hoverColor: buttonTheme.getHoverColor(this),
        highlightColor: buttonTheme.getHighlightColor(this),
        splashColor: buttonTheme.getSplashColor(this),

        elevation: buttonTheme.getElevation(this),
        focusElevation: buttonTheme.getFocusElevation(this),
        hoverElevation: buttonTheme.getHoverElevation(this),
        highlightElevation: buttonTheme.getHighlightElevation(this),
        disabledElevation: buttonTheme.getDisabledElevation(this),

        padding: buttonTheme.getPadding(this),
        constraints: buttonTheme.getConstraints(this),
        shape: new CircleBorder(),
        materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
        animationDuration: buttonTheme.getAnimationDuration(this),
        child: child,  
      ),      
    );
  }
}

class ThemedButton extends StatelessWidget {
  final double size;
  const ThemedButton({Key key, this.text, this.callback,this.icon, @required this.size}) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      child: (icon!= null)? icon : Text(text),
      onPressed: callback,
      color: purple[500],
      size: size,
      disabledColor: purple[200],
      padding: EdgeInsets.all(3.0),
    );
  }
}

Widget backBtn(VoidCallback callback) {
  return FlatButton(
    child: Row(
      children: [
        Icon(
          Icons.arrow_left,
          color: Colors.white,
        ),
        Container(
          padding: EdgeInsets.only(left: 5.0),
          child: Text(
            'BACK',
            style: mainTheme.textTheme.body1,
          ),
        ),
      ],
    ),
    onPressed: () => callback(),
  );
}