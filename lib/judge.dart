import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class OthelloLogic {
  OthelloStatus turn = OthelloStatus.black;
  OthelloStatus nextTurn = OthelloStatus.white;
  OthelloStatus myself = OthelloStatus.black;
  OthelloStatus opponent = OthelloStatus.white;
  List<List<OthelloStatus>> list;
  int columnIndex;
  int rowIndex;
  int gray;

  OthelloLogic({
    this.myself,
    @required this.list,
    this.nextTurn,
    this.turn,
    this.opponent,
  });

  List<List> get getCurrentBoard => this.list;

  OthelloStatus get getCurrentTurn => this.turn;

  ///ボードの更新
  void updateBoard({int columnIndex, int rowIndex}) {
    /// 裏返る石を盤面に反映
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        if (!(i == 0 && j == 0)) {
          flipDisc(columnIndex, rowIndex, i, j);
        }
      }
    }
  }

  /// 指定した場所からdy,dx方向に挟める石があるか判定
  bool searchDyDx(int columnIndex, int rowIndex, int dy, int dx) {
    int searchIndexDx = rowIndex + dx;
    int searchIndexDy = columnIndex + dy;
    do {
      if (list[searchIndexDy][searchIndexDx] == this.nextTurn) {
        searchIndexDx += dx;
        searchIndexDy += dy;
      } else if (list[searchIndexDy][searchIndexDx] == this.turn) {
        return true;
      }
    } while (list[searchIndexDy][searchIndexDx] == OthelloStatus.black ||
        list[searchIndexDy][searchIndexDx] == OthelloStatus.white);
    return false;
  }

  /// 指定した場所に石が置いた時、挟めるかどうかを判定
  /// 指定した場所から、上下左右斜めの８方向をチェック
  /// １方向に、挟める石があった時点で終了

  bool canPut(int columnIndex, int rowIndex) {
    if (this.list[columnIndex][rowIndex] != OthelloStatus.none &&
        this.list[columnIndex][rowIndex] != OthelloStatus.canPut) {
      return false;
    } else {
      if (this.list[columnIndex + 1][rowIndex] == this.nextTurn) {
        if (searchDyDx(columnIndex + 1, rowIndex, 1, 0)) {
          return true;
        }
      }
      if (this.list[columnIndex][rowIndex + 1] == this.nextTurn) {
        if (searchDyDx(columnIndex, rowIndex + 1, 0, 1)) {
          return true;
        }
      }
      if (this.list[columnIndex - 1][rowIndex] == this.nextTurn) {
        if (searchDyDx(columnIndex - 1, rowIndex, -1, 0)) {
          return true;
        }
      }
      if (this.list[columnIndex][rowIndex - 1] == this.nextTurn) {
        if (searchDyDx(columnIndex, rowIndex - 1, 0, -1)) {
          return true;
        }
      }
      if (this.list[columnIndex + 1][rowIndex + 1] == this.nextTurn) {
        if (searchDyDx(columnIndex + 1, rowIndex + 1, 1, 1)) {
          return true;
        }
      }
      if (this.list[columnIndex - 1][rowIndex + 1] == this.nextTurn) {
        if (searchDyDx(columnIndex - 1, rowIndex + 1, -1, 1)) {
          return true;
        }
      }
      if (this.list[columnIndex + 1][rowIndex - 1] == this.nextTurn) {
        if (searchDyDx(columnIndex + 1, rowIndex - 1, 1, -1)) {
          return true;
        }
      }
      if (this.list[columnIndex - 1][rowIndex - 1] == this.nextTurn) {
        if (searchDyDx(columnIndex - 1, rowIndex - 1, -1, -1)) {
          return true;
        }
      }
    }
    return false;
  }

  ///石の反転
  void flipDisc(int columnIndex, int rowIndex, int dy, int dx) {
    int searchIndexDx = rowIndex + dx;
    int searchIndexDy = columnIndex + dy;
    int step = 0;
    bool hit = false;
    while (!hit) {
      if (list[searchIndexDy][searchIndexDx] == this.nextTurn) {
        searchIndexDx += dx;
        searchIndexDy += dy;
        step++;
      } else {
        hit = true;
      }
      if (step >= 1) {
        if (list[searchIndexDy][searchIndexDx] == list[columnIndex][rowIndex]) {
          hit = true;
          int fillX = searchIndexDx;
          int fillY = searchIndexDy;
          for (int i = 0; i < step; i++) {
            fillX -= dx;
            fillY -= dy;
            list[fillY][fillX] = this.turn;
          }
        }
      }
    }
  }

  ///置ける場所の更新
  List<List<OthelloStatus>> updateCanPut() {
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        /// 一手前の着手可能な場所を削除
        if (list[i][j] == OthelloStatus.canPut) {
          list[i][j] = OthelloStatus.none;
        }

        ///着手可能な場所表示
        if (canPut(i, j)) {
          list[i][j] = OthelloStatus.canPut;
        }
      }
    }
    return list;
  }

  /// 一手前の着手可能な場所を削除
  void clearCanPut() {
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        if (list[i][j] == OthelloStatus.canPut) {
          list[i][j] = OthelloStatus.none;
        }
      }
    }
  }

  int counter(OthelloStatus othelloColor) {
    int whiteCount = 0;
    int blackCount = 0;
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        if (list[i][j] == OthelloStatus.white) {
          whiteCount++;
          print("white:$whiteCount");
          print("black:$blackCount");
        } else if (list[i][j] == OthelloStatus.black) {
          blackCount++;
          print("black:$blackCount");
          print("white:$whiteCount");
        }
      }
    }
    if (othelloColor == OthelloStatus.white) {
      return whiteCount;
    } else {
      return blackCount;
    }
  }
}
