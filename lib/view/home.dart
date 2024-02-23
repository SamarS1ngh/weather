import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/app_typography.dart';
import 'package:weather_app/viewModel/weatherVM.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double temp = 0.0;
  fToC(double k) {
    temp = (k - 273.15);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherVM>(context, listen: false).determinePosition();
    Provider.of<WeatherVM>(context, listen: false).getPostition();
    Provider.of<WeatherVM>(context, listen: false).weatherApi();
    DateTime date = DateTime.now();
    String datetime = DateFormat('MMMM dd, yyyy').format(date);
    String weekDay = DateFormat('EEEE').format(date);

    return Scaffold(
      backgroundColor: const Color(0xffCDECFC),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 44, left: 188),
              child: Image.asset('assets/brain shaped cloud (1).png')),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Consumer<WeatherVM>(
              builder: (context, value, child) {
                log(value.temp.toString());
                fToC(value.temp);
                log(date.month.toString());
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        child: Column(
                      children: [
                        Text(
                          datetime,
                          style: AppTypography.style.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Consumer<WeatherVM>(
                            builder: (context, value, child) => Text(
                                  value.location,
                                  style: AppTypography.style.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                )),
                      ],
                    )),
                    Text(
                      "${temp.toStringAsFixed(2)} °C",
                      style: AppTypography.style.copyWith(fontSize: 40),
                    ),
                  ],
                );
              },
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/brain shaped cloud.png')),
                Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset('assets/Sun.png')),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            weekDay,
            style: AppTypography.style,
          )),
          Consumer<WeatherVM>(
            builder: (context, value, child) {
              return Text(
                value.mausam,
                style: AppTypography.style
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w400),
              );
            },
          ),
          Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Image.asset('assets/fgirl-walk-2-unscreen 1.png'),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/Meadows.png')),
          ]),
        ],
      ),
    );
  }
}
