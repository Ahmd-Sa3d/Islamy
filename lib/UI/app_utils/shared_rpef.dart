
import 'package:shared_preferences/shared_preferences.dart';

class PrefKey {
  static const String stringKey = 'lastSurah';
}

void updateLastSuraIndex(int lastSurahIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> lastSurahIndexList = prefs.getStringList(PrefKey.stringKey)??[];
  if(lastSurahIndexList.contains('$lastSurahIndex')){
    lastSurahIndexList.remove('$lastSurahIndex');
    lastSurahIndexList.insert(0,'$lastSurahIndex');
  }else {
    lastSurahIndexList.insert(0,'$lastSurahIndex');
  }
  if (lastSurahIndexList.length > 3) {
    lastSurahIndexList.removeLast();
    lastSurahIndexList.sublist(0,2);
  }

  await prefs.setStringList(PrefKey.stringKey,lastSurahIndexList );
}

Future<List<int>> readLastSuraIndex() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> lastSurahListAsString =
      prefs.getStringList(PrefKey.stringKey) ?? [];
  List<int> lastSurahListAsInt =
  lastSurahListAsString.map((surah) => int.parse(surah)).toList();
  return lastSurahListAsInt;
}
