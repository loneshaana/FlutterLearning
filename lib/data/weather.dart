class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  double pressure = 0;
  double humidity = 0;

  Weather(this.name, this.temperature, this.perceived, this.pressure,
      this.humidity, this.description);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    // temperature = (weatherMap['main'])['temp'] * (9/5) - 459.67 ?? 0;
    temperature = (weatherMap['main']['temp'] - 273.15) ?? 0.0;
    perceived = (weatherMap['main']['feels_like'] - 273.15) ?? 0.0;
    pressure = (weatherMap['main']['pressure'] - 273.15) ?? 0;
    humidity = (weatherMap['main']['humidity'] - 273.15) ?? 0;
    description = (weatherMap['weather'][0]['main']) ?? '';
  }
}
