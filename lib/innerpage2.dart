import 'package:flutter/material.dart';

class InnerTwo extends StatefulWidget {
  const InnerTwo({Key? key}) : super(key: key);

  @override
  State<InnerTwo> createState() => _InnerTwoState();
}

class _InnerTwoState extends State<InnerTwo> {
  TextEditingController _controller = TextEditingController();

  @override
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
  ];
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          width: 1.0, // Border width
                        ),
                      ),
                      width: 420.0,
                      child: searchField(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
              ),
        SizedBox(
          height: 400,
          child: PageView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    items[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
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
                ],
              );
            },
          ),
        ),
              Align(
                alignment: Alignment.topLeft,
                  child: Text("hgsfjdg\nshfkdhakg\nkjhskfhhfdjhskdhgksdhgkhggf")),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.black,),
                  Icon(Icons.star,color: Colors.black,),
                  Icon(Icons.star,color: Colors.black,),
                  Icon(Icons.star,color: Colors.black,),
                  Icon(Icons.star,color: Colors.black,),

                ],
              ),
              SizedBox(height: 100,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(),
                      ),
                      child:
                          Text("Add to cart", style: TextStyle(color: Colors.black, fontSize: 18,),),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(),
                      ),
                      child:
                      Text("Buy Now", style: TextStyle(color: Colors.white, fontSize: 18,),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
