import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/domain/blocs/forecasts/forecasts_bloc.dart';
import 'package:weather_app/src/domain/entities/location/location_entity.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
    required this.location,
  });

  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForecastsBloc, ForecastsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 48.h,
                bottom: 16.h,
              ),
              child: Text(
                location.fullLocality ?? '',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
