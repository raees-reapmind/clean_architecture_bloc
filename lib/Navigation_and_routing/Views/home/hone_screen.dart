import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigations_routing/Utils/enums.dart';
import 'package:navigations_routing/main.dart';
import 'package:navigations_routing/movies_model_with_freezed/bloc/movies_bloc.dart'; 
import '../../../config/color/colors.dart'; 
import '../../../config/reusable_components/internet_checker.dart';
import '../../../config/reusable_components/loader.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: BlocProvider(
          create: (_) => moviesBloc..add(MoviesFetched()),
          child: BlocBuilder<MoviesBloc, MoviesStates>(
            builder: (context, state) {
              switch (state.moviesList.status) {
                case Status.loading:
                  return const Center(
                    child: LoaderWidget(color: ColorsPallete.yellow),
                  );

                case Status.error:
                if(state.moviesList.message == 'No Internet Connection') {
                  return InternetChecker(
                    onPressed: () {
                      moviesBloc.add(MoviesFetched());
                    },
                  );
                }

                
                  return Center(
                    child: Text(
                      'Error: ${state.moviesList.message}',
                      style: const TextStyle(color: ColorsPallete.red),
                    ),
                  );

                case Status.success:
                  if(state.moviesList.data == null) {
                    return const Center(
                      child: Text(
                        'No movies found',
                        style: TextStyle(color: ColorsPallete.grey),
                      ),
                    );
                  }
                  final moviesList = state.moviesList.data!;
                  return ListView.builder(
                    itemCount: moviesList.tvShows.length,
                    itemBuilder: (context, index) {
                      final movie = moviesList.tvShows[index];
                      return ListTile(
                        title: Text(movie.name),
                        subtitle: Text(movie.network),
                        leading: movie.imageThumbnailPath != null
                            ? Image.network(movie.imageThumbnailPath!)
                            : const Icon(Icons.movie),
                      );
                    },

                  );;

                default:
                  return const SizedBox.shrink(); 
              }
            },
          ),
        ),
      ),
    );
  }
}
