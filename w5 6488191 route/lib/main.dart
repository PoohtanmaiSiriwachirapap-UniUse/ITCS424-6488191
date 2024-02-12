import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/saved',
      routes: {
        '/saved': (context) => MyHomePage(
              title: 'saved recipe',
            ),
        '/recipe': (context) => RecipeDetails(title: 'recipe'),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
// home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class RecipeDetails extends StatelessWidget {
  RecipeDetails({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Recipe")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(5, 10.0, 2.0, 10.0),
          children: <Widget>[
            imageBox(name: "recipe", image: "img.png"),
            ProductBox(
                name: "recipe", description: "- ingredient 1\n- ingredient2"),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.name, required this.description})
      : super(key: key);
  final String name;
  final String description;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                        ],
                      )))
            ])));
  }
}

class imageBox extends StatelessWidget {
  imageBox({Key? key, required this.name, required this.image})
      : super(key: key);
  final String name;

  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/appimages/" + image),
            ])));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Saved Recipe")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(5, 10.0, 2.0, 10.0),
          children: <Widget>[
            savedRecipe(
                name: "recipe", description: "recipe", image: "img.png"),
            savedRecipe(
                name: "recipe", description: "recipe", image: "img.png"),
          ],
        ));
  }
}

class savedRecipe extends StatelessWidget {
  savedRecipe(
      {Key? key,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);
  final String name;
  final String description;

  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/appimages/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/recipe');
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Recipe details',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )))
            ])));
  }
}
