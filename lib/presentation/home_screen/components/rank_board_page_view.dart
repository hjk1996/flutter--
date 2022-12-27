import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:text_project/domain/model/rank_board.dart';
import 'package:text_project/presentation/home_screen/components/rank_board_page.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';

//TODO: 구현하기
class RankBoardPageView extends StatefulWidget {
  const RankBoardPageView({super.key});

  @override
  State<RankBoardPageView> createState() => _RankBoardPageViewState();
}

class _RankBoardPageViewState extends State<RankBoardPageView> {
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
    return Consumer<HomeScreenViewModel>(
      builder: (context, vm, child) {
        return SizedBox(
          width: double.infinity,
          height: 400,
          child: Builder(builder: (context) {
            if (vm.state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (vm.state.rankBoard == null) {
              return const Center(
                child: Text('서버로부터 랭킹을 받아오지 못했습니다.'),
              );
            }

            return Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  children: [
                    RankBoardPage(
                      rankers: viewModel.state.rankBoard!.easyRankers,
                      title: '쉬움',
                    ),
                    RankBoardPage(
                      rankers: viewModel.state.rankBoard!.normalRankers,
                      title: '보통',
                    ),
                    RankBoardPage(
                      rankers: viewModel.state.rankBoard!.hardRankers,
                      title: '어려움',
                    ),
                    RankBoardPage(
                      rankers: viewModel.state.rankBoard!.hardRankers,
                      title: '매우 어려움',
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
                        child: Text("${_currentPage + 1}/4"),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
