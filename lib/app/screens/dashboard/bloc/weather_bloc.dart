import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmotion_practical/app/screens/dashboard/model/weather_model.dart';
import 'package:inmotion_practical/app/screens/dashboard/repo/weather_repo.dart';

class WeatherBloc extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial());

  callCategory(location) async {
    emit(WeatherLoading());

    final weather = await weatherRepository.getWeather(location);
    emit(WeatherLoaded(weather: weather));
  }

  WeatherState get initialState => WeatherInitial();
}

/// cubits

abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final String location;

  GetWeather({required this.location});
}

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({required this.weather});
}

class WeatherError extends WeatherState {}
