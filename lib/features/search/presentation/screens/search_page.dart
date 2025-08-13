import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_scope/constant/my_colors.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/core/enum.dart';
import 'package:movies_scope/features/search/presentation/bloc/search_bloc.dart';
import 'package:movies_scope/features/search/presentation/widgets/custom_search_field.dart';
import 'package:movies_scope/features/search/presentation/widgets/movie_search_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    getIt<SearchBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: AppBar(
          actionsPadding: EdgeInsets.only(right: 12),
          backgroundColor: MyColors.backgroundColor,
          title: CustomTextField(
            onSubmitted: (value) {
              getIt<SearchBloc>().add(GetMovieFromSearchEvent(movie: value!));
            },
            isSearchField: true,
            controller: searchController,
            hint: 'John',
            fillColor: MyColors.backgroundColor,
          ),
          actions: [
            TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                searchController.clear();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
          ],
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          bloc: getIt<SearchBloc>(),
          builder: (context, state) {
            if (state.status == Status.success) {
              return ListView.builder(
                itemCount: state.movieModelSearch.length,
                itemBuilder: (context, index) {
                  final movie = state.movieModelSearch[index];
                  return MovieSearchCard(movie: movie);
                },
              );
            } else if (state.status == Status.failure) {
              return Center(child: Text('failed to fetch data'));
            } else if (state.status == Status.loading) {
              return Center(
            child: SpinKitFadingCircle(
            color: Theme.of(context).colorScheme.secondary, // أو Colors.amber
            size: 80.0,
            ),
            );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
