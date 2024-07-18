import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreList = Get.arguments as List<int>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) =>
            Text('player ${index + 1} score ${scoreList[index]}'),
        itemCount: scoreList.length,
      ),
    );
  }
}
