import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RankBoard extends StatefulWidget {
  const RankBoard({super.key});

  @override
  State<RankBoard> createState() => _RankBoardState();
}

class _RankBoardState extends State<RankBoard> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: [
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.red,
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.blue,
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 60,
                height: 30,
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Text("${_currentPage + 1}/2"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
