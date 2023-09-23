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

              const TitleWidget(textMessage: 'Ingredients',),

              DescriptionText(text: widget.cardDescription['ingredients'].toString()),
        
              const TitleWidget(textMessage: 'Steps',),

              DescriptionText(text: widget.cardDescription['steps'].toString()),
        
            ],
          ),
        ),
      );
  }
}

class TitleWidget extends StatefulWidget {
  final String textMessage;
  const TitleWidget({Key? key, required this.textMessage}) : super(key: key, );

  @override
  State<TitleWidget> createState() => _TitleWidget();
}

class _TitleWidget extends State<TitleWidget>{
    @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.textMessage, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 113, 106)),),
              );
  }
}

class DescriptionText extends StatelessWidget {
  final String text;

  const DescriptionText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text.toString().replaceAll('\n', '\n\n'),
        textAlign: TextAlign.center,
      ),
    );
  }
}
