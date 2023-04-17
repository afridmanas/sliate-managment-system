import 'package:flutter/material.dart';

class notes_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Results",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        titleSpacing: 15,
        centerTitle: true,
        scrolledUnderElevation: 15,
        flexibleSpace: const FlexibleSpaceBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 300.0),
            Container(
              width: width * 0.8,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: const Color(0xFFEFEFEF)),
                color: Colors.white,
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Subject Name",
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black,
              ),
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
