import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/controllers/weatherControl.dart';

class searchPage extends StatelessWidget {
  const searchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var readData = context.read<controlWeather>();
    var watchData = context.watch<controlWeather>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              TextField(
                onSubmitted: (value) async {
                  await readData.searchCity(value, context);
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(.25),
                  filled: true,
                  hintText: 'Enter Location',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(width: 0, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(width: 0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
