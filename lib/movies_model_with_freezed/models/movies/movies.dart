
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class MoviesModel with _$MoviesModel{

  factory MoviesModel({
    @Default('') int total,
    @Default(0) int page,
    @Default(0) int pages,
    // ignore: invalid_annotation_target
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShows
    }) = _MoviesModel;

    factory MoviesModel.fromJson(Map<String, dynamic> json) => _$MoviesModelFromJson(json); 
}


@freezed
class TvShows with _$TvShows{ 
   factory TvShows({ 
    @Default(0) int id,
    @Default('') String name,
    @Default('') String permalink,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'start_date') @Default('') String startDate,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'end_date') @Default('') String? endDate,
    @Default('') String country,
    @Default('') String network,
    @Default('') String status,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'image_thumbnail_path') @Default('') String imageThumbnailPath,
    }) = _TvShows;

    factory TvShows.fromJson(Map<String, dynamic> json) => _$TvShowsFromJson(json); 
}