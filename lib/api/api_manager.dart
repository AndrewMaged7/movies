import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/populer_model.dart';
import 'package:movies_app/models/recommend_model.dart';
import 'package:movies_app/models/releases_model.dart';
import 'package:movies_app/models/similar_model.dart';
import 'package:movies_app/models/top_level_details_model.dart';

class ApiManager {
  static Future<ModelPopular> getPopular() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=29def7f440e2cfcb8e8217f6290129c5");
    http.Response response = await http.get(url);
    print(response);
    var json = jsonDecode(response.body);
    print(json);
    ModelPopular modelPopular = ModelPopular.fromJson(json);
    return modelPopular;
  }

  static Future<ReleasesModel> getReleases() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=29def7f440e2cfcb8e8217f6290129c5");
    http.Response response = await http.get(url);
    print(response);
    var json = jsonDecode(response.body);
    print(json);
    ReleasesModel releasesModel = ReleasesModel.fromJson(json);
    return releasesModel;
  }

  static Future<RecommendedModel> getRecommended() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=29def7f440e2cfcb8e8217f6290129c5");
    http.Response response = await http.get(url);
    print(response);
    var json = jsonDecode(response.body);
    print(json);
    RecommendedModel recommendedModel = RecommendedModel.fromJson(json);
    return recommendedModel;
  }

  static Future<TopLevelDetailsModel> getTopLevelDetails(String movieID) async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieID?api_key=29def7f440e2cfcb8e8217f6290129c5");
    http.Response response = await http.get(url);
    print(response);
    var json = jsonDecode(response.body);
    print(json);
    TopLevelDetailsModel topLevelDetailsModel = TopLevelDetailsModel.fromJson(json);
    return topLevelDetailsModel;
  }

  static Future<SimilarModel> getSimilar(String movieID) async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieID/similar?api_key=29def7f440e2cfcb8e8217f6290129c5");
    http.Response response = await http.get(url);
    print(response);
    var json = jsonDecode(response.body);
    print(json);
    SimilarModel similarModel = SimilarModel.fromJson(json);
    return similarModel;
  }
}
