import 'package:fluent_ui/fluent_ui.dart';

class AcrylicWidget extends StatelessWidget {
  final Widget child;
  const AcrylicWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: [
        const _AcrylicChildren(),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Acrylic(child: child),
          ),
        ),
      ]),
    );
  }
}

class _AcrylicChildren extends StatelessWidget {
  const _AcrylicChildren();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: AlignmentDirectional.topStart,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.purple,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 150,
                width: 150,
                color: Colors.teal,
              ),
            ),
            Container(
              height: 150,
              width: 150,
              color: Colors.orange,
            ),
          ],
        ),
      ),
      Align(
        alignment: AlignmentDirectional.center,
        child: Container(
          height: 152,
          width: 152,
          color: Colors.magenta,
        ),
      ),
      Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: Container(
          height: 100,
          width: 80,
          color: Colors.yellow,
        ),
      ),
    ]);
  }
}
