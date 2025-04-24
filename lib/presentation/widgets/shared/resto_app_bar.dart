import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RestoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const RestoAppBar({super.key, required this.title});

  @override
  AppBar build(final BuildContext context) {
    return AppBar(title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
