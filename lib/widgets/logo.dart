import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FindMeLogo extends StatelessWidget {
  const FindMeLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/svg/logo.svg',
        height: 250,
        width: 250,
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
      ),
    );
  }
}
