import 'package:flutter_project_template/common/constants.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> launchUrl(String url) async {
  final shouldProceed = await canLaunch(url);
  if (shouldProceed) await launch(AppConstants.terms_url);
  return shouldProceed;
}