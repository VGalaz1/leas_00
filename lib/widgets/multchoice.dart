import 'package:flutter/material.dart';
import 'package:leas_01/data/questionData.dart';
import 'package:leas_01/screens/wrapper.dart';
import 'package:leas_01/services/indexservice.dart';

class Alternatives extends StatefulWidget {
  final String inputQuestion;
  final Map<String, int> inputAnswers;
  final int theIndex;

  const Alternatives(this.inputQuestion, this.inputAnswers, this.theIndex);

  @override
  State<Alternatives> createState() => _AlternativesState();
}

class _AlternativesState extends State<Alternatives> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(questions[globalIndex.serviceIndex].question!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(
            height: 60,
          ),
          for (int i = 0; i < widget.inputAnswers.length; i++)
            Container(
              width: 240,
              margin: const EdgeInsets.only(bottom: 12),
              child: MaterialButton(
                shape: const StadiumBorder(),
                color: Colors.orange,
                onPressed: () {
                  setState(() {
                    if (globalIndex.serviceIndex > 1) {
                      globalIndex.serviceIndex = 0;
                    } else {
                      globalIndex.serviceIndex = globalIndex.serviceIndex + 1;
                    }
                  });
                  print(globalIndex.serviceIndex);
                  print(widget.inputAnswers.values.toList()[i]);
                },
                child: Text(widget.inputAnswers.keys.toList()[i]),
              ),
            )
        ],
      ),
    );
  }
}
