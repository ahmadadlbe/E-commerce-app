import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/controller/test_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return FlutterMap(
      options: MapOptions(
        keepAlive: true,
        center: LatLng(33.401181, 36.321234),
        zoom: 3.2,
      ),
      nonRotatedChildren: [
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
      children: [
        MarkerLayer(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(33, 36),
              builder: (contex) => Container(
                child: const Icon(
                  Icons.location_pin,
                ),
              ),
            ),
          ],
        ),
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [
                LatLng(51.5, -0.09),
                LatLng(51.6, -0.1),
              ],
              color: Colors.red,
              strokeWidth: 4.0,
            ),
          ],
        )
      ],
    );
  }
}
// AIzaSyBE1p4QNad4zp54NeIsJHf_RTEZZgaJOwc
