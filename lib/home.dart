import 'package:flutter/material.dart';
import 'package:wireframe_app/component.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required String title});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? get title => null;
  int like = 0;
  int comment = 0;
  @override
  Widget build(BuildContext context) {
    List<String> amis = [
      "Aminata",
      "Mariame",
      "Binta",
      "Aissatou",
      "Fanta",
      "Kadiatou",
      "Adama",
      "Bintou",
      "Ciré",
      "Djariou"
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profil facebook", style: const TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Fonction pour la baniere du profil
            profilBaniere(context),
            const SizedBox(height: 50), // Un petit Box juste avoir de l'espace
            // Profile Photo and Name
            userName(context),
            // Commentaire
            commentaireProfil(context),
            // Boutons de modification du profil
            boutonModifier(context),
            // A propos de moi
            aproposDeMoi(context),
            // Mes amis
            mesAmis(context, amis),
            // Posts
            postes(context, amis),
          ],
        ),
      ),
    );
  }
}
