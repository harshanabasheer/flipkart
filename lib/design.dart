import 'package:flipkart/innerpage1.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipkart/innerpage1.dart';

class Flipkart extends StatefulWidget {
  const Flipkart({super.key});

  @override
  State<Flipkart> createState() => _FlipkartState();
}

class _FlipkartState extends State<Flipkart> {
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
    'images/image1.jpeg',
    'images/image2.jpeg',
    'images/image3.jpeg',
    'images/image4.jpeg',
  ];
  List<String> items1 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('images/flipkart.png', height: 30, width: 30,),
                          SizedBox(width: 8),
                          Text("Flipkart", style: TextStyle(color: Colors.black, fontSize: 18,),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('images/download.jpeg', height: 30, width: 30,),
                          SizedBox(width: 8),
                          Text("Grocery", style: TextStyle(color: Colors.black, fontSize: 18,),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("data"),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0,          // Border width
                        ),
                      ),
                      width: 430.0,
                      child: searchField(),
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CarouselSlider(
                    items: [
                      buildContainer('images/image1.jpeg'),
                      buildContainer('images/image2.jpeg'),
                      buildContainer('images/image3.jpeg'),
                      buildContainer('images/image4.jpeg'),

                    ],
                    options: CarouselOptions(
                      height: 250.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 450,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(items[index]),
                            radius: 30,
                          ),
                          SizedBox(height: 4),
                          Text(items1[index])
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.deepPurple,
                height: 50,
                width: 450,
                child:  Center(child: Text("Sale Price Live", style: TextStyle(color: Colors.yellow, fontSize: 25,),)),
              ),
              Container(
                // color: Colors.blue,
                height: 600,
                width: 500,
                child:GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InnerOne()));
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(items[index], fit: BoxFit.cover),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                items1[index],
                                style: TextStyle(color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                  },
                )

              ),
            ],
          ),
        ),
      )
    );
  }
  Container buildContainer(String img) {
    return Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
  }
}
