import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.title});

  final String title;

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
        title: Text(title, style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Cover Photo with Profile Photo
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/images/banier.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom:
                      -50, // Position the profile photo halfway out of the cover photo
                  left: MediaQuery.of(context).size.width / 2 -
                      50, // Center the profile photo
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        const AssetImage('assets/images/profil.jpg'),
                    backgroundColor: Colors.white,
                    // Add border to profile photo
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
            ),
            // Add space below the profile photo
            const SizedBox(height: 50),
            // Profile Photo and Name
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              color: Colors.white,
              child: const Column(
                children: [
                  Text('Dara Sow',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Commentaire
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0), // Padding du conteneur de texte
                child: const Text(
                  'Faire du code avec Flutter est 100 fois plus génial et souple que Android',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            // Boutons de modification du profil
            Container(
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
                      color:
                          Colors.blue, // Couleur de l'arrière-plan de l'image
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
            ),
            // A propos de moi
            Container(
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
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
                      Text('En couple avec Youssouf',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
            // Friends
            Container(
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120, // Ajuster la hauteur si nécessaire
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, // Remplacer par le nombre d'amis
                      itemBuilder: (context, index) {
                        return Container(
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Posts
            Container(
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
                      (index) => Card(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/amis/ami${index + 1}.jpg'),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${amis[index]}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '2 hrs ago',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Image.asset(
                                'assets/images/amis/ami${index + 1}.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 250,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(
                                'Je commence a comprendre la vie, quand on connais quelque chose on nous fatigue pour ça et quand on connais rien on deviens unitil',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_rounded,
                                            size: 16),
                                      ),
                                      Text('${index + 2} Likes',
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.message_rounded,
                                            size: 16),
                                      ),
                                      Text('${index + 3} commentaires ',
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
