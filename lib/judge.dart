import 'package:flutter/cupertino.dart';

import 'constants.dart';

int columnIndex;
int rowIndex;

class OthelloLogic {
  OthelloStatus turn = OthelloStatus.black;
  OthelloStatus nextTurn = OthelloStatus.white;
  OthelloStatus myself = OthelloStatus.black;
  OthelloStatus opponent = OthelloStatus.white;
  List<List<OthelloStatus>> list;

  OthelloLogic(
      {@required OthelloStatus myself,
      @required List<List<OthelloStatus>> listState}) {
    this.list = listState;
    this.turn = OthelloStatus.black;
    this.nextTurn = OthelloStatus.white;
    this.myself = myself;
  }

  OthelloLogic.gameSetting(OthelloStatus myself) : this.myself = myself;

  List<List> get getCurrentBoard => this.list;

  OthelloStatus get getCurrentTurn => this.turn;

  bool updateBoard(int columnIndex, int rowIndex) {
    if (this.list[columnIndex][rowIndex] == OthelloStatus.canPut) {
      /// 置いた石を盤面に反映
      this.list[columnIndex][rowIndex] = this.turn;

      /// 裏返る石を盤面に反映
      flipDisc(columnIndex, rowIndex, 1, 0);
      flipDisc(columnIndex, rowIndex, -1, 0);
      flipDisc(columnIndex, rowIndex, 1, 1);
      flipDisc(columnIndex, rowIndex, -1, 1);
      flipDisc(columnIndex, rowIndex, 1, -1);
      flipDisc(columnIndex, rowIndex, -1, -1);
      flipDisc(columnIndex, rowIndex, 0, 1);
      flipDisc(columnIndex, rowIndex, 0, -1);

      /// ターンを交代
      changeTurn();
      return true;
    } else {
      return false;
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
    } while (list[searchIndexDy][searchIndexDx] != OthelloStatus.edge &&
        list[searchIndexDy][searchIndexDx] != OthelloStatus.none &&
        list[searchIndexDy][searchIndexDx] != OthelloStatus.canPut);
    return false;
  }

  /// 指定した場所に石が置いた時、挟めるかどうかを判定
  /// 指定した場所から、上下左右斜めの８方向をチェック
  /// １方向に、挟める石があった時点で終了

  bool canPut(int columnIndex, int rowIndex) {
    if (this.list[columnIndex][rowIndex] == OthelloStatus.edge ||
        this.list[columnIndex][rowIndex] == OthelloStatus.black ||
        this.list[columnIndex][rowIndex] == OthelloStatus.white) {
      return false;
    }
    if (this.list[columnIndex][rowIndex] == OthelloStatus.none ||
        this.list[columnIndex][rowIndex] == OthelloStatus.canPut) {
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

  bool flipDisc(int columnIndex, int rowIndex, int dy, int dx) {
    int searchIndexDx = rowIndex + dx;
    int searchIndexDy = columnIndex + dy;

    /// 指定した場所の石の色が、次番の石の色であれば、dx,dyずらしサーチを継続
    /// 最終的に、現在の手番の石の色があれば、挟んだと判定し盤面を更新
    if (list[searchIndexDy][searchIndexDx] == this.nextTurn) {
      if (flipDisc(searchIndexDy, searchIndexDx, dy, dx)) {
        /// 盤面の更新
        list[searchIndexDy][searchIndexDx] = this.turn;
        return true;
      }
    } else if (list[searchIndexDy][searchIndexDx] == this.turn) {
      return true;
    } else {
      return false;
    }
    return false;
  }

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

  changeTurn() {
    OthelloStatus tmp = turn;
    turn = nextTurn;
    nextTurn = tmp;

    ///自分の番か確かめる
    ///自分の番なら着手可能の場所表示
    if (turn == myself) {
      updateCanPut();
    } else if (turn == opponent) {
      updateCanPut();
    } else {
      clearCanPut();
    }
  }

  int counter(OthelloStatus othelloColor) {
    int WhiteCount = 0;
    int BlackCount = 0;
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        if (list[i][j] == OthelloStatus.white) {
          WhiteCount ++;
          print("White");
          print(WhiteCount);
        }
        else if (list[i][j] == OthelloStatus.black) {
          print("Black");
          BlackCount ++;
          print(BlackCount);
        }
      }
    }
    if (othelloColor == OthelloStatus.white) {
      return WhiteCount;
    }
    else {
      return BlackCount;
    }
  }
  
}
