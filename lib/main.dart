import 'package:flutter/material.dart';
import 'package:switch_light_dark/widgets/switch_light_dark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SwitcherLightDark(),
    );
  }
}

class SwitcherLightDark extends StatefulWidget {
  const SwitcherLightDark({super.key});

  @override
  State<SwitcherLightDark> createState() => _SwitcherLightDarkState();
}

class _SwitcherLightDarkState extends State<SwitcherLightDark> {
  bool _isNightMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switcher Light Dark Mode'),
      ),
      body: AnimatedContainer(
        width: double.infinity,
        duration: const Duration(milliseconds: 300),
        color: _isNightMode
            ? const Color(0xff202230).withOpacity(0.5)
            : Colors.white,
        child: Column(
          children: [
            const Spacer(),
            SwitchLightDark(
              width: 60,
              height: 25,
              onChanged: (val) => setState(() {
                _isNightMode = val;
              }),
            ),
            const SizedBox(
              height: 24,
            ),
            SwitchLightDark(
              width: 120,
              height: 50,
              onChanged: (val) => setState(() {
                _isNightMode = val;
              }),
            ),
            const SizedBox(
              height: 24,
            ),
            SwitchLightDark(
              width: 180,
              height: 75,
              onChanged: (val) => setState(() {
                _isNightMode = val;
              }),
            ),
            const SizedBox(
              height: 24,
            ),
            SwitchLightDark(
              onChanged: (val) => setState(() {
                _isNightMode = val;
              }),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
