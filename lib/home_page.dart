import 'package:first_project/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final quizText = TextEditingController();
  var name = ''.obs;
  final country = <String>['egypt', 'france', 'usa', 'uk'];
  final city = <String>['cairo', 'paris', 'ws', 'london'];
  var question = ''.obs;
  var index = 0;
  var score = 0;
  var scoreText = ''.obs;
  var answerVisible = false.obs;
  var statsVisible=false.obs;
  var questionCount = ''.obs;
  final scoreList = <int>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: (Column(children: [
        Obx(() {
          return Text('$question');
        }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: quizText,
          ),
        ),
        SizedBox(height: 20,
        ),
        ElevatedButton(onPressed: () {
          answerVisible.value = true;
          score = 0;
          index = 0;
          question.value = 'what is the capital of ${country[index]}';
          questionCount.value = 'Question 1 of ${country.length}';
        }, child: Text('start'),
        ),
        SizedBox(height: 20,),
        Obx(() {
          return Visibility(
            visible: answerVisible.value,
            child: ElevatedButton(onPressed: () {

              final answer = quizText.text.toLowerCase();
              if (answer.isEmpty) {
                Get.snackbar('Error', 'Error');
              } else {
                if (answer == city[index]) {
                  score++;
                }
                index++;
                if (index < country.length) {
                  question.value = 'what is the capital of ${country[index]}';
                  questionCount.value =
                  'Question ${index + 1} of ${country.length}';
                } else {
                  Get.snackbar('Success', 'score=$score');
                  scoreText.value = 'score is $score';
                  answerVisible.value = false;
                  scoreList.add(score);
                  statsVisible.value=true;
                }
                quizText.clear();
              }
            },
              child: Text('answer'),
            ),
          );
        }),
        SizedBox(height: 20,),
        Obx(() {
          return Visibility(visible: statsVisible.value,
            child: ElevatedButton(onPressed: () {

              Get.to(StatsPage(), arguments: scoreList);

            }, child: Text('stats')),
          );
        }),
        SizedBox(height: 20,),
        Obx(() {
          return Text('$scoreText');
        }),
        SizedBox(height: 20,),
        Obx(() {
          return Text('$questionCount');
        }),
      ],
      )
      ),
    );
  }
}
