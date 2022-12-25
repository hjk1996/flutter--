import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:text_project/domain/model/rank_board.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';

//TODO: 구현하기
class RankBoardView extends StatefulWidget {
  const RankBoardView({super.key});

  @override
  State<RankBoardView> createState() => _RankBoardViewState();
}

class _RankBoardViewState extends State<RankBoardView> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RankBoard>(
      future: context.read<HomeScreenViewModel>().fetchRankBoard(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 400,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("에러가 발생했습니다."),
          );
        }
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
                    child: Column(children: [
                      const Text("매우 어려움"),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('asd'),
                            )
                          ],
                        ),
                      )
                    ]),
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
      },
    );
  }
}
