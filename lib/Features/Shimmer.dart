import 'package:flutter/material.dart';



class myShimmer extends StatefulWidget {
  @override
  _myShimmerState createState() => _myShimmerState();
}

class _myShimmerState extends State<myShimmer> with SingleTickerProviderStateMixin {
  bool _isLoading = true; // Set to false when data is loaded
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _controller.repeat(reverse: true); // Reverses the animation to create a continuous effect

    Future.delayed(Duration(seconds: 8), () {
      setState(() {
        _isLoading = false;
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Shimmer Effect Example'),
      ),
      body: _isLoading ? Container(child: _buildLoadingAnimation(),) : Center(child: Text('Loaded Content')),
    );
  }

  Widget _buildCustomShimmerEffect() {
    return ListView.builder(
      itemCount: 15, // Number of shimmering items
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.grey[200]!, Colors.grey[300]!, Colors.grey[200]!],
              stops: [0.1, 0.5, 0.9],
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                color: Colors.white,
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.0,
                    height: 12.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 80.0,
                    height: 10.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildLoadingAnimation() {
    return ListView.builder(
      itemCount: 15, // Number of shimmering items
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.grey[200]!, Colors.grey[300]!, Colors.grey[200]!],
              stops: [0.1, 0.5, 0.9],
            ),
          ),
          child: Stack(
            children: [
              _buildAnimatedElement(), // Animated element
              Row(
                children: [
                  _buildLoadingElement(60.0, 60.0),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLoadingElement(120.0, 12.0),
                      SizedBox(height: 5.0),
                      _buildLoadingElement(80.0, 10.0),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

// Widget representing the loading element moving from start to end within the container
  Widget _buildAnimatedElement() {
    return Positioned(
      left: -20.0, // Adjust this value to control the starting position
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(MediaQuery.of(context).size.height*0.44 * _controller.value, 0.0), // Adjust the width of the container
            child: Container(
              width: 100.0, // Width of the animated element
              height: 100.0, // Height of the animated element
              decoration: BoxDecoration(
                color:Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget for loading placeholders
  Widget _buildLoadingElement(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

}
