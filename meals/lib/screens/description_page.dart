import 'package:flutter/material.dart';

class DescrtiptionCard extends StatefulWidget {
  final Map<String, dynamic> cardDescription;
  const DescrtiptionCard({Key? key, required this.cardDescription}) : super(key: key);

  @override
  State<DescrtiptionCard> createState() => _DescrtiptionCardState();
}

class _DescrtiptionCardState extends State<DescrtiptionCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.cardDescription['title'])),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[IconButton(
            icon: _isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border_outlined),
            onPressed: () {
              setState(() {
                // Cambiar el estado de la estrella al presionar
                _isFavorite = !_isFavorite;
              });

              final snackBar = SnackBar(content: Text(_isFavorite ? 'Added to Favorites' : 'Removed from Favorites'),);
              ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
            },
          ),],
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage(widget.cardDescription['image']), fit: BoxFit.cover, width: 400, height: 230,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Ingredients', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 113, 106)),),
              ),
        
              Center(child: Text(widget.cardDescription['ingredients'].toString().replaceAll('\n', '\n\n'), 
                                  textAlign: TextAlign.center,)),
        
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text('Steps', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 113, 106)),),
              ),
        
              Center(child: Text(widget.cardDescription['steps'].toString().replaceAll('\n', '\n\n'), 
                                  textAlign: TextAlign.center,)),
        
            ],
          ),
        ),
      );
  }
}

class DescriptionPageHome extends StatelessWidget {

  final Map<String, dynamic> cardDescription;
  const DescriptionPageHome({Key? key, required this.cardDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Description Meal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, brightness: Brightness.dark),
      ),
      home: DescrtiptionCard(cardDescription: cardDescription),
    );
  }

}