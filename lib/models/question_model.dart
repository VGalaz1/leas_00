import 'package:leas_01/widgets/slider.dart';

class QuestionModel {
  String? question;
  Map<String, int>? answers;
  int _qid;
  QuestionModel(this.question, this._qid, [this.answers]);
}
