import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:trending_github/repo_model.dart';
String url="https://github-trending-api.now.sh/developers?language=java&since=daily";
Future<List<RepoList>> getRepositories() async{
  var headers={
    HttpHeaders.contentTypeHeader:'application/json',
  };
  final response=await http.get(url,
      headers: headers
  );
  print(response.statusCode.toString()+"repo github");
  return repoListFromJson(response.body);
}