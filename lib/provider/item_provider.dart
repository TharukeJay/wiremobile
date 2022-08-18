import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wireapps/config/urls.dart';

class ItemProvider {

  Future getItemsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return http.get(Uri.parse(Config.itemData), headers: {
      'Content-Type': 'application/json',
    });
  }

}