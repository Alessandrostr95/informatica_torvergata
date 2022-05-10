import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:mobile_app/bloc/class/model.dart';
import 'package:mobile_app/utils/globals.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);
  static String PAGE_ROUTE = "/class";

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    final _class = ModalRoute.of(context)!.settings.arguments as Class;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: BorderedText(
                  strokeWidth: 4,
                  strokeColor: Colors.black87,
                  child: Text(
                    _class.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: "monospace"),
                  ),
                ),
                background: Hero(
                  tag: _class.code,
                  child: Image.network(
                    "$BASE_URL/api/data/images/${_class.code}.png", // cambiare assolutamente l'url
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : const LinearProgressIndicator(color: Colors.white);
                    },
                  ),
                ),
              ),
              collapsedHeight: 100,
              backgroundColor: Colors.white,
              elevation: 12,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  listCardWidget2("Nome Corso", _class.name),
                  listCardWidget2("Codice", _class.code),
                  listCardWidget2("Settore", _class.sector),
                  listCardWidget2("CFU", _class.cfu.toString()),
                  listCardWidget2("Anno", "${_class.courseYear}°"),
                  listCardWidget2(
                      "Prerequisiti",
                      _class.prerequisites
                          .map((e) => "\u2022 ${e['name']}")
                          .toList()
                          .join("\n")),
                  listCardWidget2(
                      "Docenti",
                      _class.teachers
                          .map((e) =>
                              "\u2022 ${e['first_name']} ${e['last_name']}")
                          .toList()
                          .join("\n")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listCardWidget(String field, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: Colors.green[800],
                  ),
                  child: SizedBox.square(
                    dimension: 100,
                    child: Center(
                      child: AutoSizeText(
                        field,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'monospace'),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // A copy of listCardWidget method, with different style
  Widget listCardWidget2(String field, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                        color: Colors.green[800]!,
                        style: BorderStyle.solid,
                        width: 4,
                      )),
                  child: SizedBox.square(
                    dimension: 100,
                    child: Center(
                      child: AutoSizeText(
                        field,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                            fontFamily: 'monospace'),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
