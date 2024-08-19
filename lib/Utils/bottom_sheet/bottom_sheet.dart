import 'package:flutter/material.dart';

void showGenericBottomSheet(BuildContext context, List<Map<String, VoidCallback>> items) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding:  EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 80, // Ensure bottom padding is respected
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            String title = item.keys.first;
            VoidCallback onTap = item.values.first;
            return ListTile(
              title: Text(title),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                onTap(); // Execute the respective function
              },
            );
          }).toList(),
        ),
      );
    },
  );
}
