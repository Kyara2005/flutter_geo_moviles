import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const SingleChildScrollView(
          
          child: Column(
            children: [
              ImageSection(image: 'images/lake.jpeg'),
              TitleSection(name: 'Oeschinen Lake Campground', location: 'Kandersteg, Switzerland'),
              ButtonSection( mapsUrl: 'https://maps.app.goo.gl/XCzSoDcT1RznCFtL7'),
              TextSection(description: 'Hermoso lago alpino rodeado de montañas y bosques, ideal para realizar caminatas, acampar y disfrutar de impresionantes paisajes naturales.'),

              ImageSection(image: 'images/lake2.jpeg'),
              TitleSection(name: 'Paisaje de niebla', location: 'Ecuador'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/NLMhun7oD9wMUhkj8'),
              TextSection(description: 'Un paisaje cubierto por una suave capa de niebla que resalta la belleza natural de los valles y montañas ecuatorianas.'),

              ImageSection(image: 'images/lake3.jpeg'),              
              TitleSection(name: 'Volcán Cotopaxi', location: 'Cotopaxi'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/UbE45SZKUac1VJVY7'),
              TextSection(description: 'Un volcán activo que ofrece vistas impresionantes de sus cráteres y la cordillera circundante.'),

              ImageSection(image: 'images/lake4.jpeg'),
              TitleSection(name: 'Centro Histórico', location: 'UIO'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/NBx7uoDcTVm1zCAw8'),
              TextSection(description: 'El Centro Histórico de Quito destaca por su arquitectura colonial, iglesias emblemáticas y calles llenas de historia y cultura.'),

              ImageSection(image: 'images/lake5.jpeg'),
              TitleSection(name: 'Panecillo', location: 'QUITO'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/s1USTaxRjMVx3n7i8'),
              TextSection(description: 'El Panecillo ofrece una vista panorámica de la ciudad de Quito y alberga la icónica estatua de la Virgen de Quito.El Panecillo ofrece una vista panorámica de la ciudad de Quito y alberga la icónica estatua de la Virgen de Quito.'),

              ImageSection(image: 'images/lake6.jpeg'),
              TitleSection(name: 'Mitad del mundo', location: 'QUITO'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/TCJvVwHu6Kw7HXdi8'),
              TextSection(description: 'Monumento turístico ubicado sobre la línea ecuatorial, donde los visitantes pueden conocer más sobre la geografía y cultura del Ecuador.'),

              ImageSection(image: 'images/lake7.jpeg'),
              TitleSection(name: 'Otavalo', location: 'IMBABURA'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/3iXeWyyjYw66kkG67'),
              TextSection(description: 'Famoso por su mercado artesanal, Otavalo es un destino ideal para descubrir la riqueza cultural y las tradiciones indígenas del país.'),

              ImageSection(image: 'images/lake8.jpeg'),
              TitleSection(name: 'Quilotoa', location: 'COTOPAXI'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/EwWtJvAKrKdHaLdq6'),
              TextSection(description: 'La laguna del Quilotoa sorprende con sus aguas de color turquesa ubicadas en el cráter de un volcán, rodeada de impresionantes paisajes andinos.'),

              ImageSection(image: 'images/lake9.jpeg'),
              TitleSection(name: 'Mindo', location: 'PICHINCHA'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/L6oHsL9WiFD3ivoG8'),
              TextSection(description: 'Mindo es un destino natural ideal para los amantes de la flora y fauna, con una gran diversidad de especies en su entorno.'),

              ImageSection(image: 'images/lake10.jpeg'),
              TitleSection(name: 'Papallacta', location: 'NAPO'),
              ButtonSection(mapsUrl: 'https://maps.app.goo.gl/Ge9rKBJc6WzTfKd88'),
              TextSection(description: 'Papallacta es un lugar famoso por su clima tropical y sus paisajes exuberantes, perfecto para disfrutar de la naturaleza.'),

            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key,required this.mapsUrl,});

  final String mapsUrl;

  Future<void> _openMaps() async {
    final Uri url = Uri.parse(mapsUrl);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir Google Maps');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL',onPressed: () {},),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE', onPressed: _openMaps,),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE', onPressed: () {},),
        ],
      ),
    );
  }

}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}


class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}


class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_favoriteCount'))),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

 
}


