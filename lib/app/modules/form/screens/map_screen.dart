import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_favorite_location/app/modules/form/form_controller.dart';
import 'package:my_favorite_location/app/shared/models/place.dart';

class MapScreen extends StatefulWidget {
  final bool isReadOnly;
  final LatLng currentLocation;

  MapScreen({
    @required this.currentLocation,
    this.isReadOnly = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _controller = Modular.get<FormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        actions: [
          if (!widget.isReadOnly)
            Observer(
              builder: (_) {
                return IconButton(
                  icon: Icon(
                    Icons.check,
                    color: _controller.pickedPosition == null
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                  onPressed: _controller.pickedPosition == null
                      ? null
                      : () {
                          Modular.to.pop(_controller.pickedPosition);
                        },
                );
              },
            ),
        ],
      ),
      body: Observer(builder: (_) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: widget.currentLocation,
            zoom: 16,
          ),
          onTap: widget.isReadOnly ? null : _controller.selectPosition,
          markers: (_controller.pickedPosition == null && !widget.isReadOnly)
              ? null
              : {
                  Marker(
                    markerId: MarkerId('p1'),
                    position:
                        _controller.pickedPosition ?? widget.currentLocation,
                  ),
                },
        );
      }),
    );
  }
}
