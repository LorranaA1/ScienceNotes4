import 'dart:convert';
import 'package:sciencenotes/domain/enter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class EnterApi {
  final String _baseUrl = "viacep.com.br";

  Future<EnterApi> findAddressByUser(String username) async {
    Uri url = Uri.http(_baseUrl, "/ws/$username/json/");
    Response response = await http.get(url);

    // TESTE
    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    if (json['erro'] != null) {
      return Enter();
    }

    return Enter.fromJson(json);
  }
}