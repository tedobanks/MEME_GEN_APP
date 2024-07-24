import 'package:meme_gen_app/services/app_provider.dart';
import 'package:meme_gen_app/static/models.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<Meme?> getMemes() async {
    var client = http.Client();
    var uri = AppProvider().apiUrl;
    var url = Uri.parse(uri);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return memeFromJson(jsonData);
    }
  }
}
