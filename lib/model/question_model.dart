import 'dart:core';

import 'package:flutter/material.dart';

class QuestionModel{
  final String questionText;
  final List<AnswerModel>answerList;
  QuestionModel( {required this.answerList,required this.questionText});

}

class AnswerModel{

  final String answerText;
  final bool isCorrect;
  AnswerModel({required this.answerText,required this.isCorrect});

}

List<QuestionModel>getQustion(){
  List<QuestionModel> list=[];

  list.add(QuestionModel(answerList:
      [
        AnswerModel(answerText: "Nokia", isCorrect: false),
        AnswerModel(answerText: "Samsung", isCorrect: false),
        AnswerModel(answerText: "Google", isCorrect: true),
        AnswerModel(answerText: "Apple", isCorrect: false),


      ], questionText: "Who is the owner of Flutter"));
  list.add(QuestionModel(answerList:
      [
        AnswerModel(answerText: "Apple", isCorrect: true),
        AnswerModel(answerText: "Microsoft", isCorrect: false),
        AnswerModel(answerText: "Google", isCorrect: true),
        AnswerModel(answerText: "Nokaia", isCorrect: false),


      ], questionText: "Who is the owner of Flutter"));
  list.add(QuestionModel(answerList:
      [
        AnswerModel(answerText: "Music sharing", isCorrect: false),
        AnswerModel(answerText: "video sharing", isCorrect: false),
        AnswerModel(answerText: "Live sharing", isCorrect: false),
        AnswerModel(answerText: "All of the above", isCorrect: true),


      ], questionText: "Youtube is --------Platform?"));
  list.add(QuestionModel(answerList:
      [
        AnswerModel(answerText: "Music sharing", isCorrect: false),
        AnswerModel(answerText: "video sharing", isCorrect: false),
        AnswerModel(answerText: "Live sharing", isCorrect: false),
        AnswerModel(answerText: "All of the above", isCorrect: true),


      ], questionText: "Youtube is --------Platform?"));
  list.add(QuestionModel(answerList:
      [
        AnswerModel(answerText: "True", isCorrect: true),
        AnswerModel(answerText: "False", isCorrect: false),



      ], questionText: "Flutter user dart as ?"));



  return list;

}