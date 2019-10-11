// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('로또 대박기원'),
        ),
        body: Center(
          child: LottoBoard(),
        ),
      ),
    );
  }
}


class LottoBoard extends StatefulWidget {
    @override
    State createState() {
        return LottoBoardState();
    }
}

class LottoBoardState extends State<LottoBoard> {
    final int min = 1;
    final int max = 45;

    var lottoNumbers = Set();

    // 로또 번호 생성 
    var rng = new Random();
    void addLottoNumber() {
      while (true) {
        var num = rng.nextInt((min - min +1) + min);
        if(lottoNumbers.add(num)) {
          if(lottoNumbers.length == 6) {
            break;   
          }
        }        
      }
    }

    void resetLottoNumber() {
      lottoNumbers.clear();
    }
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Container(
                    child: Text(
                        lottoNumbers.toString().replaceAll('/{}/', ''),
                        style: TextStyle(fontSize: 128),
                    ),
                    padding: EdgeInsets.all(32),
                ),
                Row(
                    children: <Widget>[
                        makeButton('로또 번호 출력', addLottoNumber),
                        makeButton('초기화', resetLottoNumber)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
        );
    }
    
    Widget makeButton(String title, VoidCallback callback) {
        return RaisedButton(
            child: Text(title),
            onPressed: () {
                setState(() {
                    callback();
                });
            },
        );
    }
}