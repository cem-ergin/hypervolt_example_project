import 'package:crypto_stats/l10n/l10n.dart';
import 'package:flutter/material.dart';

///CryptoStatsPage
class CryptoStatsPage extends StatelessWidget {
  ///CryptoStatsPage constructor
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
