import 'package:flutter/material.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/components_global/components.dart';

class ScanQrScreen extends StatelessWidget {
  static const id = "scan_qr";
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          children: [
            ZonerAppBar(pageTitle: "Scan QR"),
            Spacer(),
            Container(
              height: MediaQuery.sizeOf(context).width * .6,
              width: MediaQuery.sizeOf(context).width * .6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kPadding24),
                  color: theme.cardColor,
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
