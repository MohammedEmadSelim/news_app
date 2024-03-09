import 'package:dio/dio.dart';

import '../models/news_model.dart';

class TopBussinesNewsRepo {
  var dio = Dio();

  Future<TopBussinessModel> fetchData() async {
    var res = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c1325236166d403ab198e1e29e31cb73');
    TopBussinessModel data = TopBussinessModel.fromJson(res.data);
    
    return data; 
  }
}
