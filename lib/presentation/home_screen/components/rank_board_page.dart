import 'package:flutter/material.dart';
import 'package:text_project/domain/model/ranker.dart';

rankToBadgeColor(int rank) {
  switch (rank) {
    case 1:
      return Colors.amber;
    case 2:
      return Colors.grey;
    case 3:
      return Colors.brown;
    default:
      return Colors.white;
  }
}

class RankBoardPage extends StatelessWidget {
  final List<Ranker> rankers;
  final String title;
  const RankBoardPage({required this.rankers, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (rankers.isEmpty) {
        return const Center(
          child: Text('랭킹이 없습니다.'),
        );
      }

      return Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: const Color(0xff1976d2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              child: Text(title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
            ),
          ),
          ...rankers.map((value) {
            return Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xff212121),
                border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                    left: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Row(
                              children: [
                                SizedBox(width: constraints.maxWidth * 0.05),
                                Container(
                                  width: constraints.maxWidth * 0.3,
                                  height: constraints.maxWidth * 0.3,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    image: value.photo != null
                                        ? DecorationImage(
                                            image: value.photo!.image,
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: value.photo != null
                                      ? null
                                      : const Center(child: Icon(Icons.person)),
                                ),
                                SizedBox(width: constraints.maxWidth * 0.15),
                                Expanded(
                                  child: Text(value.name ?? "N/A",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                )
                              ],
                            );
                          },
                        )),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        value.wins != null ? "${value.wins}승" : "-",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: value.rank != null
                          ? CircleAvatar(
                              backgroundColor: rankToBadgeColor(value.rank!),
                              child: Text(
                                value.rank.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                            )
                          : const Text('-', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            );
          }).toList()
        ],
      );
    });
  }
}
