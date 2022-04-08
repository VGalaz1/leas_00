import 'package:flutter/material.dart';

class SliderQuestion extends StatefulWidget {
  final String inputQuestion;

  const SliderQuestion(this.inputQuestion);

  @override
  State<SliderQuestion> createState() => _SliderQuestionState();
}

class _SliderQuestionState extends State<SliderQuestion> {
  double _currentSliderValue = 5.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(widget.inputQuestion,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _currentSliderValue.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 180,
          ),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.orange,
              value: _currentSliderValue,
              min: 1,
              max: 10,
              divisions: 9,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }),
          Row(
            children: const [
              Text("     "),
              Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                  '                                                                                      '),
              Text('10',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
            ],
          )
        ],
      ),
    );
  }
}
