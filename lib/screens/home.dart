import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  final Widget child;
  const Home({super.key, required this.child});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navBarIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: navBarIndex,
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: value,
            onTap: changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.flutter_dash_rounded),
                label: "Flutter",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business_outlined),
                label: "Package",
              ),
            ],
          );
        },
      ),
    );
  }

  changeIndex(int index) {
    if (index == navBarIndex.value) return;
    navBarIndex.value = index;

    /// go or goNamed will navigate to a location without pushing route into the page stack
    switch (index) {
      case 0:
        return context.go("/flutter");

      case 1:
        return context.goNamed("package");

      default:
        return;
    }
  }
}
