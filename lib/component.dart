import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Ici j'ai créer cette StatefulWidget pour generer dynamique une
// card dont les nombres de likes et commentaires peuvent changer au click
class Post extends StatefulWidget {
  final String ami;
  final int index;
  const Post({required this.ami, required this.index, super.key});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int like = 0;
  int comment = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 202, 217, 224),
              Color.fromARGB(255, 173, 213, 231)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/amis/ami${widget.index + 1}.jpg'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.ami,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'depuis ${widget.index + 4}h ',
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Image.asset(
                'assets/images/amis/ami${widget.index + 1}.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Je commence a comprendre le monde, quand on connais quelque chose on nous fatigue pour ça et quand on connais rien on deviens inutile',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            like++;
                          });
                        },
                        icon: const Icon(Icons.favorite_rounded, size: 16),
                      ),
                      Text('${like + 2} Likes',
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            comment++;
                          });
                        },
                        icon: const Icon(Icons.message_rounded, size: 16),
                      ),
                      Text('${comment + 3} commentaires ',
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fonction pour la baniere du profil
Widget profilBaniere(BuildContext context) {
  final List<String> imageList = [
    'assets/images/banier1.jpg',
    'assets/images/banier2.jpg',
    'assets/images/banier3.jpg',
  ]; // Liste des images s'affichant sur la baniere

  final List<String> textList = [
    'Bienvenue sur votre profil',
    'Explorez vos souvenirs',
    'Partagez vos moments',
  ]; //Liste de Text D'acceuil sur la baniere

  return Stack(
    clipBehavior: Clip.none,
    children: [
      CarouselSlider.builder(
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Stack(
          children: [
            Image.asset(
              imageList[itemIndex],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                textList[itemIndex],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
        ),
      ),
      Positioned(
        bottom: -50,
        left: MediaQuery.of(context).size.width / 2 - 50,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: const AssetImage('assets/images/profil.jpg'),
          backgroundColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

// UserName
Widget userName(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    color: Colors.white,
    child: const Column(
      children: [
        Text('Dara Sow',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

// Commentaire du profil
Widget commentaireProfil(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: 12.0, horizontal: 16.0), // Padding du conteneur de texte
      child: const Text(
        'Faire du code avec Flutter est 100 fois plus génial et souple que Android',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16.0, color: Colors.black, fontStyle: FontStyle.italic),
      ),
    ),
  );
}

// Bouton modifier profil
Widget boutonModifier(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    width: 350,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Couleur du bouton
            ),
            child: const Text(
              'Modifier le profil',
              style: TextStyle(color: Colors.white),
            ), // Texte du bouton
          ),
        ),
        const SizedBox(width: 8.0), // Espacement entre les boutons
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue, // Couleur de l'arrière-plan de l'image
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/edit.png', // Chemin de l'image
              width: 24, // Largeur de l'image
              height: 24, // Hauteur de l'image
            ),
            padding: EdgeInsets
                .zero, // Supprimer le rembourrage par défaut de l'IconButton
          ),
        ),
      ],
    ),
  );
}

// Apropos de moi
Widget aproposDeMoi(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.only(top: 8.0),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 8),
            Text('A propos de moi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.home, color: Colors.black),
            SizedBox(width: 8),
            Text('Anta Nord',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.code, color: Colors.black),
            SizedBox(width: 8),
            Text('Developpeur web',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.favorite, color: Colors.black),
            SizedBox(width: 8),
            Text('En couple avec Abobo',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ],
    ),
  );
}

// Mes amis
Widget mesAmis(BuildContext context, List<String> amis) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.grey, width: 1.0),
        bottom: BorderSide(color: Colors.grey, width: 1.0),
      ),
    ),
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.only(top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Amis',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 120, // Ajuster la hauteur si nécessaire
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: amis.length, // Remplacer par le nombre d'amis
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _showFriendDialog(context, amis[index], index);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 3.0,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/amis/ami${index + 1}.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        amis[index],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

// La boite de dialogue
void _showFriendDialog(BuildContext context, String ami, int index) {
  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'assets/images/amis/ami${index + 1}.jpg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                ami,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              const SizedBox(height: 8),
              Text(
                'Date et heure: $formattedDate',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    const Text('Fermer', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.elasticInOut,
          ),
          child: child,
        ),
      );
    },
  );
}

//postes
Widget postes(BuildContext context, List<String> amis) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.only(top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Posts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          children: List.generate(
            10,
            (index) => Post(ami: amis[index], index: index),
            // Ici on genere dynamiquement les postes
          ),
        ),
      ],
    ),
  );
}
