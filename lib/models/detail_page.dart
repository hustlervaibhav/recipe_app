import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:shimmer/shimmer.dart';

class DetailPage extends StatelessWidget {
  final Recipes recipe;
  final bool isLoading;
  const DetailPage(
      {super.key,
      required this.recipe,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 255, 196,
                  113), // Dark blue
              Colors.white, // Black
            ],
          )),
        ),
        title: Text(
          "Detail recipe",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(
                255, 255, 196, 113), // Dark blue
            Colors.white, // Black
          ],
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  isLoading
                      ? Shimmer.fromColors(
                          baseColor:
                              Colors.grey[300]!,
                          highlightColor:
                              Colors.grey[100]!,
                          child: Container(
                            height: 350,
                            width: size.width,
                            color: Colors.white,
                          ))
                      : Image.network(
                          recipe.image ?? "",
                          fit: BoxFit.cover,
                          height: 350,
                          width: size.width,
                        ),
                  Padding(
                    padding:
                        MediaQuery.of(context)
                            .padding,
                    child: Positioned(
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 30,
                    right: 30,
                    child: isLoading
                        ? Shimmer.fromColors(
                            baseColor:
                                Colors.grey[300]!,
                            highlightColor:
                                Colors.grey[100]!,
                            child: Container(
                              height: 140,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              20),
                                  color: Colors
                                      .white),
                            ))
                        : Container(
                            height: 140,
                            width: size.width,
                            decoration:
                                BoxDecoration(
                                    boxShadow: [
                                  BoxShadow(
                                      color: Colors
                                          .black,
                                      spreadRadius:
                                          2,
                                      blurRadius:
                                          2)
                                ],
                                    // backgroundBlendMode:
                                    //     BlendMode.overlay,
                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                                20),
                                    color: Colors
                                        .amber),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets
                                            .all(
                                            15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                      children: [
                                        Text(
                                          recipe.name ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight
                                                  .bold,
                                              fontSize:
                                                  16,
                                              color:
                                                  Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              recipe.mealType?[0] ??
                                                  "",
                                              softWrap:
                                                  true,
                                              overflow:
                                                  TextOverflow.visible,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width:
                                                  50,
                                            ),
                                            Icon(
                                              Icons.food_bank_outlined,
                                              color:
                                                  Colors.white,
                                            ),
                                            Text(
                                              recipe.cuisine ??
                                                  "",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: size
                                        .width,
                                    decoration:
                                        BoxDecoration(
                                            borderRadius: BorderRadius
                                                .only(
                                              bottomLeft:
                                                  Radius.circular(
                                                20,
                                              ),
                                              bottomRight:
                                                  Radius.circular(20),
                                            ),
                                            color:
                                                Colors.white),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              16,
                                        ),
                                        Icon(
                                          Icons
                                              .star,
                                          color: Colors
                                              .orange,
                                        ),
                                        Text(recipe
                                            .rating
                                            .toString()),
                                        SizedBox(
                                          width:
                                              50,
                                        ),
                                        Icon(
                                          Icons
                                              .access_time_filled,
                                          color: const Color
                                              .fromARGB(
                                              255,
                                              36,
                                              185,
                                              254),
                                        ),
                                        Text(recipe
                                            .cookTimeMinutes
                                            .toString()),
                                        SizedBox(
                                          width:
                                              50,
                                        ),
                                        Icon(
                                          Icons
                                              .accessibility,
                                          color: Colors
                                              .orange,
                                        ),
                                        Text(
                                            "${recipe.caloriesPerServing.toString()} kcl")
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Ingredients",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(
                              left: 15, top: 10),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: List.generate(
                          recipe.ingredients!
                              .length,
                          (index) => isLoading
                              ? Shimmer
                                  .fromColors(
                                      baseColor:
                                          Colors.grey[
                                              300]!,
                                      highlightColor:
                                          Colors.grey[
                                              100]!,
                                      child:
                                          Container(
                                        width: size
                                                .width *
                                            0.8,
                                        height:
                                            18,
                                        color: Colors
                                            .white,
                                      ))
                              : Text(
                                  "- ${recipe.ingredients![index]}",
                                  style:
                                      TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Instructions",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(
                              left: 15, top: 10),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: List.generate(
                          recipe.instructions!
                              .length,
                          (index) => isLoading
                              ? Shimmer
                                  .fromColors(
                                      baseColor:
                                          Colors.grey[
                                              300]!,
                                      highlightColor:
                                          Colors.grey[
                                              100]!,
                                      child:
                                          Container(
                                        height:
                                            18,
                                        width: size
                                                .width *
                                            0.8,
                                        color: Colors
                                            .white,
                                      ))
                              : Text(
                                  "- ${recipe.instructions![index]}",
                                  style:
                                      TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
