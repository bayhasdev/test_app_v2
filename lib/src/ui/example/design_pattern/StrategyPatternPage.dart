import 'dart:developer';

import 'package:flutter/material.dart';

class StrategyPatternPage extends StatelessWidget {
  static const String routeName = '/Strategy Design PatternPage';
  @override
  Widget build(BuildContext context) {
    GermanTeam germanTeam = GermanTeam('germanTeam');
    FranceTeam franceTeam = FranceTeam('FranceTeam');

    AttackStrategy attackStrategy = AttackStrategy();
    DefenceStrategy defenceStrategy = DefenceStrategy();

    germanTeam.teamStrategy = attackStrategy;
    franceTeam.teamStrategy = defenceStrategy;

    germanTeam.playGame();
    franceTeam.playGame();

    return Scaffold(
      appBar: AppBar(
        title: Text('Strategy Design Pattern'),
      ),
      body: SafeArea(child: Container()),
    );
  }
}

////////////////{ Strategy Pattern Classes } ////////////////

class TeamStrategy {
  void play(String teamName) {
    log('f');
  }
}

class AttackStrategy implements TeamStrategy {
  @override
  void play(String teamName) {
    log('$teamName will play in Attack Strategy');
  }
}

class DefenceStrategy implements TeamStrategy {
  @override
  void play(String teamName) {
    log('$teamName will play in Defence Strategy');
  }
}

abstract class Team {
  String teamName;
  TeamStrategy? teamStrategy;

  Team(this.teamName);

  void teamInfo();

  void playGame() {
    teamStrategy!.play(teamName);
  }
}

class GermanTeam extends Team {
  GermanTeam(String teamName) : super(teamName);

  @override
  void teamInfo() {
    log('German Team !!!!');
  }
}

class FranceTeam extends Team {
  FranceTeam(String teamName) : super(teamName);
  @override
  void teamInfo() {
    log('France Team !!!!');
  }
}
