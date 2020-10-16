
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';

void main() {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  dataSource.getTrending();
  dataSource.getPopular();
  dataSource.getPlayingNow();
  dataSource.getComingSoon();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(),
  ));
}