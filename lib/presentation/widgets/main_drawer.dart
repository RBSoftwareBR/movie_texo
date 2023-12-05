import 'package:flutter/material.dart';
import 'package:movie_texo/presentation/dashboard/dashboard_page.dart';
import 'package:movie_texo/presentation/movies/movie_list_page.dart';
import 'package:movie_texo/presentation/pages.dart';

class MainDrawer extends StatelessWidget {
  final AppPage currentPage;
  const MainDrawer({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 42.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.grey[200]),
        width: MediaQuery.of(context).size.width > 768? MediaQuery.of(context).size.width * .15:MediaQuery.of(context).size.width * .55 ,
        child: ListView(
          padding: EdgeInsets.zero, // Remove padding
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(
                'Dashboard',
                style: TextStyle(
                    color: currentPage == AppPage.dashboard
                        ? Colors.blue
                        : Colors.black),
              ),
              onTap: () {
                if( currentPage != AppPage.dashboard) {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const DashboardPage()));
                }
              },
            ),
            ListTile(
              title: Text(
                'List',
                style: TextStyle(
                    color: currentPage == AppPage.listMovies
                        ? Colors.blue
                        : Colors.black),
              ),
              onTap: () {
                if( currentPage != AppPage.listMovies) {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const MovieListPage()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
