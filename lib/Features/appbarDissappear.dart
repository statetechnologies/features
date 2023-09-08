import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class ScrollScreen extends StatefulWidget {
  @override
  _ScrollScreenState createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  bool _showAppBar = true;
  bool _showNavBar = true;
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        _showAppBar = false;
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        _showAppBar = true;
      }

      if (_scrollController.position.pixels <= 0) {
        _showNavBar = true;
      } else {
        if (_scrollPosition < _scrollController.position.pixels) {
          _showNavBar = false;
        } else {
          _showNavBar = true;
        }
      }
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar
          ? AppBar(
        title: Text('Disappearing App Bar'),
      )
          : PreferredSize(
        child: SizedBox.shrink(),
        preferredSize: Size.fromHeight(0),
      ),
      bottomNavigationBar: _showNavBar
          ? BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      )
          : PreferredSize(
        child: SizedBox.shrink(),
        preferredSize: Size.fromHeight(0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item $index'));
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
