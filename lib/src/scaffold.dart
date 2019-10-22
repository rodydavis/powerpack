import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension ScaffoldUtils on Scaffold {
  Widget asResponsive({
    double tabletBp = 720,
    double desktopBp = 1200,
  }) {
    return LayoutBuilder(
      builder: (_, dimens) {
        if (dimens.maxWidth >= desktopBp) {
          // -- Desktop --
          return Material(
            child: Row(
              children: <Widget>[
                if (this?.drawer != null) ...[this.drawer],
                Expanded(
                  child: Scaffold(
                    key: this?.key,
                    appBar: this?.appBar,
                    floatingActionButton: this?.floatingActionButton,
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.startTop,
                    body: Row(
                      children: <Widget>[
                        Expanded(child: this?.body ?? Container()),
                        if (this?.endDrawer != null) ...[this.endDrawer],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (dimens.maxWidth >= tabletBp) {
          // -- Tablet --
          return Scaffold(
            key: this?.key,
            appBar: this?.appBar,
            endDrawer: this?.endDrawer,
            floatingActionButton: this?.floatingActionButton,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            body: Row(
              children: <Widget>[
                if (this?.drawer != null) ...[this.drawer],
                Expanded(child: this?.body ?? Container()),
              ],
            ),
          );
        }
        return this;
      },
    );
  }

  Scaffold copyWith({
    Key key,
    PreferredSizeWidget appBar,
    Widget body,
    Widget floatingActionButton,
    FloatingActionButtonLocation floatingActionButtonLocation,
    FloatingActionButtonAnimator floatingActionButtonAnimator,
    List<Widget> persistentFooterButtons,
    Widget drawer,
    Widget endDrawer,
    Widget bottomNavigationBar,
    Widget bottomSheet,
    Color backgroundColor,
    bool resizeToAvoidBottomPadding,
    bool resizeToAvoidBottomInset,
    bool primary = true,
    DragStartBehavior drawerDragStartBehavior,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    Color drawerScrimColor,
    double drawerEdgeDragWidth,
  }) {
    return Scaffold(
      key: key ?? this?.key,
      appBar: appBar ?? this?.appBar,
      body: body ?? this?.body,
      floatingActionButton: floatingActionButton ?? this?.floatingActionButton,
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? this?.floatingActionButtonLocation,
      floatingActionButtonAnimator:
          floatingActionButtonAnimator ?? this?.floatingActionButtonAnimator,
      persistentFooterButtons:
          this?.persistentFooterButtons ?? this?.persistentFooterButtons,
      drawer: drawer ?? this?.drawer,
      endDrawer: endDrawer ?? this?.endDrawer,
      bottomNavigationBar: bottomNavigationBar ?? this?.bottomNavigationBar,
      bottomSheet: bottomSheet ?? this?.bottomSheet,
      backgroundColor: backgroundColor ?? this?.backgroundColor,
      resizeToAvoidBottomInset:
          resizeToAvoidBottomInset ?? this?.resizeToAvoidBottomInset,
      primary: primary ?? this?.primary ?? true,
      drawerDragStartBehavior: drawerDragStartBehavior ??
          this?.drawerDragStartBehavior ??
          DragStartBehavior.start,
      extendBody: extendBody ?? this?.extendBody ?? false,
      extendBodyBehindAppBar:
          extendBodyBehindAppBar ?? this?.extendBodyBehindAppBar ?? false,
      drawerScrimColor: drawerScrimColor ?? this?.drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth ?? this?.drawerEdgeDragWidth,
    );
  }
}
