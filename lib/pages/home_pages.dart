import 'package:flutter/material.dart';

import '../model/question_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuestionModel> qustionList = getQustion();
  int score = 0;
  AnswerModel? selectedAnswer;
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 50, 80),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 50, 80),
        title: Text(
          "Quiz app",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Simple quiz app",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            _questionWidget(),
            _answerList(),
            _nextButton()
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${qustionList.length.toString()}",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            qustionList[currentQuestionIndex].questionText,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  _answerList(){
    return Column(
      children: qustionList[currentQuestionIndex].answerList
      .map((e) => _answerButton(e)).toList(),
    );
  }
  Widget _answerButton(AnswerModel answerModel){
    bool isSelected=answerModel==selectedAnswer;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder()
                ,primary:isSelected?Colors.orangeAccent: Colors.white,
            onPrimary:isSelected?Colors.white: Colors.black
          ),
          onPressed: (){
            if(selectedAnswer==null){
              if(answerModel.isCorrect){
                score++;
              }
            }
    setState(() {
      selectedAnswer=answerModel;
    });
      }, child: Text(answerModel.answerText.toString())),
    );
  }

  _nextButton(){

    bool isLastQustion=false;
    if(currentQuestionIndex==qustionList.length -1){
      isLastQustion=true;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width*0.5,
      height: 48,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder()
              ,primary: Colors.blueAccent,
              onPrimary: Colors.white
          ),
          onPressed: (){
            if(isLastQustion){
              //dislplay score
              showDialog(context: context, builder: (_)=>_showScoreDialog());

            }else{
              //next qustion
              setState(() {
                selectedAnswer=null;
                currentQuestionIndex++;
              });
            }

          }, child: Text(isLastQustion? "Submit":"Next")),
    );
  }
  _showScoreDialog(){
    bool isPassed=false;
     if(score >=qustionList.length *0.6){
       //pass if 60%
       isPassed=true;
     }
     String title=isPassed?"passed":"failed";

    return AlertDialog(
      title: Text(title +" | score is $score",
      style: TextStyle(
      color:    isPassed?Colors.green:Colors.redAccent
      ),
      ),
      content: ElevatedButton(onPressed: (){
        Navigator.pop(context);
     setState(() {
       currentQuestionIndex=0;
       score=0;
       selectedAnswer=null;
     });
      },
          child: Text("Restart")),
    );
  }
}
