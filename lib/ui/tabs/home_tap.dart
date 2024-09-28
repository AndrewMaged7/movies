import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/models/details_model.dart';
import 'package:movies_app/models/populer_model.dart';
import 'package:movies_app/provider/provider_app.dart';
import 'package:movies_app/ui/screens/details_screen.dart';
import 'package:movies_app/ui/widgets/image_add_watched.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatelessWidget {
  HomeTap({super.key});

  List<Results>? results = [];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ProviderApp>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
              future: ApiManager.getPopular(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                print("===============finish wating====================");
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                print("===============finish error====================");
                results = snapshot.data!.results ?? [];
                return Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: results!.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500${results![index].posterPath}",
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error,
                                          color: Colors.red, size: 50),
                                      SizedBox(height: 10),
                                      Text(
                                        'Could not load image',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 24),
                                      )
                                    ],
                                  );
                                },
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: MediaQuery.of(context).size.width * 0.35,
                              margin: const EdgeInsets.only(top: 100, left: 15),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    // onTap: () {
                                    //   Navigator.pushNamed(
                                    //     context,
                                    //     DetailsScreen.routeName,
                                    //     arguments: DetailsModel(
                                    //         image: results![index].posterPath!,
                                    //         title: results![index].title!,
                                    //         description:
                                    //             results![index].overview!,
                                    //         time: results![index]
                                    //             .releaseDate
                                    //             .toString(),
                                    //         rate: results![index].popularity!,
                                    //         id: results![index].id.toString()),
                                    //   );
                                    // },
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${results![index].posterPath}",
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        return const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.error,
                                                color: Colors.red, size: 50),
                                            SizedBox(height: 10),
                                            Text(
                                              'Could not load image',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 24),
                                            )
                                          ],
                                        );
                                      },
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    child: ImageAddToWatchedList(
                                      saveData: (){},
                                        // saveDataFunction: () {
                                        //       pro.upLoadDataToDataBase(
                                        //           title: results![index].title!,
                                        //           des: results![index].overview!,
                                        //           id: results![index].id!,
                                        //           date: results![index]
                                        //               .releaseDate!);
                                        //     },
                                        // saveData: saveDataFunction(context,index),
                                        icon: Icons.add),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width * 0.5,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.008,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    results![index].title!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    results![index].releaseDate!,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                );
              }),
          const SizedBox(height: 30),
          FutureBuilder(
              future: ApiManager.getReleases(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                print("===============finish wating====================");
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                print("===============finish error====================");
                var data = snapshot.data!.results;
                return Container(
                  color: const Color(0xff282A28),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 15),
                        child: Text("New Releases",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  // onTap: () {
                                  //   Navigator.pushNamed(
                                  //     context,
                                  //     DetailsScreen.routeName,
                                  //     arguments: DetailsModel(
                                  //         image: data[index].backdropPath!,
                                  //         title: data[index].title!,
                                  //         description: data[index].overview!,
                                  //         time: data[index]
                                  //             .releaseDate
                                  //             .toString(),
                                  //         rate: data[index].popularity!,
                                  //         id: data[index].id.toString()),
                                  //   );
                                  // },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        margin: const EdgeInsets.all(15),
                                        child: Image.network(
                                          "https://image.tmdb.org/t/p/w500${data[index].backdropPath ?? ''}",
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace) {
                                            return const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.error,
                                                    color: Colors.red,
                                                    size: 50),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Could not load image',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 24),
                                                )
                                              ],
                                            );
                                          },
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        (loadingProgress
                                                                .expectedTotalBytes ??
                                                            1)
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Positioned(
                                          top: 15,
                                          left: 15,
                                          child: ImageAddToWatchedList(
                                              saveData: (){},
                                            //       saveDataFunction: () {
                                            //   pro.upLoadDataToDataBase(
                                            //       title: data[index].title!,
                                            //       des: data[index].overview!,
                                            //       id: data[index].id!,
                                            //       date: data[index]
                                            //           .releaseDate!);
                                            // },
                                              // saveData:
                                              //     saveDataFunction(context,index),
                                              icon: Icons.add)),
                                    ],
                                  ),
                                );
                              })),
                    ],
                  ),
                );
              }),
          const SizedBox(height: 40),
          FutureBuilder(
              future: ApiManager.getRecommended(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                print("===============finish wating====================");
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                print("===============finish error====================");
                var result = snapshot.data!.results;
                return Container(
                  color: const Color(0xff282A28),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 15),
                        child: Text("Recommended",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: result!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: 180,
                                margin: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      // onTap: () {
                                      //   Navigator.pushNamed(
                                      //     context,
                                      //     DetailsScreen.routeName,
                                      //     arguments: DetailsModel(
                                      //         image:
                                      //             result[index].backdropPath!,
                                      //         title: result[index].title!,
                                      //         description:
                                      //             result[index].overview!,
                                      //         time: result[index]
                                      //             .releaseDate
                                      //             .toString(),
                                      //         rate: result[index].popularity!,
                                      //         id: result[index].id.toString()),
                                      //   );
                                      // },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            child: Image.network(
                                              "https://image.tmdb.org/t/p/w500${result[index].backdropPath!}",
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                return const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.error,
                                                        color: Colors.red,
                                                        size: 50),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      'Could not load image',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 24),
                                                    )
                                                  ],
                                                );
                                              },
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            (loadingProgress
                                                                    .expectedTotalBytes ??
                                                                1)
                                                        : null,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          ImageAddToWatchedList(
                                            saveData: (){},
                                            // saveDataFunction: () {
                                            //   pro.upLoadDataToDataBase(
                                            //       title: result[index].title!,
                                            //       des: result[index].overview!,
                                            //       id: result[index].id!,
                                            //       date: result[index]
                                            //           .releaseDate!);
                                            // },
                                            icon: Icons.add,
                                            // saveData: saveDataFunction(context,index),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 25,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                            result[index].popularity.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16))
                                      ],
                                    ),
                                    Expanded(
                                      child: Text(result[index].title!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Expanded(
                                      child: Text(result[index].releaseDate!,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  saveDataFunction(BuildContext context, int index) {
    var pro = Provider.of<ProviderApp>(context);
    pro.upLoadDataToDataBase(
        title: results![index].title!,
        des: results![index].overview!,
        id: results![index].id!,
        date: results![index].releaseDate!);
  }
}
