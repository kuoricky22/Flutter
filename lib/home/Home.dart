import 'package:flutter/material.dart';
import 'package:flutter_app/ApI/Api.dart';
import 'package:flutter_app/Model/Banners.dart';
import 'package:flutter_app/Model/News.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'news_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Banners banners;
  int bannersLength = 0;

  News news;
  int newsLength = 0;

  // 創建 Method (取得 Banner 資料)
  // void queryBanner() {
  //   // .then 就是 Future 的用法之一
  //   // value 就是 Api.dart 裡對應方法中的回傳值(response.data)
  //   Api.queryBanner().then((value) {
  //     setState(() {
  //
  //
  //     });
  //   });
  // }

  // 創建 Method (取得 News 資料)
  // void queryNews() {
  //   //.then 就是 Future 的用法之一
  //   // value 就是 Api.dart 裡對應方法中的回傳值(response.data)
  //   Api.queryNews().then((value) {
  //     setState(() {
  //
  //     });
  //   });
  // }

  // initState() ：進行初始化的工作，並在生命週期裡只執行一次
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 使用 Method
    // queryBanner();
    // queryNews();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //最頂部 Tilte
      appBar: AppBar(
        title: Text('Home'),
      ),

      // 內容
      body:
      FutureBuilder(
        // wait() : 等待所有的future完成後再一起返回,如果中間過程中又任意一個Future出錯,則整個失敗
        future: Future.wait([
          Api.queryBanner(),
          Api.queryNews()
        ]),

        // context：當前APP的內容
        // snapshot：Future.wait()執行完後放入snapshot
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              // Loading 符號 (轉圈圈)
              child: CircularProgressIndicator(),
            );
          }
          banners = Banners.fromJson(snapshot.data[0]);
          bannersLength = banners.data.result.length;
          news = News.fromJson(snapshot.data[1]);
          newsLength = news.data.result.length;
          return
            // 讓首頁可以上下移動
            ListView.builder(

              /*
              *  itemBuilder 用途在於定義捲動時元件的生成方式
              *  Parameter:
              *     - context = 當前APP畫面內容(不確定)
              *     - index = 生成元件的數量，由 itemCount 變數來做設定。
              */
              //【News】itemBuilder
              itemBuilder: (context, index) {
                if (index == 0) {
                  // 放入Banner裡的資料
                  return Column(
                    children: [
                      Container(
                        height: 300,

                        // Swiper 輪播插件：可讓多張圖片進行有順序的播放，用此類別需另外安裝
                        child: Swiper(
                          // 【Banners】itemBuilder
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              "${banners.data.result[index].bannerImageName}",
                              fit: BoxFit.fill,
                            );
                          },
                          duration: 1000,
                          itemCount: bannersLength,
                          itemWidth: 300,
                          itemHeight: 300,
                          autoplay: true,
                          pagination: new SwiperPagination(),
                          control: new SwiperControl(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.map),
                          SizedBox(
                            width: 20,
                          ),
                          Text('地址'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 20,
                          ),
                          Text('0912345678'),
                        ],
                      ),

                      // 水平分割線
                      Divider(),
                      Container(
                        color: Colors.black,
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.fiber_new,
                              color: Colors.yellow,),
                            SizedBox(width: 20,),
                            Text('最新消息', style: TextStyle(
                                fontSize: 22,
                                color: Colors.white
                            ),)
                          ],
                        ),
                      )
                    ],
                  );
                }
                // InkWell：用在需要將某物件進行觸發事件所使用，也可以使用 GestureDetector
                return InkWell(
                  // 最新消息列表
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.whatshot),
                              // 放入 News 的資料
                              Text('${news.data.result[index].newsFirstTitle}', style: TextStyle(fontSize: 18,),)
                            ],
                          )
                      ),
                      SizedBox(height: 20,),
                      Container(
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              // 放入 News 的資料
                              Text('${news.data.result[index].newsSecTitle}', style: TextStyle(fontSize: 18,),)
                            ],
                          )
                      ),
                      Divider(color: Colors.black,)
                    ],
                  ),
                  // News 點擊事件
                  onTap: () {
                    final passData = news.data.result[index];
                    
                    /*
                    * Navigator 用途在於管理進出頁面的機制，本身是一個Stack(堆疊)
                    * Method:
                    *     - push(): 將目標頁面堆疊在當前頁面上
                    *     - pop(): 將目標頁面彈出並回到前一個頁面
                    */
                    /*
                    * MaterialPageRoute 是一個 Material 元件庫的一個 Widget，用途可以實現頁面切換時風格一致
                    *   對於Android，
                    *   打開新頁面時，新的頁面會從屏幕底部滑動到屏幕頂部；
                    *   關閉頁面時，當前頁面會從屏幕頂部滑動到屏幕底部後消失，同時上一個頁面會顯示到屏幕上。
                    *   對於iOS，
                    *   當打開頁面時，
                    *   新的頁面會從屏幕右側邊緣一致滑動到屏幕左邊，直到新頁面全部顯示到屏幕上，而上一個頁面則會從當前屏幕滑動到屏幕左側而消失；
                    *   關閉頁面時，正好相反，當前頁面會從屏幕右側滑出，同時上一個頁面會從屏幕左側滑入。
                    */
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(passData)));
                  },
                );
              },
              itemCount: newsLength,
            );
        },
      )
    );
  }
}
