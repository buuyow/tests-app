import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 0; // Track the current index for bottom navigation.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              _buildCarousel(),
              SizedBox(height: 10),
              _buildCategorySection(),
              _buildTopTipsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _currentIndex,
        onTap:
            _handleNavigation, // Call a function to handle navigation based on the index.
        dotIndicatorColor: Colors.black,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.purple,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            selectedColor: Colors.pink,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: Colors.orange,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_important_outlined),
          )
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: CarouselOne(),
    );
  }

  Widget _buildCategorySection() {
    return Row(
      children: [
        Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.green[900],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.location_on),
              ),
              Text("All")
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black54,
            width: double.infinity,
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Category();
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTopTipsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Tips",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "EXPLORE",
                    style: TextStyle(color: Color.fromARGB(221, 66, 65, 65)),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return TopTips();
            },
          ),
        ),
      ],
    );
  }

  // Function to handle bottom navigation tap.
  void _handleNavigation(int index) {
    setState(() {
      _currentIndex = index;
      // You can add navigation logic based on the index here.
    });
  }
}

class TopTips extends StatelessWidget {
  const TopTips({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 230,
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              color: Color.fromARGB(31, 241, 10, 10),
            ),
            Text("Meelaha cagaaran"),
            Text("Meelaha cagaaran"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("\$ 200"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/51/7a/5f/liido-beach-somalia-2016.jpg?w=500&h=-1&s=1"),
            width: 25,
            height: 25,
          ),
          Text("xeebaha"),
        ],
      ),
    );
  }
}

class CarouselOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      width: 100.0,
      child: AnotherCarousel(
        boxFit: BoxFit.cover,
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 6.0,
        dotIncreasedColor: Color(0xFFFF335C),
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.bottomCenter,
        dotVerticalPadding: 10.0,
        showIndicator: true,
        indicatorBgPadding: 7.0,
        images: [
          NetworkImage(
              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/51/7a/5f/liido-beach-somalia-2016.jpg?w=500&h=-1&s=1'),
          NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcZXbY03u3zVzVaWZhWMkSZfsSKWnQvxHYi5SQqW_bq7n6bCVoLAQN6uJE1K6wWVxz-jQ&usqp=CAU'),
          NetworkImage(
              'https://thoth.pickvisa.com/wp-content/uploads/2021/12/bab8e6888eeb4ceb8df82aa6346c24d8.jpg'),
          NetworkImage('https://i.redd.it/on7nrr9578l61.jpg'),
        ],
      ),
    );
  }
}
