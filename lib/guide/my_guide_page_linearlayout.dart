import 'package:flutter/material.dart';

class AndroidLinearLayoutLikePage extends StatefulWidget {
  const AndroidLinearLayoutLikePage({Key? key}) : super(key: key);

  @override
  State createState() {
    return LinearLayoutLikeState();
  }
}

class LinearLayoutLikeState extends State<AndroidLinearLayoutLikePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Row和Column是Flutter中的LinearLayout',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
          child: ListView(
        children: [
          Row(
            // 相当于Android中的 match_parent 和 wrap_content
            mainAxisSize: MainAxisSize.max,
            // 相当于Android中的 gravity
            mainAxisAlignment: MainAxisAlignment.end,
            // 相当于Android中的 base_line，基线对齐
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(Icons.access_time, size: 50),
              Icon(Icons.pie_chart, size: 100),
              Icon(Icons.email, size: 50),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.access_time, size: 50),
              Icon(Icons.pie_chart, size: 100),
              Icon(Icons.email, size: 50),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.access_time, size: 50),
              Icon(Icons.pie_chart, size: 100),
              Icon(Icons.email, size: 50),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 2,
            margin: const EdgeInsets.only(bottom: 5),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Expanded 相当于Android中的 layout_weight
              Expanded(
                child: Container(
                  child: const Icon(Icons.access_time, size: 50),
                  color: Colors.red,
                ),
                flex: 3,
              ),
              Expanded(
                child: Container(
                  child: const Icon(Icons.pie_chart, size: 100),
                  color: Colors.blue,
                ),
                flex: 4,
              ),
              Expanded(
                child: Container(
                  child: const Icon(Icons.email, size: 50),
                  color: Colors.green,
                ),
                flex: 6,
              ),
            ],
          )
        ],
      )),
    );
  }
}
