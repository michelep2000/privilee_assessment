import 'package:flutter/material.dart';
import 'package:privilee_assesment/core/di/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privilee_assesment/core/resources/app_colors.dart';
import 'package:privilee_assesment/features/venues/bloc/venues_bloc.dart';
import 'package:privilee_assesment/features/venues/presentation/components/venues_view.dart';

class VenuesPage extends StatelessWidget {
  const VenuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VenuesBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: VenuesView(),
      ),
    );
  }
}
