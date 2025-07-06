import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privilee_assesment/core/resources/app_colors.dart';
import 'package:privilee_assesment/features/venues/bloc/venues_bloc.dart';
import 'package:privilee_assesment/features/venues/data/models/venue_item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class VenuesList extends StatelessWidget {
  const VenuesList({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageViewCotroller = PageController();

    return BlocBuilder<VenuesBloc, VenuesState>(
      builder: (context, state) {
        if (state is GetVenuesSuccessState) {
          List<VenueItemModel> venues =
              state.venueModel.items as List<VenueItemModel>;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              children: List.generate(venues.length, (index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: PageView.builder(
                            controller: pageViewCotroller,
                            itemCount: venues[index].images.length,
                            itemBuilder: (context, pIndex) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      venues[index].images[pIndex].url ?? '',
                                  placeholder:
                                      (context, url) =>
                                          CircularProgressIndicator(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 77,
                                              vertical: 55,
                                            ),
                                          ),
                                  errorWidget:
                                      (context, url, error) =>
                                          Icon(Icons.error),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 70,
                          child: SmoothPageIndicator(
                            controller: pageViewCotroller,
                            count: venues[index].images.length,
                            effect: WormEffect(
                              dotColor: AppColors.primaryColor.withValues(
                                alpha: .5,
                              ),
                              activeDotColor: AppColors.primaryColor,
                              dotHeight: 8,
                              dotWidth: 8,
                              type: WormType.thinUnderground,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      minTileHeight: 1,
                      contentPadding: EdgeInsets.zero,
                      title: SizedBox(
                        child: Text(
                          venues[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        venues[index].location,
                        style: TextStyle(color: AppColors.secundaryTextColor),
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        } else {
          return Center(child: Text('Fail to load venues'));
        }
      },
    );
  }
}
