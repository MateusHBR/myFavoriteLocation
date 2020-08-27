import 'dart:io';

import 'package:flutter/material.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  String id;
  String title;
  PlaceLocation location;
  File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = File(json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image.path.toString(),
      'latitude': location.latitude,
      'longitude': location.longitude,
      'address': location.address,
    };
  }
}
