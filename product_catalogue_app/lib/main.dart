import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Store',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Default to light theme
      home: CatalogPage(),
    );
  }
}

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool isDarkTheme = false;
  List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'https://via.placeholder.com/150', price: 29.99),
    Product(name: 'Product 2', imageUrl: 'https://via.placeholder.com/150', price: 49.99),
    Product(name: 'Product 3', imageUrl: 'https://via.placeholder.com/150', price: 19.99),
    Product(name: 'Product 4', imageUrl: 'https://via.placeholder.com/150', price: 9.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Store'),
        actions: [
          IconButton(
            icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                isDarkTheme = !isDarkTheme;
                Get.changeThemeMode(isDarkTheme ? ThemeMode.dark : ThemeMode.light);
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.snackbar('Product Selected', products[index].name);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(products[index].imageUrl, height: 100, width: 100),
                  SizedBox(height: 10),
                  Text(
                    products[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('\$${products[index].price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
