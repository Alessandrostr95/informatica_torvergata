import 'package:flutter/material.dart';

import 'package:mobile_app/widgets/CourseSwitcher.dart';
import 'package:mobile_app/utils/TypeWriter.dart';
import 'package:mobile_app/widgets/NewsList.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _style = const TextStyle(fontFamily: "Times", fontSize: 32);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                ScaffoldState _state = const GlobalObjectKey("SCAFFOLD")
                    .currentState! as ScaffoldState;
                _state.openDrawer();
              },
            )),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text("Corso di Laurea", style: _style),
                    const CourseSwitcher(),
                    Text("Informatica", style: _style)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: typeWrite("> Fatto dagli studenti per gli studenti "),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: Colors.green[800]!.withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4))),
                  child: NewsList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
