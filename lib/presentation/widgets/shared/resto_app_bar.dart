import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/presentation/viewmodels/offline/offline_view_model.dart';
import 'package:provider/provider.dart';

class RestoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const RestoAppBar({super.key, required this.title});

  @override
  AppBar build(final BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Consumer<OfflineViewModel>(
          builder: (_, final viewModel, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  onPressed: viewModel.syncing ? null : viewModel.manualSync,
                  icon: const Icon(Icons.cloud_upload),
                ),
                if (viewModel.drafts.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${viewModel.drafts.length}',
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
