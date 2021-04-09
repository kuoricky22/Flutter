import 'package:flutter/material.dart';
import 'package:flutter_app/ApI/Api.dart';
import 'package:flutter_app/Model/Banners.dart';
import 'package:flutter_app/Model/News.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  void queryBanner() {
    // .then 就是 Future 的用法之一
    // value 就是 Api.dart 裡對應方法中的回傳值(response.data)
    Api.queryBanner().then((value) {
      setState(() {

        banners = Banners.fromJson(value);
        bannersLength = banners.data.result.length;
      });
    });
  }

  // 創建 Method (取得 News 資料)
  void queryNews() {
    //.then 就是 Future 的用法之一
    // value 就是 Api.dart 裡對應方法中的回傳值(response.data)
    Api.queryNews().then((value) {
      setState(() {

        news = News.fromJson(value);
        newsLength = news.data.result.length;
      });
    });
  }

  // initState() ：進行初始化的工作，並在生命週期裡只執行一次
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 使用 Method
    queryBanner();
    queryNews();
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
      // 讓首頁可以上下移動
      ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            // 放入Banner裡的資料
            return Column(
              children: [
                Container(
                  height: 300,

                  // Swiper 輪播插件：可讓多張圖片進行有順序的播放，用此類別需另外安裝
                  child: Swiper(
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
              print('list click');
            },
          );
        },
        itemCount: newsLength,
      ),
    );
  }
}
