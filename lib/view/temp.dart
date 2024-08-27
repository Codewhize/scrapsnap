import 'package:flutter/material.dart';

class AddressTypeSelector extends StatefulWidget {
  const AddressTypeSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddressTypeSelectorState createState() => _AddressTypeSelectorState();
}

class _AddressTypeSelectorState extends State<AddressTypeSelector> {
  String _selectedAddressType = 'Home';

  // List of address types
  final List<String> addressTypes = ['Home', 'Office', 'Shop', 'Mall/Outlet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          // Generating radio buttons using a list and Row
          ...addressTypes.asMap().entries.map((entry) {
            int index = entry.key;
            String value = entry.value;

            // Create a row for every two items
            if (index % 2 == 0) {
              return Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(addressTypes[index]),
                      value: addressTypes[index],
                      groupValue: _selectedAddressType,
                      onChanged: (value) {
                        setState(() {
                          _selectedAddressType = value.toString();
                        });
                      },
                    ),
                  ),
                  // Check if next item exists, if not, show an empty container
                  Expanded(
                    child: index + 1 < addressTypes.length
                        ? RadioListTile(
                            title: Text(addressTypes[index + 1]),
                            value: addressTypes[index + 1],
                            groupValue: _selectedAddressType,
                            onChanged: (value) {
                              setState(() {
                                _selectedAddressType = value.toString();
                              });
                            },
                          )
                        : Container(),
                  ),
                ],
              );
            } else {
              return Container(); // Skip odd indexes since they are handled by the row
            }
          }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Submit action
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
