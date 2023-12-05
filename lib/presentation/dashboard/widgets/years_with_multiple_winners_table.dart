import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_cubit.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_state.dart';
import 'package:movie_texo/presentation/dashboard/widgets/table_title.dart';
import 'package:movie_texo/presentation/injection_container.dart';

class YearsWithMultipleWinnersTable extends StatelessWidget {
  const YearsWithMultipleWinnersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<YearsWithMultipleWinnersCubit,
              YearsWithMultipleWinnersState>(
          buildWhen: (current, previous) {
            return current != previous;
          },
          bloc: getIt<YearsWithMultipleWinnersCubit>(),
          builder: (context, state) {
            if (state is YearsWithMultipleWinnersLoading) {
              return const CircularProgressIndicator();
            } else if (state is YearsWithMultipleWinnersError) {
              return Text('Error: ${state.message}');
            } else if (state is YearsWithMultipleWinnersLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TableTitle(title: "List years with multiple winners"),
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
                            rows: state.years.map((item) {
                              return _buildDataCell(item);
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
      DataColumn(label: Text('Year')),
      DataColumn(label: Text('Win Count')),
    ];
  }

  DataRow _buildDataCell(item) {
    return DataRow(cells: [
      DataCell(Text(item.year.toString())),
      DataCell(Text(item.winnerCount.toString())),
    ]);
  }
}
