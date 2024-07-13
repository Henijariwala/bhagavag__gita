import 'dart:convert';

import 'package:bhagavad_gita/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper {

  Future<List<ShlokModel>> shlokJson() async {
    var jsonString = await rootBundle.loadString('assets/json/verses.json');
    List shlok = jsonDecode(jsonString);
    List<ShlokModel> verseList = shlok.map((e) => ShlokModel.mapToModel(e)).toList();
    return verseList;
  }
  Future<List<ChapterModel>> chapterJson() async {
    var jsonString = await rootBundle.loadString('assets/json/chapter.json');
    List chapter = jsonDecode(jsonString);
    List<ChapterModel> chapterList = chapter.map((e) => ChapterModel.mapToModel(e)).toList();
    return chapterList;
  }
}