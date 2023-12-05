import 'package:flutter/material.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_cubit.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_cubit.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_cubit.dart';
import 'package:movie_texo/presentation/injection_container.dart';
import 'package:movie_texo/presentation/pages.dart';
import 'package:movie_texo/presentation/widgets/main_drawer.dart';

import 'widgets/movies_by_year_search.dart';
import 'widgets/producers_interval_table.dart';
import 'widgets/top_studio_winners_table.dart';
import 'widgets/years_with_multiple_winners_table.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    getIt<YearsWithMultipleWinnersCubit>().loadYearsWithMultipleWinners();
    getIt<StudiosWithMostWinsCubit>().loadStudiosWithMostWins();
    getIt<ProducersWithMaxMinIntervalCubit>().loadProducersWithMaxMinInterval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width < 768
          ? const Drawer(
              child: MainDrawer(
              currentPage: AppPage.dashboard,
            ))
          : null,
      appBar: AppBar(title: const Text("Movie Dashboard")),
      body: Row(
        children: [
          MediaQuery.of(context).size.width > 768
              ? const MainDrawer(
                  currentPage: AppPage.dashboard,
                )
              : Container(),
          SizedBox(
            width: contentWidth(context),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child:  Wrap(
                alignment:  MediaQuery.of(context).size.width > 768
                    ? WrapAlignment.start: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: const [
                  // Componente para "List years with multiple winners"
                  YearsWithMultipleWinnersTable(key:Key("years_table")),
                  // Componente para "Top 3 studios with winners"
                  TopStudioWinnersTable(key:Key("studios_table")),
                  // Componente para "Producers with longest and shortest interval between wins"
                  ProducersIntervalTable(key:Key("producers_table")),
                  // Campo de busca e tabela para "List movie winners by year"
                  MoviesByYearSearch(key:Key("movies_table")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double contentWidth(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width * .15)
        : MediaQuery.of(context).size.width;
  }
}
