import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_favorite_location/app/shared/models/place.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Place place;

  const PlaceDetailScreen({@required this.place});

  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appBarHeight = AppBar().preferredSize.height;
    final Color primaryColor = Theme.of(context).primaryColor;
    var utilSize =
        size.height - appBarHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.title),
      ),
      body: Container(
        height: size.height - appBarHeight - MediaQuery.of(context).padding.top,
        child: Column(
          children: [
            Container(
              height: utilSize * 0.65,
              width: double.infinity,
              child: Image.file(
                widget.place.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                widget.place.location.address,
                textAlign: TextAlign.center,
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            FlatButton.icon(
              onPressed: () {
                Modular.to.pushNamed(
                  '/form/map_screen',
                  arguments: [
                    LatLng(
                      widget.place.location.latitude,
                      widget.place.location.longitude,
                    ),
                    true,
                  ],
                );
              },
              textColor: primaryColor,
              icon: Icon(Icons.map),
              label: Text('Ver no mapa', textScaleFactor: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
