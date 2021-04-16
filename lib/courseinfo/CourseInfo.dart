import 'package:flutter/material.dart';
import 'package:flutter_app/ApI/Api.dart';
import 'package:flutter_app/Model/Coach.dart';
import 'package:flutter_app/courseinfo/coach.dart';

import 'course.dart';

class CourseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //最頂部 Tilte
      child: Scaffold(
        appBar: AppBar(
          /*
          * TabBar 分頁工具列
          */
          bottom: TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: '課程',),
              Tab(text: '教練',),
            ],
          ),
          title: Text('Tabs Demo'),
        ),

        // 內容
        body:FutureBuilder(
          future: Api.queryCoach(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var coachData = Coach.fromJson(snapshot.data);
            return
                TabBarView(
                    children: [
                      CourseItem(),
                      CoachItem(coachData)
                    ]
                );
          },
        )
      ),
    );
  }
}
