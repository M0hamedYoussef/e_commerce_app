import 'package:e_commerce/controller/address/edit_address_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressEditMap extends StatelessWidget {
  const AddressEditMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue,
      height: AppDecoration().screenHeight * .3,
      child: GetBuilder<AddressEditCon>(
        builder: (controller) {
          if (!controller.close) {
            return GoogleMap(
              initialCameraPosition: controller.cameraPosition,
              mapType: MapType.normal,
              markers: controller.myMarkers.toSet(),
              onTap: (argument) {
                controller.addMarker(latLng: argument);
              },
              onMapCreated: (controllerMap) {
                controller.controllerCompleter.complete(controllerMap);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
