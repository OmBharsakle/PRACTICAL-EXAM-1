import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api/ApiServices.dart';
import '../Modal/HomePageModal.dart';

class HomePageProvider extends ChangeNotifier
{
  QuotesModal quotesModal = QuotesModal.f();
  late List<String> likedQuotes = [];
  List<String> saveData=[];
  bool isLike=false;
  bool isLoding = false;
  int like=0;

  Future<void> loadData()
  async {
    Map json = await ApiServices.apiServices.fetchData();
    isLoding = true;
    quotesModal = QuotesModal.fromJson(json);
    notifyListeners();
  }

  Future<void> likeSave(int index)
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    likedQuotes.add("${quotesModal.quotes[index].quote}-${quotesModal.quotes[index].author}-${quotesModal.quotes[index].id}");
    await prefs.setStringList('items', likedQuotes);
  }
  Future<void> likedQuotesRemove(int index)
  async {
    likedQuotes.removeAt(index);
    notifyListeners();
  }

  Future<void> likeGet()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    likedQuotes = prefs.getStringList('items')??[];
    notifyListeners();
  }
  HomePageProvider()
  {
    loadData();
    likeGet();
  }
}