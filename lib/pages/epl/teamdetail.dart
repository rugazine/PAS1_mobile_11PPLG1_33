import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_ruga/pages/epl/premierModel.dart';

class TeamDetailPage extends StatelessWidget {
  final Team team;

  TeamDetailPage({required this.team});

  final RxBool isFavorite = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.strTeam),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  team.strBadge,
                  height: 100,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CircularProgressIndicator();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                team.strDescriptionEn,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
