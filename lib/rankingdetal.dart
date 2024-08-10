import 'recordaddpage.dart';
import 'package:flutter/material.dart';

class Rankingdetail extends StatelessWidget {
  final int datakey;

  const Rankingdetail({super.key, required this.datakey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'ランキング',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      //最大深度深い順
      body: datakey == 0
          ? ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return rankingtable1(
                  context,
                  index,
                  '${maxdepthList10[0]['depth'][index].toStringAsFixed(1)}m',
                  maxdepthList10[0]['point'][index],
                  maxdepthList10[0]['location'][index],
                  maxdepthList10[0]['date'][index],
                  maxdepthList10[0]['prefecture'][index],
                );
              },
            )
          //潜った回数多い県
          : datakey == 1
              ? ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return rankingtable2(
                      context,
                      index,
                      '${frequentPrefectureList10[0]['count'][index]}回',
                      frequentPrefectureList10[0]['prefecture'][index],
                      frequentPrefectureList10[0]['date'][index],
                    );
                  },
                ) //潜った回数多いエリア
              : datakey == 2
                  ? ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return rankingtable2(
                          context,
                          index,
                          '${frequentDomesticLocationList10[0]['count'][index]}回',
                          frequentDomesticLocationList10[0]['location'][index],
                          frequentDomesticLocationList10[0]['date'][index],
                        );
                      },
                    ) //最大深度が浅い順
                  : datakey == 3
                      ? ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return rankingtable1(
                              context,
                              index,
                              '${mindepthList10[0]['depth'][index].toStringAsFixed(1)}m',
                              mindepthList10[0]['point'][index],
                              mindepthList10[0]['location'][index],
                              mindepthList10[0]['date'][index],
                              mindepthList10[0]['prefecture'][index],
                            );
                          },
                        ) //潜った時間が長い順
                      : datakey == 4
                          ? ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return rankingtable1(
                                  context,
                                  index,
                                  '${maxDivetimeList10[0]['divetime'][index]}分',
                                  maxDivetimeList10[0]['point'][index],
                                  maxDivetimeList10[0]['location'][index],
                                  maxDivetimeList10[0]['date'][index],
                                  maxDivetimeList10[0]['prefecture'][index],
                                );
                              },
                            )
                          : null,
    );
  }

  Widget rankingtable1(
      BuildContext context, index, item1, item2, item3, item4, item5) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
          bottom: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
        ),
      ),
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.11),
          1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
          4: FixedColumnWidth(MediaQuery.of(context).size.width * 0.25),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${index + 1}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item1'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item2'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item3'),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(''),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(''),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item5'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item4'),
            ),
          ]),
        ],
      ),
    );
  }

  Widget rankingtable2(BuildContext context, index, item1, item2, item3) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
          bottom: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
        ),
      ),
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(MediaQuery.of(context).size.width * 0.11),
          1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.2),
          3: FixedColumnWidth(MediaQuery.of(context).size.width * 0.3),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${index + 1}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item1'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item2'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$item3'),
            ),
          ]),
        ],
      ),
    );
  }
}
