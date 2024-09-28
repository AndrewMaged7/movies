// import 'package:flutter/material.dart';

// class FutureBuilderWidget extends StatelessWidget {
//   FutureBuilderWidget({super.key, this.future, this.results,this.title});
//   var future;
//   Object? results;
//   String? title;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: future,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           print("===============finish wating====================");
//           if (snapshot.hasError) {
//             print(snapshot.error);
//           }
//           print("===============finish error====================");
//           var result = snapshot.data!.results;
//           return Container(
//             color: const Color(0xff282A28),
//             height: 350,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding:const EdgeInsets.only(left: 15, top: 15),
//                   child: Text("$title",
//                       style:const TextStyle(
//                           color: Colors.white,
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: result!.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           height: 150,
//                           width: 180,
//                           margin: const EdgeInsets.all(15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Stack(
//                                 children: [
//                                   Image.network(
//                                     "https://image.tmdb.org/t/p/w500${result[index].backdropPath!}",
//                                     height: 160,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (BuildContext context,
//                                         Object error, StackTrace? stackTrace) {
//                                       return const Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(Icons.error,
//                                               color: Colors.red, size: 50),
//                                           SizedBox(height: 10),
//                                           Text(
//                                             'Could not load image',
//                                             style: TextStyle(
//                                                 color: Colors.red,
//                                                 fontSize: 24),
//                                           )
//                                         ],
//                                       );
//                                     },
//                                     loadingBuilder: (BuildContext context,
//                                         Widget child,
//                                         ImageChunkEvent? loadingProgress) {
//                                       if (loadingProgress == null) return child;
//                                       return Center(
//                                         child: CircularProgressIndicator(
//                                           value: loadingProgress
//                                                       .expectedTotalBytes !=
//                                                   null
//                                               ? loadingProgress
//                                                       .cumulativeBytesLoaded /
//                                                   (loadingProgress
//                                                           .expectedTotalBytes ??
//                                                       1)
//                                               : null,
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   ImageAddToWatchedList(icon: Icons.add)
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.star,
//                                     size: 30,
//                                     color: Colors.amber,
//                                   ),
//                                   Text(result[index].popularity.toString(),
//                                       style: const TextStyle(
//                                           color: Colors.white, fontSize: 18))
//                                 ],
//                               ),
//                               Text(result[index].title!,
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold)),
//                               Text(result[index].releaseDate!,
//                                   style: const TextStyle(
//                                       color: Colors.grey, fontSize: 14))
//                             ],
//                           ),
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
