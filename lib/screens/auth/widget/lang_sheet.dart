// import 'package:country_flags/country_flags.dart';
// import 'package:find_me/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void showLanguageBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       builder: (context) {
//         return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(mainAxisSize: MainAxisSize.min, children: [
//               const SizedBox(height: 16.0),
//               ListTile(
//                 onTap: () {
//                   Provider.of<ProvApp>(context, listen: false).changelang('en');
//                 },
//                 title: Text("English"),
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   child: CountryFlag.fromLanguageCode(
//                     'en',
//                     height: 48,
//                     width: 62,
//                     borderRadius: 8,
//                   ),
//                 ),
//                 trailing:
//                     Provider.of<ProvApp>(context, listen: false).lang == "en"
//                         ? Icon(Icons.done)
//                         : SizedBox(),
//               ),
//               ListTile(
//                 onTap: () {
//                   Provider.of<ProvApp>(context, listen: false).changelang('ar');
//                 },
//                 title: Text("العربية"),
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   child: CountryFlag.fromCountryCode(
//                     'sa',
//                     height: 48,
//                     width: 62,
//                     borderRadius: 8,
//                   ),
//                 ),
//                 trailing:
//                     Provider.of<ProvApp>(context, listen: false).lang == "ar"
//                         ? Icon(Icons.done)
//                         : SizedBox(),
//               ),
//               ListTile(
//                 onTap: () {
//                   Provider.of<ProvApp>(context, listen: false).changelang('ku');
//                 },
//                 title: Text("Kurdî"),
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   child: CountryFlag.fromLanguageCode(
//                     'ku',
//                     height: 48,
//                     width: 62,
//                     borderRadius: 8,
//                   ),
//                 ),
//                 trailing:
//                     Provider.of<ProvApp>(context, listen: false).lang == "ku"
//                         ? Icon(Icons.done)
//                         : SizedBox(),
//               ),
//             ]));
//       });
// }
