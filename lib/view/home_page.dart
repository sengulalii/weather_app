import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/page_helper.dart';
import 'package:weather_app/helper/variable_helper.dart';
import 'package:weather_app/viewmodel/content_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with PageHelper, VariableHelper {
  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, cityName),
        ),
        title: const Text("Select City"),
        backgroundColor: color,
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          textEditing(),
        ],
      ),
    );
  }

  Widget textEditing() {
    var contentViewModel = Provider.of<ContentViewModel>(context, listen: true);
    TextEditingController cityController = TextEditingController();
    var widht = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widht / 1 - 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Şehir",
                border: OutlineInputBorder(),
              ),
              controller: cityController,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              cityController.text.isNotEmpty
                  ? Navigator.pop(context, cityController.text)
                  : Navigator.pop(context, cityName);
            },
            icon: const Icon(Icons.search)),
      ],
    );
  }
}
