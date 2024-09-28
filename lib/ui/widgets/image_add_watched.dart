import 'package:flutter/material.dart';
import 'package:movies_app/provider/provider_app.dart';
import 'package:provider/provider.dart';

// import 'package:movies_app/provider/provider_app.dart';
// import 'package:provider/provider.dart';
// typedef onClick = Function();

class ImageAddToWatchedList extends StatefulWidget {
  ImageAddToWatchedList(
      {super.key,
      this.imageColor,
      this.color,
      // required this.onTap,
      required this.icon,
      // required this.saveDataFunction,
      required this.saveData});
  Color? imageColor = Colors.grey;
  Color? color = Colors.white;
  IconData icon;
  final VoidCallback saveData;

  // onClick onTap;
  // final VoidCallback saveDataFunction;
  // Function? saveData;
  @override
  State<ImageAddToWatchedList> createState() => _ImageAddToWatchedListState();
}

class _ImageAddToWatchedListState extends State<ImageAddToWatchedList> {
  late String title;
  late String date;
  late String des;
  late num id;
  // int index = 0;
  List moviesWatchList = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // widget.saveDataFunction;
        // widget.onTap,
        widget.saveData;
        widget.imageColor = Colors.amber;
        widget.icon = Icons.done;
        setState(() {});
      },
      child: Stack(
        children: [
          Image.asset(
            "assets/icons/Icon awesome-bookmark (1).png",
            color: widget.imageColor,
          ),
          Positioned(
              top: 15, left: 15, child: Icon(widget.icon, color: Colors.white)),
        ],
      ),
    );
  }

  saveData() {
    var pro = Provider.of<ProviderApp>(context);
    pro.upLoadDataToDataBase(title: title, des: des, id: id, date: date);
  }
}
