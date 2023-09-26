import 'package:flutter/material.dart';

Widget cartable(String reg, String make, String model, String yom ) {
  return Column(
    children: [
      Table(
        border: TableBorder.all(),
        children: [
          const TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Reg No",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Make",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Model",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                reg,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                make,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                model,
              ),
            ),
          ]),
        ],
      ),
      const SizedBox(
        height: 7,
      ),
      Table(
        border: TableBorder.all(),
        children: [
          const TableRow(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Engine CC",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Chassis NO",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "YOM",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          TableRow(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("573HEH537D"),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("TFHG6777"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(yom),
            ),
          ]),
        ],
      ),
    ],
  );
}
