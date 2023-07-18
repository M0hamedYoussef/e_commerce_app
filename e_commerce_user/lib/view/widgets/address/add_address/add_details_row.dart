import 'package:e_commerce/view/widgets/address/add_address/details_row_elements/city_form.dart';
import 'package:e_commerce/view/widgets/address/add_address/details_row_elements/street_form.dart';
import 'package:flutter/material.dart';

class AddressAddDetailsRow extends StatelessWidget {
  const AddressAddDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AddressAddCityForm(),
          AddressAddStreetForm(),
        ],
      ),
    );
  }
}
