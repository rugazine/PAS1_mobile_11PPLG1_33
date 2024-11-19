import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_ruga/pages/epl/premierModel.dart';

class TeamService {
  final String _baseUrl =
      'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  Future<List<Team>> fetchTeams() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> teamJson = json.decode(response.body)['teams'];
      return teamJson.map((json) => Team.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load teams');
    }
  }
}
