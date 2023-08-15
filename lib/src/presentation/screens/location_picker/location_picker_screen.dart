import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/src/core/app_router/app_router.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';
import 'package:weather_app/src/domain/blocs/geolocation/geolocation_bloc.dart';
import 'package:weather_app/src/domain/blocs/location_picker/location_picker_bloc.dart';
import 'package:weather_app/src/domain/entities/location/location_entity.dart';
import 'package:weather_app/src/presentation/screens/location_picker/components/location_widget.dart';
import 'package:weather_app/src/presentation/widgets/custom_app_bar.dart';
import 'package:weather_app/src/presentation/widgets/map/map_widget.dart';

class LocationPickerScreen extends StatefulWidget with AutoRouteWrapper {
  const LocationPickerScreen({
    super.key,
    required this.onPicked,
  });

  final void Function(LocationEntity location) onPicked;

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LocationPickerBloc>(
      create: (_) => LocationPickerBloc(),
      child: this,
    );
  }
}

class _LocationPickerScreenState extends State<LocationPickerScreen>
    with SingleTickerProviderStateMixin {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final LatLng? currentLocation =
          context.read<GeolocationBloc>().state.currentLocation;
      if (currentLocation == null) return;

      _mapController.animatedMove(
        destLocation: currentLocation,
        destZoom: _mapController.zoom,
        vsync: this,
      );
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationPickerBloc, LocationPickerState>(
      listener: (context, state) {
        if (state is LocationPickerError) {
          return context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: L10n.of(context).chooseLocation),
          body: SafeArea(
            bottom: false,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BlocBuilder<GeolocationBloc, GeolocationState>(
                  builder: (context, geoState) {
                    final LatLng? center = geoState.currentLocation;
                    return MapWidget(
                      mapController: _mapController,
                      center: center,
                      zoom: 9.0,
                      onTap: (tapPosition, point) {
                        context.read<LocationPickerBloc>().pick(point);
                      },
                    );
                  },
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  transitionBuilder: (child, animation) => SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: -1,
                    child: child,
                  ),
                  child: state is LocationPickerLoaded
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: LocationWidget(
                            name: state.location.fullLocality,
                            onPressed: () {
                              widget.onPicked(state.location);
                              context.router.pop<LocationEntity>(state.location);
                            },
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
