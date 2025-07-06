import 'package:flutter/material.dart';

class FilterList extends StatelessWidget {
  const FilterList({super.key, required this.titles});

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: GestureDetector(
              child: Text(titles[index], style: TextStyle(fontSize: 18)),
              onTap: () => {},
            ),
          ),
        );
      },
      itemCount: titles.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
    );
  }
}
