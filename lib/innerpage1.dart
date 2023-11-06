import 'package:flipkart/innerpage2.dart';
import 'package:flutter/material.dart';

class InnerOne extends StatefulWidget {
  const InnerOne({super.key});

  @override
  State<InnerOne> createState() => _InnerOneState();
}

class _InnerOneState extends State<InnerOne> {
  TextEditingController _controller = TextEditingController();
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Widget searchField() {
    return TextField(
      autofocus: true,
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search for Products",
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            _controller.clear();
          },
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
  List<String> items = [
    'images/image1.jpeg',
    'images/image2.jpeg',
    'images/image3.jpeg',
    'images/image4.jpeg',
    'images/image1.jpeg',
    'images/image2.jpeg',
    'images/image3.jpeg',
    'images/image4.jpeg',
  ];
  List<String> items1 = [
    'Item 1\nhfdsfddsf\nafssg',
    'Item 2\nhfdsfddsf\nafssg',
    'Item 3\nhfdsfddsf\nafssg',
    'Item 4\nhfdsfddsf\nafssg',
    'Item 1\nhfdsfddsf\nafssg',
    'Item 2\nhfdsfddsf\nafssg',
    'Item 3\nhfdsfddsf\nafssg',
    'Item 4\nhfdsfddsf\nafssg',
  ];
  bool isFavorite=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0,          // Border width
                          ),
                        ),
                        width: 370.0,
                        child: searchField(),
                      ),
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.favorite_border)),
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.shopping_cart)),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InnerTwo()));
                        },
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topRight,
                              child: IconButton(
                                icon: isFavorite ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border,color: Colors.black,),
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: Image.asset(items[index], fit: BoxFit.cover),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                items1[index],
                                style: TextStyle(color: Colors.black, fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
