import 'package:flutter/material.dart';

class CarDetails {
  String make;
  String model;
  String regno;
  String value;
  String yom;

  CarDetails(
      {required this.make,
      required this.model,
      required this.regno,
      required this.value,
      required this.yom});
}

class CarDetailsModel extends ChangeNotifier {
  late CarDetails car;
  CarDetails get vehicle => car;

  void setCar(CarDetails value) {
    car = value;
    notifyListeners();
  }
}

class AddOn {
  String addon1;
  String addon2;
  String addon3;
  String addon4;
  String addon5;

  AddOn({
    required this.addon1,
    required this.addon2,
    required this.addon3,
    required this.addon4,
    required this.addon5,
  });
}

class AddOnModel extends ChangeNotifier {
  late AddOn addon;
  AddOn get addoncost => addon;

  void setRider(AddOn value) {
    addon = value;
    notifyListeners();
  }
}
