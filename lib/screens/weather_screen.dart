import 'package:basics/data/http_helper.dart';
import 'package:basics/data/weather.dart';
import 'package:basics/shared/menu_bottom.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', 0, 0, 0, 0, '');
  final TextEditingController txtPlace = TextEditingController();

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getWeather(txtPlace.text);

    setState(() {
      result;
    });
  }

  Widget weatherRow(String label, String value) {
    if (value.isEmpty || value == '0' || value == '0.00') {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      bottomNavigationBar: const MenuBottom(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                      hintText: 'Enter a city',
                      suffixIcon: IconButton(
                        onPressed: getData,
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                weatherRow('Place', result.name),
                weatherRow('Description', result.description),
                weatherRow(
                    'Temperature', result.temperature.toStringAsFixed(2)),
                weatherRow('Perceived', result.perceived.toStringAsFixed(2)),
                weatherRow('Pressure', result.pressure.toString()),
                weatherRow('Humidity', result.humidity.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
