import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/presentation/cubit/movies_by_year/movies_by_year_cubit.dart';
import 'package:movie_texo/presentation/cubit/movies_by_year/movies_by_year_state.dart';
import 'package:movie_texo/presentation/dashboard/widgets/table_title.dart';
import 'package:movie_texo/presentation/injection_container.dart';
import 'package:movie_texo/presentation/utils/snack_bar.dart';

class MoviesByYearSearch extends StatefulWidget {
  const MoviesByYearSearch({super.key});

  @override
  State createState() => _MoviesByYearSearchState();
}

class _MoviesByYearSearchState extends State<MoviesByYearSearch> {
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<MoviesByYearCubit, MoviesByYearState>(
        buildWhen: (previous, current) => previous != current,
        bloc: getIt<MoviesByYearCubit>(), // Usando GetIt para injeção de dependência
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TableTitle(title: 'List movie winners by year'),
                Container(
                    constraints: const BoxConstraints(minWidth: 350, maxWidth: 350),
                    child:Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    children: [
                      Container(
                        constraints: const BoxConstraints(minWidth: 200, maxWidth: 250),
                        child: TextField(
                          controller: _yearController,
                          decoration: const InputDecoration(
                            hintText: 'Enter year',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final year = int.tryParse(_yearController.text);
                          if (year != null) {
                            getIt<MoviesByYearCubit>().loadMoviesByYear(year);
                          }else{
                            showSnackBar(context, 'Please enter a valid year');
                          }
                        },
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                )),
                const SizedBox(height: 16),
                if (state is MoviesByYearLoading) const CircularProgressIndicator(),
                if (state is MoviesByYearLoaded) ..._buildMoviesList(state),
                if (state is MoviesByYearError) Text('Error: ${state.message}'),
                if (state is MoviesByYearInitial) ..._buildEmptyMoviesList(state),
              ],
          );
        },
      ),
    );
  }

  List<Widget> _buildMoviesList(MoviesByYearLoaded state) {
      // Cria um DataTable com os dados dos filmes
      return [
        Container(
          constraints: const BoxConstraints(minWidth: 350, maxWidth: 350),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey[400]!),
            ),
            child: DataTable(
                columnSpacing: 20,
                dividerThickness: 2,
                headingRowHeight: 48,
                dataRowMaxHeight: 40,
                dataRowMinHeight: 40,
                columns:  const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Year')),
                  DataColumn(label: Text('Title')),
                  DataColumn(label: Text('Winner')),
                ],
                rows: state.movies.map((movie) {
            return DataRow(
              cells: [
                DataCell(Text(movie.id.toString())),
                DataCell(Text(movie.year.toString())),
                DataCell(Text(movie.title)),
                DataCell(Text(movie.winner ? 'Yes' : 'No')),
              ],
            );
          }).toList(),
        ),
                ),
      ];
  }


  List<Widget> _buildEmptyMoviesList(MoviesByYearInitial state) {
      // Cria um DataTable com os dados dos filmes
      return [
        Container(
          constraints: const BoxConstraints(minWidth: 350, maxWidth: 350),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey[400]!),
          ),
          child: DataTable(
            columnSpacing: 20,
            dividerThickness: 2,
            headingRowHeight: 48,
            dataRowMaxHeight: 40,
            dataRowMinHeight: 40,
            columns:  const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Year')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Winner')),
            ],
            rows: const [DataRow(
              cells: [
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
              ]),
            ],
        ),
                )
      ];
  }

  @override
  void dispose() {
    _yearController.dispose();
    super.dispose();
  }
}
