import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

Future<ResponseData> fetchAiOthello({
  @required List<List<OthelloStatus>> list,
  @required OthelloStatus myColor,
}) async {
  final url = 'https://clever-aleph-318009.an.r.appspot.com/';
  List<List<int>> intList;
  Map<String, Map<String, String>> submitList;
  if (myColor == OthelloStatus.black) {
    intList = list
        .map((columns) => columns.map((e) {
              switch (e) {
                case OthelloStatus.black:
                  return -1;
                case OthelloStatus.white:
                  return 1;
                default:
                  return 0;
              }
            }).toList())
        .toList();

    intList.removeAt(0);
    intList.removeAt(intList.length - 1);

    intList.forEach((column) {
      column.removeAt(0);
      column.removeAt(column.length - 1);
    });

    submitList = {
      'board': {
        '0': intList[0].toString(),
        '1': intList[1].toString(),
        '2': intList[2].toString(),
        '3': intList[3].toString(),
        '4': intList[4].toString(),
        '5': intList[5].toString(),
        '6': intList[6].toString(),
        '7': intList[7].toString(),
      }
    };
  } else {
    intList = list
        .map((columns) => columns.map((e) {
              switch (e) {
                case OthelloStatus.black:
                  return 1;
                case OthelloStatus.white:
                  return -1;
                default:
                  return 0;
              }
            }).toList())
        .toList();

    intList.removeAt(0);
    intList.removeAt(intList.length - 1);

    intList.forEach((column) {
      column.removeAt(0);
      column.removeAt(column.length - 1);
    });
    submitList = {
      'board': {
        '0': intList[0].toString(),
        '1': intList[1].toString(),
        '2': intList[2].toString(),
        '3': intList[3].toString(),
        '4': intList[4].toString(),
        '5': intList[5].toString(),
        '6': intList[6].toString(),
        '7': intList[7].toString(),
      }
    };
  }

  final json = jsonEncode(submitList);
  try {
    final response = await http.post(
      url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': '*',
      },
      body: json,
    );
    final data = jsonDecode(response.body);
    final arr = data['result'].split(',');
    return ResponseData(column: int.parse(arr[0]), row: int.parse(arr[1]));
  } catch (e) {
    print(e);
    return null;
  }
}

class ResponseData {
  ResponseData({@required this.column, @required this.row});
  final int column;
  final int row;
}
