import 'package:flutter/material.dart';

class CustomScrollViewComp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomScrollViewComp();
  }
}

class _CustomScrollViewComp extends State<CustomScrollViewComp> {

  List<String> ids = new List<String>();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      

    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CustomScrollView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                const Text('I\'m dedicating every day to you'),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart'),
                const Text('And I thought I was so smart'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
