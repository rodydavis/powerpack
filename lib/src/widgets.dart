import 'package:flutter/material.dart';

extension IconUtils on Icon {
  Widget onPressed({VoidCallback onTap}) => InkWell(onTap: onTap, child: this);
}

extension TextUtils on Text {
  Widget onPressed({VoidCallback onTap}) => InkWell(onTap: onTap, child: this);
}

extension ContainerUtils on Container {
  Widget onPressed({VoidCallback onTap}) => InkWell(onTap: onTap, child: this);
  Widget get asScrollable => SingleChildScrollView(child: this);
  Widget get asCenter => Center(child: this);
}
