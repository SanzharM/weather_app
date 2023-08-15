import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/state_status/state_status.dart';
import 'package:weather_app/src/core/app_router/app_router.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:weather_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:weather_app/src/domain/blocs/forecasts/forecasts_bloc.dart';
import 'package:weather_app/src/presentation/screens/forecast_screen/forecast_widget.dart';
import 'package:weather_app/src/presentation/widgets/buttons/buttons.dart';

class ForecastsScreen extends StatefulWidget with AutoRouteWrapper {
  const ForecastsScreen({super.key});

  @override
  State<ForecastsScreen> createState() => _ForecastsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ForecastsBloc>(
      create: (_) => ForecastsBloc(),
      child: this,
    );
  }
}

class _ForecastsScreenState extends State<ForecastsScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ForecastsBloc, ForecastsState>(
      listener: (context, state) {
        if (state.status.isError) {
          return context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        final locations = state.locations;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: ColorName.transparent,
            actions: [
              AppIconButton(
                icon: Assets.icons.arrowRight.svg(),
                onPressed: () {
                  context.router.push<void>(
                    LocationPickerRoute(
                      onPicked: (location) {},
                    ),
                  );
                },
              )
            ],
          ),
          body: SafeArea(
            child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int page) {
                final location = locations.elementAt(page);
                if (location.latLng == null) return;

                context.read<ForecastsBloc>().getForecast(
                      location: location.latLng!,
                    );
              },
              itemCount: locations.length,
              itemBuilder: (_, i) {
                final location = locations.elementAt(i);
                return ForecastWidget(
                  location: location,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
