import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/domain/entities/producer_interval.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_cubit.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_state.dart';
import 'package:movie_texo/presentation/dashboard/widgets/section_title.dart';
import 'package:movie_texo/presentation/dashboard/widgets/table_title.dart';
import 'package:movie_texo/presentation/injection_container.dart';

class ProducersIntervalTable extends StatelessWidget {
  const ProducersIntervalTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<ProducersWithMaxMinIntervalCubit,
          ProducersWithMaxMinIntervalState>(
        buildWhen: (previous, current) => previous != current,
        bloc: getIt<
            ProducersWithMaxMinIntervalCubit>(), // Usando GetIt para injeção de dependência
        builder: (context, state) {
          if (state is ProducersWithMaxMinIntervalLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProducersWithMaxMinIntervalError) {
            return Text('Error: ${state.message}');
          } else if (state is ProducersWithMaxMinIntervalLoaded) {
            return buildProducersWithMaxMinIntervalLoaded(state, context);
          } else {
            return const Text('No data available.');
          }
        },
      ),
    );
  }

  Widget buildProducersWithMaxMinIntervalLoaded(
      ProducersWithMaxMinIntervalLoaded state, BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 350, maxWidth: 350),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TableTitle(title:'Producers with longest and shortest Interval between wins'),
          _buildSection(
              context, 'Maximum', state.producerIntervalResult.max),
          const SizedBox(
            height: 8,
          ),
          _buildSection(
              context, 'Minimum', state.producerIntervalResult.min),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<ProducerInterval> producers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: title,
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey[400]!),
            ),
            constraints: const BoxConstraints(minWidth: 350, maxWidth: 350),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 10,
                dividerThickness: 2,
                headingRowHeight: 48,
                dataRowMaxHeight: 40,
                dataRowMinHeight: 40,
                columns: _columns(),
                rows: producers
                    .map((producer) => _producerDataRow(producer))
                    .toList(),
              ),
            )),
      ],
    );
  }

  List<DataColumn> _columns() {
    return const [
      DataColumn(label: Text('Producer'),),
      DataColumn(label: Text('Interval',overflow: TextOverflow.fade,)),
      DataColumn(label: Text('Previous Win',overflow: TextOverflow.fade)),
      DataColumn(label: Text('Following Win',overflow: TextOverflow.fade)),
    ];
  }

  DataRow _producerDataRow(ProducerInterval producer) {
    return DataRow(
      cells: [
        DataCell(
          Text(producer.producer),
        ),
        DataCell(Text(producer.interval.toString())),
        DataCell(Text(producer.previousWin.toString())),
        DataCell(Text(producer.followingWin.toString())),
      ],
    );
  }
}

