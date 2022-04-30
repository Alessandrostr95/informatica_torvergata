import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mobile_app/bloc/teacher/bloc.dart';
import 'package:mobile_app/bloc/teacher/provider.dart';
import 'package:mobile_app/bloc/teacher/model.dart';

class TeacherTable extends StatefulWidget {
  const TeacherTable({Key? key, required this.cdl}) : super(key: key);
  final String cdl;

  @override
  State<TeacherTable> createState() => _TeacherTableState();
}

class _TeacherTableState extends State<TeacherTable>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final TeacherBloc _bloc = TeacherBloc(TeacherApiClient(
        url:
            "http://192.168.1.15:8080/api/data/${widget.cdl.toLowerCase()}/21-22/teacher"))
      ..add(LoadTeacherEvent());

    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<TeacherBloc, TeacherState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is TeacherLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (state is TeacherLoadedState) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 1200,
                  child: _teacherTable(state.teachers)
                )
              ),
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
                    onPressed: () => BlocProvider.of<TeacherBloc>(context)
                        .add(LoadTeacherEvent()),
                    icon: const Icon(Icons.refresh, color: Colors.green)),
              ],
            ),
          );
        },
      ),
    );
  }

  DataTable2 _teacherTable(List<Teacher> teachers) {
    final List<DataRow> rows = List<DataRow>.generate(teachers.length, (index) {
      final Teacher t = teachers[index];
      return DataRow(cells: [
        DataCell(Text("${t.firstName} ${t.lastName}")),
        DataCell(Text(t.qualification)),
        DataCell(Text(t.office)),
        DataCell(Text(t.phone),
            onTap: t.phone != ""
                ? () => launch(Uri(scheme: "tel", path: t.phone).toString())
                : null),
        DataCell(Text(t.mail),
            onTap: t.mail != ""
                ? () => launch(Uri(scheme: "mailto", path: t.mail).toString())
                : null),
        DataCell(Text(t.website),
            onTap: t.website != ""
                ? () =>
                    launch(t.website, forceWebView: false, forceSafariVC: false)
                : null),
      ]);
    });

    return DataTable2(
        dividerThickness: 2,
        minWidth: 100,
        headingTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Colors.green[800]!),
        columnSpacing: 3,
        lmRatio: 1.5,
        smRatio: 0.5,
        columns: const [
          DataColumn2(label: Text("Nome"), size: ColumnSize.L),
          DataColumn2(label: Text("Qualifica"), size: ColumnSize.M),
          DataColumn2(label: Text("Studio"), size: ColumnSize.S),
          DataColumn2(label: Text("Telefono"), size: ColumnSize.M),
          DataColumn2(label: Text("Mail"), size: ColumnSize.L),
          DataColumn2(label: Text("Homepage"), size: ColumnSize.L),
        ],
        rows: rows);
  }

  @override
  bool get wantKeepAlive => true;
}
