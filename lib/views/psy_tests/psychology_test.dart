import 'package:butterfly/routes/route_names.dart';
import 'package:flutter/material.dart';

class PsychoTests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Navigator.pushNamed(context, RouteNames.takeTest),
          title: Text("Take Your Anxiety Test!"),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
        Divider(),
        Spacer(),
        Center(child: Text("More tests are coming soon...")),
        Spacer(),
      ],
    );
  }
}
