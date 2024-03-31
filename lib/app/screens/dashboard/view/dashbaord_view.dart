import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmotion_practical/app/screens/dashboard/bloc/weather_bloc.dart';
import 'package:inmotion_practical/app/screens/dashboard/repo/weather_repo.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _locationController = TextEditingController();
  final _weatherBloc = WeatherBloc(
    WeatherRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                hintText: "Enter location",
              ),
            ),
            const SizedBox(height: 16),
            MaterialButton(
              onPressed: () {
                if (_locationController.text.trim().isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  _weatherBloc.callCategory(_locationController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter location'),
                    ),
                  );
                }
              },
              child: const Text("Get Weather"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<WeatherBloc, WeatherState>(
                bloc: _weatherBloc,
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is WeatherLoaded) {
                    return Column(
                      children: [
                        Text("Temperature: ${state.weather.main?.temp ?? 0.0}"),
                        Text("Humidity: ${state.weather.main?.humidity ?? 0}"),
                        Text("Wind Speed: ${state.weather.wind?.speed ?? 0.0}"),
                        Text(
                            "Wind Condition: ${state.weather.weather?[0].main ?? ''}"),
                      ],
                    );
                  }
                  if (state is WeatherError) {
                    return const Center(child: Text("Failed to get weather"));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }
}
