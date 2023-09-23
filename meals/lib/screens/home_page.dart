import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:meals/data/constants.dart';
import 'package:meals/screens/description_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {

  List<dynamic> cardDescription = [];

  @override
  void initState(){
    cardDescription = jsonDecode(MEALS_EXCHANGES);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Quick & Easy')),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cardDescription.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                // Navegar a la nueva página cuando se haga clic en el Stack
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescrtiptionCard(cardDescription: cardDescription[index]),
                  ),
                );
              },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(image: AssetImage(cardDescription[index]['image']), fit: BoxFit.cover, width: 400, height: 230,)
                      ),
                    ),
                    Positioned(
                      bottom: 0, // Alinea la tarjeta en la parte inferior de la imagen
                      left: 0,
                      right: 0,
                      child: Card(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Center(child: Text(cardDescription[index]['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),), ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.timer, size: 20,),
                                  const SizedBox(width: 4,),
                                  Text(cardDescription[index]['time']),
                                  const SizedBox(width: 10,),
                                  const Icon(Icons.work, size: 20,),
                                  const SizedBox(width: 4,),
                                  Text(cardDescription[index]['difficulty']),
                                  const SizedBox(width: 10,),
                                  const Icon(Icons.attach_money, size: 20,),
                                  const SizedBox(width: 4,),
                                  Text(cardDescription[index]['price']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ),
      );
  }
}

