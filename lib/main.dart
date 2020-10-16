
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';

void main() async{
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending  = GetTrending(movieRepository);
 final Either<AppError,List<MovieEntity>> eitherResponse = await getTrending(NoParams());
 eitherResponse.fold((l) {
   print('error');
   print(l);
 }, (r) {
   print('list of movie');
   print(r);
 });

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(),
  ));
}