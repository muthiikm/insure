import 'package:flutter/material.dart';
import 'package:insure/widgets/card.dart';


class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Our Policies", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.lightBlue.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 4,),
            policies(context)
          ],
        ),
      ),
    );
  }
}