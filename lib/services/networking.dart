import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper
{
   NetworkHelper( this.url);

   final String url;
   // 'https://api.openweathermap.org/data/2.5/weather?lat=$latitudeO&lon=$longitudeO&appid=e7a395d48c00141982919f93d1c284ed'
   Future getData() async
   {
      http.Response response = await http.get(Uri.parse(url));
      print(response.statusCode);
      if( response.statusCode == 200 ) {
         String data = response.body;
         print(data);
         return  jsonDecode(data);
      }

      else
      {
         print(response.statusCode);
      }
      print('getData end');
   }
}