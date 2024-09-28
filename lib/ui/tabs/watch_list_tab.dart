import 'package:flutter/material.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50,left: 20),
      child: Column(
        children: [
        Text("Watch List",style: TextStyle(color: Colors.white,fontSize: 24)),
        // ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount)
        ],
      ),
    );
  }
}