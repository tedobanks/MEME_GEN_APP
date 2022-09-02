import 'package:meme_gen_app/static/models.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Meme>?> getMemes() async {
    var client = http.Client();

    var url = Uri.parse('https://api.humorapi.com/memes/random');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return memeFromJson(jsonData);
    }
  }
}
