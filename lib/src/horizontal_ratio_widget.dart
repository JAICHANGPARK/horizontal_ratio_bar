import 'package:flutter/material.dart';

import '../horizontal_ratio_bar.dart';


class HorizontalRatioWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final List<DataRatio>? dataSet;
  final double? maxValue;
  final Color? backgroundColor;

  HorizontalRatioWidget({Key? key, this.width, this.height, this.dataSet, this.maxValue, this.backgroundColor})
      : super(key: key);

  @override
  _HorizontalRatioWidgetState createState() => _HorizontalRatioWidgetState();
}

class _HorizontalRatioWidgetState extends State<HorizontalRatioWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> buildRatioBarItemsWidget() {
    if (widget.dataSet == null) return [];
    return widget.dataSet!
        .map(
          (e) => Expanded(
              flex: widget.maxValue! ~/ (widget.maxValue! - (e.value ?? 0)),
              child: Container(
                color: e.color,
              )),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width != null ? widget.width : MediaQuery.of(context).size.width,
      height: widget.height != null ? widget.height : 48,
      color: widget.backgroundColor != null ? widget.backgroundColor : Colors.grey,
      child: Row(
        children: buildRatioBarItemsWidget(),
      ),
    );
  }
}
