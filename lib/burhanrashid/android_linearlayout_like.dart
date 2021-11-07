import 'package:flutter/material.dart';

class AndroidLinearLayoutLikePage extends StatefulWidget {
  @override
  State createState() {
    return LinearLayoutLikeState();
  }
}

class LinearLayoutLikeState extends State<AndroidLinearLayoutLikePage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinearLayout Page'),
      ),
      body: Container(
          color: Colors.yellowAccent,
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                // 相当于Android中的 match_parent 和 wrap_content
                mainAxisAlignment: MainAxisAlignment.end,
                // 相当于Android中的 gravity
                crossAxisAlignment: CrossAxisAlignment.end,
                // 相当于Android中的 base_line，基线对齐
                children: const [
                  Icon(Icons.access_time, size: 50),
                  Icon(Icons.pie_chart, size: 100),
                  Icon(Icons.email, size: 50),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                // 相当于Android中的 match_parent 和 wrap_content
                mainAxisAlignment: MainAxisAlignment.start,
                // 相当于Android中的 gravity
                crossAxisAlignment: CrossAxisAlignment.start,
                // 相当于Android中的 base_line，基线对齐
                children: const [
                  Icon(Icons.access_time, size: 50),
                  Icon(Icons.pie_chart, size: 100),
                  Icon(Icons.email, size: 50),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                // 相当于Android中的 match_parent 和 wrap_content
                mainAxisAlignment: MainAxisAlignment.center,
                // 相当于Android中的 gravity
                crossAxisAlignment: CrossAxisAlignment.center,
                // 相当于Android中的 base_line，基线对齐
                children: const [
                  Icon(Icons.access_time, size: 50),
                  Icon(Icons.pie_chart, size: 100),
                  Icon(Icons.email, size: 50),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                // 相当于Android中的 match_parent 和 wrap_content
                mainAxisAlignment: MainAxisAlignment.end,
                // 相当于Android中的 gravity
                crossAxisAlignment: CrossAxisAlignment.end,
                // 相当于Android中的 base_line，基线对齐
                children: [
                  Expanded(
                    child: Container(
                      child: const Icon(Icons.access_time, size: 50),
                      color: Colors.red,
                    ),
                    flex: 2,
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
