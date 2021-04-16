import 'dart:io';

import 'package:dio/dio.dart';

import 'Url.dart';

class Api {
  // Future 用在執行耗時操作並在未來會返回某個值
  // static 讓 Method 處於靜態，省去呼叫 Method 時還要 New 的情況
  static Future queryBanner() async{
    Response response;
    // await 此方法須非同步(async)，所以會在 Method 中加入 async
    response = await Dio().post('$bannerUrl');
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }

  static Future queryNews() async{
    Response response;
    // await 此方法須非同步(async)，所以會在 Method 中加入 async
    response = await Dio().post('$newsUrl');
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }

  static Future queryCoach() async{
    Response response;
    // await 此方法須非同步(async)，所以會在 Method 中加入 async
    response = await Dio().post('$coachUrl');
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }
}