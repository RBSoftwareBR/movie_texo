import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/domain/entities/studio.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_cubit.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_state.dart';
import 'package:movie_texo/presentation/dashboard/widgets/table_title.dart';
import 'package:movie_texo/presentation/injection_container.dart';

class TopStudioWinnersTable extends StatelessWidget {
  const TopStudioWinnersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<StudiosWithMostWinsCubit, StudiosWithMostWinsState>(
          buildWhen: (current, previous) {
            return current != previous;
          },
          bloc: getIt<
              StudiosWithMostWinsCubit>(), // Usando GetIt para injeção de dependência
          builder: (context, state) {
            if (state is StudiosWithMostWinsLoading) {
              return const CircularProgressIndicator();
            } else if (state is StudiosWithMostWinsError) {
              return Text('Error: ${state.message}');
            } else if (state is StudiosWithMostWinsLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TableTitle(title:'Top 3 studios with winners'),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey[400]!),
                        ),
                        constraints: const BoxConstraints(minWidth: 350, maxWidth: 350),
                        child: DataTable(
                            columns: _columns(),
                            columnSpacing: 20,
                            dividerThickness: 2,
                            headingRowHeight: 48,
                            dataRowMaxHeight: 40,
                            dataRowMinHeight: 40,
                            rows: (state.studios.length > 3? state.studios.sublist(0,3): state.studios).map((studio) {
                              return _dataRow(studio);
                            }).toList())),
                  ),
                ],
              );
            } else {
              return const Text('No data available.');
            }
          }),
    );
  }

  List<DataColumn> _columns() {
    return const [
      DataColumn(label: Text('Studio Name')),
      DataColumn(label: Text('Win Count')),
    ];
  }

  DataRow _dataRow(Studio studio) {
    return DataRow(cells: [
      DataCell(Text(studio.name)),
      DataCell(Text(studio.winCount.toString())),
    ]);
  }
}
