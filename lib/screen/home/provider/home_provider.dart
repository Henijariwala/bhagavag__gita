import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/json_helper.dart';
import '../../../utils/share_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier {
  List<ShlokModel> verseList = [];
  List<ShlokModel> filterList = [];
  List<ChapterModel> chapterList = [];
  int index = 0;
  int seletcedVerse=0;
  String language='Sanskrit';
  bool isOn = true;
  bool theme = false;
  bool favorite = false;
  bool isTheme = false;
  ThemeMode mode = ThemeMode.dark;
  IconData themeMode = Icons.dark_mode;

  void setFavorite()
  {
    favorite=!favorite;
    notifyListeners();
  }
  void setThemeData() async {
    theme = !theme;
    setThemeName(isTheme: theme);
    isTheme = (await getThemeName())!;
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }

  void getThemeData() async {
    if (await getThemeName() == null) {
      isTheme = false;
    } else {
      isTheme = (await getThemeName())!;
    }
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    }
    notifyListeners();
  }

  void changeTheme() {
    isOn = !isOn;
    notifyListeners();
  }

  void setLanguage(String value) {
    language = value;
    notifyListeners();
  }

  Future<void> getSelectedVerse(int id)
  async {
    getData();
    filterList.clear();
    for (var i = 0; i < verseList.length; i++) {
      if (verseList[i].chapter_number == id) {
        filterList.add(verseList[i]);
      }
    }
    notifyListeners();
  }
    void setIndex(int i) {
      index = i;
      notifyListeners();
    }
    void getData() async {
      JsonHelper jsonHelper = JsonHelper();
      verseList = await jsonHelper.shlokJson();
      notifyListeners();
    }
    void getChapter() async {
      JsonHelper jsonHelper = JsonHelper();
      chapterList = await jsonHelper.chapterJson();
      notifyListeners();
    }
  }