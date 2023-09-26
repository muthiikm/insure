class VehicleInsurance {
  String make;
  String model;
  int year;
  double value;
  late double premium;

  VehicleInsurance(this.make, this.model, this.year, this.value) {
    calculatePremium();
  }

  void calculatePremium() {
    int age = DateTime.now().year - year;
    double baseRate = value * 0.0325;
    double ageRate = age >= 3 ? (age - 2) * 0.02 : 0.0;
    premium = baseRate + ageRate;
    return;
  }

  void printPolicy() {
    print('Policy for $make $model ($year)');
    print('Value: \$$value');
    print('Premium: \$$premium');
  }
}
