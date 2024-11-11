import 'package:flutter/material.dart';
import 'package:recipe_app/models/detail_page.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/models/service.dart';
import 'package:shimmer/shimmer.dart';

class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({
    super.key,
  });

  @override
  State<RecipeHomePage> createState() =>
      _RecipePageState();
}

class _RecipePageState
    extends State<RecipeHomePage> {
  List<Recipes> recipeModel = [];
  bool isLoading = true;

  Future myRecipes() async {
    recipesItems().then((value) {
      setState(() {
        recipeModel = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    myRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: const Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(height: 10),
              Text("List of recipes"),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 196,
                  113), // Dark blue
              Colors.white, // Black
            ],
          )),
          child: isLoading
              ? ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor:
                          Colors.grey.shade300,
                      highlightColor:
                          Colors.grey.shade100,
                      child: Padding(
                        padding:
                            const EdgeInsets.all(
                                8.0),
                        child: Container(
                          height: 250,
                          decoration:
                              BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius
                                    .circular(30),
                          ),
                        ),
                      ),
                    );
                  })
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipeModel.length,
                  itemBuilder: (context, index) {
                    final recipes =
                        recipeModel[index];
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder:
                                      (BuildContext
                                          context) {
                            return DetailPage(
                              recipe: recipes,
                            );
                          }));
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 250,
                              decoration:
                                  BoxDecoration(
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            30),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        recipes.image ??
                                            ''),
                                    fit: BoxFit
                                        .fill),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors
                                          .black,
                                      offset:
                                          Offset(
                                              -5,
                                              7),
                                      blurStyle:
                                          BlurStyle
                                              .inner,
                                      blurRadius:
                                          5),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 45,
                                decoration:
                                    BoxDecoration(
                                  color: Colors
                                      .black26,
                                  borderRadius:
                                      BorderRadius
                                          .only(
                                    bottomLeft: Radius
                                        .circular(
                                            30),
                                    bottomRight: Radius
                                        .circular(
                                            30),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child:
                                          Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                                8),
                                        child:
                                            Text(
                                          recipes.name ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight
                                                  .w700,
                                              color: Colors
                                                  .white,
                                              fontSize:
                                                  16,
                                              fontStyle:
                                                  FontStyle.italic),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors
                                          .yellowAccent,
                                      size: 30,
                                    ),
                                    Text(
                                      recipes
                                          .rating
                                          .toString(),
                                      style:
                                          TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .w700,
                                        color: Colors
                                            .white,
                                        fontSize:
                                            16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      recipes
                                          .cookTimeMinutes
                                          .toString(),
                                      style:
                                          TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .w700,
                                        color: Colors
                                            .white,
                                        fontSize:
                                            16,
                                      ),
                                    ),
                                    Text(
                                      "min",
                                      style:
                                          TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .w700,
                                        color: Colors
                                            .white,
                                        fontSize:
                                            16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
        ));
  }
}
