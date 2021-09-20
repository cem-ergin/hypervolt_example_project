import 'package:crypto_stats/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template crypto_stats_page}
///  Page that hanldes the user interface for crypto stats feature.
/// {@endtemplate}
class CryptoStatsPage extends StatelessWidget {
  /// {@macro crypto_stats_page}
  const CryptoStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.goodLuck),
      ),
      body: Center(
        child: Text(l10n.checkTheReadme),
      ),
    );
  }
}
