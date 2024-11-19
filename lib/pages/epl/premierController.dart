import 'package:get/get.dart';
import 'package:pas_ruga/pages/epl/premierModel.dart';
import 'package:pas_ruga/pages/epl/premierService.dart';

class TeamController extends GetxController {
  var teams = <Team>[].obs;
  var isLoading = true.obs;
  final TeamService _teamService = TeamService();

  @override
  void onInit() {
    fetchTeams();
    super.onInit();
  }

  Future<void> fetchTeams() async {
    try {
      isLoading(true);
      var fetchedTeams = await _teamService.fetchTeams();
      teams.value = fetchedTeams;
    } catch (e) {
      print('Error fetching teams: $e');
    } finally {
      isLoading(false);
    }
  }
}
