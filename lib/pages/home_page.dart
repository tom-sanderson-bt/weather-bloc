import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_bloc/constants/constants.dart';
import 'package:open_weather_bloc/cubits/settings/settings_cubit.dart';
import 'package:open_weather_bloc/cubits/weather/weather_cubit.dart';
import 'package:open_weather_bloc/pages/search_page.dart';
import 'package:open_weather_bloc/pages/settings_page.dart';
import 'package:open_weather_bloc/widgets/error_dialogue.dart';
import 'package:recase/recase.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget showIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: 'http://$kIconHost/img/wn/$icon@4x.png',
      width: 96,
      height: 96,
    );
  }

  Widget showDescription(String description) {
    return Text(description.titleCase,
        textAlign: TextAlign.center, style: const TextStyle(fontSize: 30.0));
  }

  String formatTemp(double temp) {
    final useCelcius = context.watch<SettingsCubit>().state.useCelcius;
    if (useCelcius) {
      return "${temp.toStringAsFixed(2)}°C";
    }
    double fahrenheit = (temp * 1.8) + 32;
    return "${fahrenheit.toStringAsFixed(2)}℉";
  }

  Widget showWeather() {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        print("${state.status} ${state.error}");
        if (state.status == WeatherStatus.error) {
          return errorDialogue(context, state.error.errorMsg);
        }
      },
      builder: (context, state) {
        if (state.status == WeatherStatus.loading) {
          return const CircularProgressIndicator();
        }

        if (state.status == WeatherStatus.initial ||
            (state.status == WeatherStatus.error && state.weather.name == '')) {
          return const Text('Select a city', style: TextStyle(fontSize: 18.0));
        }

        return ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text(
              state.weather.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat.Hm().format(state.weather.lastUpdated!),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(formatTemp(state.weather.temp),
                    style: const TextStyle(fontSize: 30.0)),
                Column(
                  children: [
                    Text(formatTemp(state.weather.tempMin),
                        style: const TextStyle(fontSize: 20.0)),
                    Text(formatTemp(state.weather.tempMax),
                        style: const TextStyle(fontSize: 20.0))
                  ],
                )
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                showIcon(state.weather.icon),
                Expanded(
                  flex: 3,
                  child: showDescription(state.weather.description),
                ),
                const Spacer(),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              final city = await Navigator.of(context).push<String?>(
                MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }),
              );
              if (!context.mounted) return;
              if (city != null) {
                context.read<WeatherCubit>().fetchWeather(city);
              }
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push<String?>(
                MaterialPageRoute(builder: (context) {
                  return const SettingsPage();
                }),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: showWeather(),
      ),
    );
  }
}
