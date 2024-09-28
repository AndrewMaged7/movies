// import 'package:flutter/material.dart';
// import 'package:movies_app/api/api_manager.dart';
// import 'package:movies_app/models/details_model.dart';
// import 'package:movies_app/provider/provider_app.dart';
// import 'package:movies_app/ui/widgets/image_add_watched.dart';
// import 'package:provider/provider.dart';

// class DetailsScreen extends StatelessWidget {
//   static const String routeName = 'details';
//   const DetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var pro = Provider.of<ProviderApp>(context);
//     DetailsModel details =
//         ModalRoute.of(context)!.settings.arguments as DetailsModel;
//     return Scaffold(
//       backgroundColor: const Color(0xff1D1E1D),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff282A28),
//         title: Text(details.title,
//             style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white)),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.3,
//               width: double.infinity,
//               child: Image.network(
//                   "https://image.tmdb.org/t/p/w500${details.image}",
//                   fit: BoxFit.cover),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(details.title,
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 5),
//                   Text(details.time,
//                       style: const TextStyle(color: Colors.grey, fontSize: 18)),
//                   Container(
//                     margin: const EdgeInsets.only(top: 15),
//                     height: MediaQuery.of(context).size.height * 0.25,
//                     width: double.infinity,
//                     child: Row(
//                       children: [
//                         Container(
//                           height: double.infinity,
//                           width: MediaQuery.of(context).size.width * 0.4,
//                           child: Image.network(
//                               "https://image.tmdb.org/t/p/w500${details.image}",
//                               fit: BoxFit.cover),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: Expanded(
//                             child: Container(
//                               width: MediaQuery.of(context).size.width*0.4,
//                               child: Column(
//                                 children: [
//                                   FutureBuilder(
//                                       future: ApiManager.getTopLevelDetails(
//                                           details.id),
//                                       builder: (context, snapshot) {
//                                         if (snapshot.connectionState ==
//                                             ConnectionState.waiting) {
//                                           return const Center(
//                                             child: CircularProgressIndicator(),
//                                           );
//                                         }
//                                         print(
//                                             "====================finish wating");
//                                         if (snapshot.hasError) {
//                                           return Center(
//                                             child: Text(
//                                               "${snapshot.error}",
//                                               style:const TextStyle(
//                                                   fontSize: 30,
//                                                   color: Colors.red),
//                                             ),
//                                           );
//                                         }
//                                         print("====================finish error");
//                                         return Container(
//                                           child:const Text("genres."),
//                                         );
//                                       }),
//                                   const Spacer(),
//                                   Expanded(
//                                     child: ListView(
//                                       children: [
//                                         Text(details.description,
//                                             style: const TextStyle(
//                                                 color: Colors.white, fontSize: 14)),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.star,
//                                           size: 25, color: Colors.amber),
//                                       const SizedBox(width: 5),
//                                       Text(details.rate.toString(),
//                                           style: const TextStyle(
//                                               color: Colors.white, fontSize: 16))
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),
//             FutureBuilder(
//                 future: ApiManager.getSimilar(details.id),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   print("===============finish wating====================");
//                   if (snapshot.hasError) {
//                     print(snapshot.error);
//                   }
//                   print("===============finish error====================");
//                   var details = snapshot.data!.results;
//                   return Container(
//                     color: const Color(0xff282A28),
//                     height: 350,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.only(left: 15, top: 15),
//                           child: Text("More Like This",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: details!.length,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   height: 150,
//                                   width: 160,
//                                   margin: const EdgeInsets.all(15),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.pushNamed(
//                                             context,
//                                             DetailsScreen.routeName,
//                                             arguments: DetailsModel(
//                                                 image:
//                                                     details[index].posterPath!,
//                                                 title: details[index].title!,
//                                                 description:
//                                                     details[index].overview!,
//                                                 time: details[index]
//                                                     .releaseDate
//                                                     .toString(),
//                                                 rate:
//                                                     details[index].popularity!,
//                                                 id: details[index]
//                                                     .id
//                                                     .toString()),
//                                           );
//                                         },
//                                         child: Stack(
//                                           children: [
//                                             Image.network(
//                                               "https://image.tmdb.org/t/p/w500${details[index].posterPath}",
//                                               height: 160,
//                                               width: 180,
//                                               fit: BoxFit.cover,
//                                               errorBuilder:
//                                                   (BuildContext context,
//                                                       Object error,
//                                                       StackTrace? stackTrace) {
//                                                 return const Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     SizedBox(height: 40),
//                                                     Icon(Icons.error,
//                                                         color: Colors.red,
//                                                         size: 50),
//                                                     SizedBox(height: 10),
//                                                     Text(
//                                                       'Could not load image',
//                                                       style: TextStyle(
//                                                           color: Colors.red,
//                                                           fontSize: 24),
//                                                     )
//                                                   ],
//                                                 );
//                                               },
//                                               loadingBuilder:
//                                                   (BuildContext context,
//                                                       Widget child,
//                                                       ImageChunkEvent?
//                                                           loadingProgress) {
//                                                 if (loadingProgress == null)
//                                                   return child;
//                                                 return Center(
//                                                   child:
//                                                       CircularProgressIndicator(
//                                                     value: loadingProgress
//                                                                 .expectedTotalBytes !=
//                                                             null
//                                                         ? loadingProgress
//                                                                 .cumulativeBytesLoaded /
//                                                             (loadingProgress
//                                                                     .expectedTotalBytes ??
//                                                                 1)
//                                                         : null,
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                             ImageAddToWatchedList(
//                                               icon: Icons.add,
//                                               saveData:
//                                                   saveDataFunction(context,index),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           const Icon(
//                                             Icons.star,
//                                             size: 30,
//                                             color: Colors.amber,
//                                           ),
//                                           Text(
//                                               details[index]
//                                                   .popularity
//                                                   .toString(),
//                                               style: const TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 18))
//                                         ],
//                                       ),
//                                       Text(details[index].title!,
//                                           style: const TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold)),
//                                       Expanded(
//                                         child: Text(details[index].releaseDate!,
//                                             style: const TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14)),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               }),
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
//   saveDataFunction(BuildContext context, int index) {
//     var pro = Provider.of<ProviderApp>(context);
//      pro.upLoadDataToDataBase(
//         title: ,
//         des: results![index].overview!,
//         id: results![index].id!,
//         date: results![index].releaseDate!);
//   }
// }
