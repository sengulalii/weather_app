import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/page_helper.dart';
import 'package:weather_app/helper/variable_helper.dart';
import 'package:weather_app/view/home_page.dart';
import 'package:weather_app/viewmodel/content_viewmodel.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with PageHelper, VariableHelper {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ContentViewModel>(context, listen: false)
          .getWeather(cityName!);
    });
    // ignore: avoid_print
    print("initStateTetiklendi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var contentViewModel = Provider.of<ContentViewModel>(context, listen: true);
    // ignore: unused_local_variable
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                cityNameSet = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                // ignore: avoid_print
                print("Seçilen Şehir: $cityName");
                contentViewModel.getWeather(cityName!);
              },
              icon: const Icon(Icons.settings))
        ],
        title: const Text('WEATHER APP'),
        backgroundColor: color,
      ),
      body: Column(
        children: [
          Expanded(
            child: (contentViewModel.serviceStatus == ServiceStatus.busy)
                ? const Center(
                    child: Text("Hava Durumu Yükleniyor"),
                  )
                : contentViewModel.serviceStatus == ServiceStatus.completed
                    ? dataWidget()
                    : contentViewModel.serviceStatus == ServiceStatus.error
                        ? const Center(child: Text("Hata"))
                        : const Center(child: Text("Bilinmeyen durum")),
          )
        ],
      ),
    );
  }

  /*Widget dataWidget() {
    var contentViewModel = Provider.of<ContentViewModel>(context, listen: true);
    return ListView.builder(
        itemCount: contentViewModel.weather.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              Image.network(
                  // ignore: prefer_interpolation_to_compose_strings
                  "https:" + contentViewModel.weather[index].picture!),
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                contentViewModel.weather[index].minTemp!.toStringAsFixed(0) +
                    "°",
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                contentViewModel.weather[index].weatherstate!,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                contentViewModel.weather[index].lastUpdate!,
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  try {
                    Provider.of<ContentViewModel>(context, listen: false)
                        .getWeather();
                    // ignore: avoid_print
                    print("değiştir");
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Hata"),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.change_circle),
              ),
            ],
          );
        });
  }*/

  Widget dataWidget() {
    var contentViewModel = Provider.of<ContentViewModel>(context, listen: true);
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              contentViewModel.cityName ?? "",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          contentViewModel.picture != null ? Image.network(
              // ignore: prefer_interpolation_to_compose_strings
              "https:" + contentViewModel.picture!) : const Icon(Icons.image),
          Text(contentViewModel.weatherstate ?? ""),
          contentViewModel.maxTemp != null
              // ignore: unnecessary_string_interpolations
              ? Text("${contentViewModel.maxTemp!.toStringAsFixed(0)}°",
                  style: const TextStyle(fontSize: 25))
              : const Text(""),
          Text(contentViewModel.lastUpdate ?? ""),
          IconButton(
            onPressed: () {
              try {
                Provider.of<ContentViewModel>(context, listen: false)
                    .getWeather(cityName!);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Hata"),
                  ),
                );
              }
            },
            icon: const Icon(Icons.change_circle),
          ),
        ],
      ),
    );
  }
}
