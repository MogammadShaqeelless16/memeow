
import 'package:memeow/models/meme.dart';

class Scenario {
  final String id;
  final String situation;
  final List<Meme> options;
  final String correctMemeId;

  Scenario({
    required this.id,
    required this.situation,
    required this.options,
    required this.correctMemeId,
  });
}
