
import 'package:memeow/models/meme.dart';
import 'package:memeow/models/scenario.dart';

List<Meme> allMemes = [
  Meme(id: 'm001', imagePath: 'assets/images/confused_cat.jpg', name: 'Confused Cat'),
  Meme(id: 'm002', imagePath: 'assets/images/sad_cat.jpg', name: 'Sad Cat'),
  Meme(id: 'm003', imagePath: 'assets/images/angry_cat.jpg', name: 'Angry Cat'),
  Meme(id: 'm004', imagePath: 'assets/images/happy_cat.jpg', name: 'Happy Cat'),
];

List<Scenario> scenarios = [
  Scenario(
    id: 's001',
    situation: 'When you hear a can of tuna being opened...',
    options: allMemes.sublist(0,4), // Example options
    correctMemeId: 'm004',
  ),
  Scenario(
    id: 's002',
    situation: 'When you see the bottom of your food bowl...',
    options: allMemes.sublist(0,4),
    correctMemeId: 'm002',
  ),
  Scenario(
    id: 's003',
    situation: 'When the red dot disappears...',
    options: allMemes.sublist(0,4),
    correctMemeId: 'm001',
  ),
   Scenario(
    id: 's004',
    situation: 'When the hooman takes your spot on the couch...',
    options: allMemes.sublist(0,4),
    correctMemeId: 'm003',
  ),
];
