import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privilee_assesment/core/resources/app_colors.dart';
import 'package:privilee_assesment/core/resources/app_media.dart';
import 'package:privilee_assesment/features/venues/bloc/venues_bloc.dart';
import 'package:privilee_assesment/features/venues/presentation/components/filter_list.dart';
import 'package:privilee_assesment/features/venues/presentation/components/venues_list.dart';
class VenuesView extends StatefulWidget {
  const VenuesView({super.key});

  @override
  State<VenuesView> createState() => _VenuesViewState();
}

class _VenuesViewState extends State<VenuesView> {
  final List<String> titles = [
    'Pool & beach',
    'Fitness',
    'Family activities',
    'Dinner',
    'Gym',
    'Restaurants',
    'Spas',
    'Hotels',
  ];

  @override
  void initState() {
    super.initState();
    context.read<VenuesBloc>().add(GetVenuesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: <Widget>[
              Material(
                elevation: 1,
                child: Container(
                  color: AppColors.headerColor,
                  height: 210,
                  child: Column(
                    children: [
                      SizedBox(height: 60.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppMedia.menu, scale: 15),
                            ),
                          ),
                          Image.asset(AppMedia.logo, scale: 3.5),
                          SizedBox(width: 50),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 40.0,
                          child: FilterList(titles: titles),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 180.0,
                left: 0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 8,
                  ),
                  child: SizedBox(
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      elevation: 8,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search for venue',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: AppColors.secundaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: VenuesList()),
      ],
    );
  }
}
