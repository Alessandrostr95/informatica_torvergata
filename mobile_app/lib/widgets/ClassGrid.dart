import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_app/bloc/class/bloc.dart';
import 'package:mobile_app/bloc/class/provider.dart';
import 'package:mobile_app/bloc/class/model.dart';
import 'package:mobile_app/screens/ClassPage.dart';
import 'package:mobile_app/utils/globals.dart';

class ClassGrid extends StatefulWidget {
  const ClassGrid({Key? key, required this.cdl}) : super(key: key);
  final String cdl;

  @override
  State<ClassGrid> createState() => _ClassGridState();
}

class _ClassGridState extends State<ClassGrid>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final ClassBloc _bloc = ClassBloc(ClassApiClient(
        url: "$BASE_URL/api/data/${widget.cdl.toLowerCase()}/21-22/class"))
      ..add(LoadClassEvent());

    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<ClassBloc, ClassState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is ClassLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (state is ClassLoadedState) {
            // return Text(state.classes.toString());
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _classGrid(state.classes),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ops! Something went wrong... :(",
                  style: TextStyle(
                    fontFamily: "monospace",
                    color: Colors.green,
                  ),
                ),
                IconButton(
                    onPressed: () => BlocProvider.of<ClassBloc>(context)
                        .add(LoadClassEvent()),
                    icon: const Icon(Icons.refresh, color: Colors.green)),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  GridView _classGrid(List<Class> classes) {
    const _radius = BorderRadius.all(Radius.circular(16));

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.9,
      children: List.generate(classes.length, (index) {
        final _class = classes[index];
        return PhysicalModel(
          color: Colors.black,
          elevation: 8,
          borderRadius: _radius,
          child: GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(ClassPage.PAGE_ROUTE, arguments: _class),
            child: Container(
                padding: const EdgeInsets.only(bottom: 6),
                decoration: const BoxDecoration(
                    color: Colors.white, borderRadius: _radius),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Hero(
                            tag: _class.code,
                            child: Image.network(
                              "$BASE_URL/api/data/images/${_class.code}.png", // cambiare assolutamente l'url
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : const LinearProgressIndicator(
                                        color: Colors.white);
                              },
                            ),
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Text(
                          _class.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "monospace"),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        );
      }),
    );
  }
}
