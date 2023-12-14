import 'dart:async';

import 'package:dev_test/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSection extends StatefulWidget {
  const MapSection({
    super.key,
  });

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    CameraPosition kGooglePlex = const CameraPosition(
      target: LatLng(
        12.919535387289914,
        77.546604564253,
      ),
      zoom: 10.0,
    );
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.lightGreyColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.fullscreen,
                  size: 35,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      color: AppTheme.whiteColor, shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/Icons/send.png',
                    height: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
