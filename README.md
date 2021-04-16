# flutter_app

Flutter課程的作品

## 課程大綱

本次上課的教學是教導學生如何使用Flutter做出一個APP，除了了解Flutter結構外，也會帶我們如何串接API，如何處理API的資料。

## 必要工具

在課程會使用的軟體：
- Andriod Studio
- Flutter SDK
  - 打開 Flutter資料夾裡的 flutter_console 檔案
  - 指令：flutter doctor ，並依循著裡面的訊息去做安裝的動作
- 擴充軟體：Android Studio -> Setting -> Plugins 搜尋並安裝 Flutter、Dart

## 4/06課程部分(Home內容新增)

- 主要呈現畫面的程式碼
  - [main 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/main.dart)
  - [Home 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/home/Home.dart)
  - [Member 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/news/Member.dart)
  - [CourseInfo 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/courseinfo/CourseInfo.dart)

- API 設定API的程式碼
  - [Api 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/ApI/Api.dart)
  - [Url 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/ApI/Url.dart) 

- Model 取資料用的API (可看可不看，單純把API取得的JSON轉DART後貼到程式碼裡)
  - [News Model程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/Model/News.dart)
  - [Banner Model程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/Model/Banners.dart) 

## 4/13課程部分(Home新增點擊項目並呈現項目內容，CurseInfo內容新增)
- 主要呈現畫面的程式碼
  - [Home 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/home/Home.dart)
    - [News Detail 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/home/news_detail.dart)
    - [basic 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/home/basic.dart)
  - [CourseInfo 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/courseinfo/CourseInfo.dart)
    - [Coach 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/courseinfo/coach.dart)
      - [CoachDetail 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/courseinfo/CoachDetail.dart)
      - [CoachDetail_item 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/courseinfo/CoachDetail_item.dart)
    - [Course 程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/courseinfo/course.dart)

- API 設定API的程式碼
  - [Api 畫面程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/ApI/Api.dart)
  - [Url 畫面程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/ApI/Url.dart) 

- Model 取資料用的API (可看可不看，單純把API取得的JSON轉DART後貼到程式碼裡)
  - [Coach Model程式碼](https://github.com/kuoricky22/Flutter/blob/main/lib/Model/Coach.dart)
