import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const riveFile = 'assets/new_file.riv';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkTheme = false;
  Artboard? _artboard;
  late RiveAnimationController _animationController;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    _animationController =_animationController = SimpleAnimation('light');
  }

  void _onSucess() {
    if (_artboard != null) {
      _artboard!.artboard.removeController(_animationController);
      _artboard!.addController(SimpleAnimation('light_tick'));
    }
  }

  void _onInit(Artboard artboard) {
    _artboard = artboard;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      body: Center(
        child: RiveAnimation.asset(
          riveFile,
          onInit: _onInit,
          controllers: [_animationController],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _onSucess,
      ),
    );
  }
}
