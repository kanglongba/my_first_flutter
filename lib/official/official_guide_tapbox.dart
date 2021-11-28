import 'package:flutter/material.dart';

/// flutter中的状态管理：https://flutter.cn/docs/development/ui/interactive
class TabBoxAPage extends StatelessWidget {
  const TabBoxAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget管理自己的状态'),
      ),
      body: const TabBoxAWidget(),
    );
  }
}

class TabBoxAWidget extends StatefulWidget {
  const TabBoxAWidget({Key? key}) : super(key: key);

  @override
  State createState() {
    return TabBoxAState();
  }
}

class TabBoxAState extends State<TabBoxAWidget> {
  bool _active = false;

  @override
  void initState() {
    super.initState();
    _active = false;
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black38,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: GestureDetector(
          child: Container(
            color: getColor(),
            child: Center(
              child: getText(),
            ),
          ),
          onTap: _handleTap,
        ));
  }

  Color getColor() {
    if (_active) {
      return Colors.green;
    } else {
      return Colors.black54;
    }
  }

  Text getText() {
    if (_active) {
      return const Text(
        'Active',
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
        ),
      );
    } else {
      return const Text(
        'Inactive',
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
        ),
      );
    }
  }
}

class TabBoxBPage extends StatelessWidget {
  const TabBoxBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('父Widget管理Widget的状态'),
      ),
      body: const TabBoxBParentWidget(),
    );
  }
}

class TabBoxBParentWidget extends StatefulWidget {
  const TabBoxBParentWidget({Key? key}) : super(key: key);

  @override
  State createState() {
    return TabBoxBParentState();
  }
}

class TabBoxBParentState extends State<TabBoxBParentWidget> {
  late bool _active;
  late String _text;
  late Color _bgColor;
  late GestureTapCallback onTap;

  @override
  void initState() {
    super.initState();
    _active = false;
    _text = 'Inactive';
    _bgColor = Colors.black54;
    onTap = () {
      setState(() {
        if (_active) {
          _active = false;
          _text = 'Inactive';
          _bgColor = Colors.black54;
        } else {
          _active = true;
          _text = 'Active';
          _bgColor = Colors.green;
        }
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return TabBoxBWidget(
      bgColor: _bgColor,
      text: _text,
      onPress: onTap,
    );
  }
}

class TabBoxBWidget extends StatelessWidget {
  final Color bgColor;
  final String text;
  final void Function() onPress;

  const TabBoxBWidget(
      {required this.bgColor,
      required this.text,
      required this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 2,
          style: BorderStyle.solid,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        child: Container(
          color: bgColor,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
        onTap: onPress,
      ),
    );
  }
}

class TabBoxCPage extends StatelessWidget {
  const TabBoxCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('混搭管理状态'),
      ),
      body: const TabBoxCParentWidget(),
    );
  }
}

class TabBoxCParentWidget extends StatefulWidget {
  const TabBoxCParentWidget({Key? key}) : super(key: key);

  @override
  State createState() {
    return TabBoxCParentState();
  }
}

class TabBoxCParentState extends State<TabBoxCParentWidget> {
  late bool _active;

  @override
  void initState() {
    super.initState();
    _active = false;
  }

  void _handleOnTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBoxCWidget(
      active: _active,
      onPress: _handleOnTap,
    );
  }
}

class TabBoxCWidget extends StatefulWidget {
  const TabBoxCWidget({required this.active, required this.onPress, Key? key})
      : super(key: key);

  final bool active;
  final GestureTapCallback onPress;

  @override
  State createState() {
    return TabBoxCState();
  }
}

class TabBoxCState extends State<TabBoxCWidget> {
  late bool _highlight;

  @override
  void initState() {
    super.initState();
    _highlight = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      onTapDown: (detail) {
        setState(() {
          _highlight = true;
        });
      },
      onTapUp: (detail) {
        setState(() {
          _highlight = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _highlight = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _highlight ? Colors.lightBlueAccent : Colors.white,
          border: Border.all(
            color: Colors.orangeAccent,
            width: 1.0,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Container(
          color: widget.active ? Colors.green : Colors.grey,
          child: Center(
            child: Text(
              widget.active ? 'Active' : 'Inactive',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
