import 'package:flutter/material.dart';
import 'package:main_sub_category_assignment/data/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Categories",
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductListPageState();
  }
}

class ProductListPageState extends State<ProductListPage> {
  List<String> categoriesList = ["Drinks", "Meals", "Salads"];
  List<String> selectedCategoryList = [];
  @override
  Widget build(BuildContext context) {
    final filteredProduct = productList.where((product) {
      return selectedCategoryList.isEmpty ||
          selectedCategoryList.contains(product.category);
    }).toList();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(
            "https://media.istockphoto.com/id/1388791611/photo/teppanyaki-style.webp?b=1&s=170667a&w=0&k=20&c=o4FL_2iyEO2XQiliXts-JphIFAhXg5BYlxvjxmBbh7E=",
            width: double.infinity,
            fit: BoxFit.cover,
            height: 200,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categoriesList
                  .map(
                    (category) => FilterChip(
                        selected: selectedCategoryList.contains(category),
                        label: Text(category),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedCategoryList.add(category);
                            } else {
                              selectedCategoryList.remove(category);
                            }
                          });
                        }),
                  )
                  .toList(),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredProduct.length,
                  itemBuilder: (context, index) {
                    final product = filteredProduct[index];
                    return Card(
                      elevation: 8.0,
                      margin: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          title: Text(
                            product.productName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            product.category,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
