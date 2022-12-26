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
  void initState() {
    super.initState();

    Future.microtask(() async {
      await context.read<HomeScreenViewModel>().fetchRankBoard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeScreenViewModel>();
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
            //TODO: 구현하기
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: Column(
                    children: viewModel.rankBoard!.easyRankers
                        .map((ranker) => Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('asd'),
                                    CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    Text('sdfsdfsdf'),
                                    Text('10승'),
                                  ],
                                ),
                              ),
                            ))
                        .toList()),
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
