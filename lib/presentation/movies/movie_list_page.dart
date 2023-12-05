import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/presentation/cubit/movies_list/movie_list_cubit.dart';
import 'package:movie_texo/presentation/cubit/movies_list/movie_list_state.dart';
import 'package:movie_texo/presentation/injection_container.dart';
import 'package:movie_texo/presentation/pages.dart';
import 'package:movie_texo/presentation/utils/snack_bar.dart';
import 'package:movie_texo/presentation/widgets/main_drawer.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _yearFilterController = TextEditingController();
  String? _winnerFilter;
  @override
  void initState() {
    super.initState();
    getIt<MovieListCubit>().loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _mobileDrawer(context),
        appBar: _buildAppBar(),
        body: Row(children: [
          _desktoDrawer(context),
          _buildMoviePageContent(context)
        ]));
  }

  AppBar _buildAppBar() =>
      AppBar(title: const Text("Movie List"), key: const Key("app_bar"));

  Drawer? _mobileDrawer(BuildContext context) {
    return MediaQuery.of(context).size.width < 768
        ? const Drawer(
            child: MainDrawer(
            currentPage: AppPage.listMovies,
          ))
        : null;
  }

  SizedBox _buildMoviePageContent(BuildContext context) {
    return SizedBox(
      width: contentWidth(context),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildFilterControls(),
              SizedBox(
                  height: MediaQuery.of(context).size.height - 350,
                  child: _buildMoviesTable()),
              _buildPaginationControls(),
            ],
          )),
    );
  }

  Widget _desktoDrawer(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? const MainDrawer(
            currentPage: AppPage.listMovies,
          )
        : Container();
  }

  Widget _buildFilterControls() {
    return Row(
      key: const Key("filter_controls"),
      children: [
        Expanded(
          child: TextField(
            controller: _yearFilterController,
            decoration: const InputDecoration(
              labelText: 'Filter by year',
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (_) {
              int? year = int.tryParse(_yearFilterController.text);
              if (year != null) {
                _applyFilters();
              } else {
                showSnackBar(context, "Invalid year");
              }
            },
          ),
        ),
        const SizedBox(width: 16),
        DropdownButton<String>(
          value: _winnerFilter,
          hint: const Text('Winner?'),
          items: ['Yes', 'No']
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (newValue) {
            setState(() {
              _winnerFilter = newValue;
            });
            _applyFilters();
          },
        ),
        ElevatedButton(
          onPressed: () {
            _yearFilterController.text = "";
            setState(() {
              _winnerFilter = null;
            });
            getIt<MovieListCubit>().loadMovies();
          },
          child: const Text('Clear filters'),
        ),
      ],
    );
  }

  Widget _buildMoviesTable() {
    return BlocBuilder<MovieListCubit, MovieListState>(
      bloc: getIt<MovieListCubit>(),
      builder: (context, state) {
        if (state is MovieListLoading) {
          return const Center(
              child: SizedBox(
                  height: 150, width: 150, child: CircularProgressIndicator()));
        } else if (state is MovieListError) {
          return Text('Error: ${state.message}');
        } else if (state is MovieListLoaded) {
          return Container(
            key: const Key("movies_table"),
            constraints: BoxConstraints(
                minWidth: contentWidth(context) - 16,
                maxWidth: contentWidth(context) - 16),
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Year')),
                  DataColumn(label: Text('Title')),
                  DataColumn(label: Text('Winner?')),
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
          );
        } else {
          return const Text('No data available.');
        }
      },
    );
  }

  Widget _buildPaginationControls() {
    return BlocBuilder<MovieListCubit, MovieListState>(
      bloc: getIt<MovieListCubit>(),
      builder: (context, state) {
        if (state is MovieListLoaded) {
          return Row(
            key: const Key("pagination_controls"),
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (state.page > 0)
                ElevatedButton(
                  onPressed: () {
                    getIt<MovieListCubit>().loadMovies(page: state.page - 1);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              Text('Page ${state.page+1} of ${state.totalPages}'),
              if (state.page + 1 < state.totalPages)
                ElevatedButton(
                  onPressed: () {
                    getIt<MovieListCubit>().loadMovies(
                      page: state.page + 1,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _applyFilters() {
    getIt<MovieListCubit>().loadMovies(
      yearFilter: int.tryParse(_yearFilterController.text),
      winnerFilter: _winnerFilter == 'Yes'
          ? true
          : _winnerFilter == 'No'
              ? false
              : null,
    );
  }

  @override
  void dispose() {
    _yearFilterController.dispose();
    super.dispose();
  }

  double contentWidth(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width * .15)
        : MediaQuery.of(context).size.width;
  }
}
