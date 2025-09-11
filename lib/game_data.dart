import 'package:memeow/models.dart';

// A library of all available memes in the game
const List<Meme> allMemes = [
  Meme(id: 'm01', imagePath: 'assets/images/memes/sad_cat.jpg'),
  Meme(id: 'm02', imagePath: 'assets/images/memes/confused_cat.jpg'),
  Meme(id: 'm03', imagePath: 'assets/images/memes/angry_cat.jpg'),
  Meme(id: 'm04', imagePath: 'assets/images/memes/smug_cat.jpg'),
  Meme(id: 'm05', imagePath: 'assets/images/memes/happy_cat.jpg'),
  Meme(id: 'm06', imagePath: 'assets/images/memes/screaming_cat.jpg'),
  Meme(id: 'm07', imagePath: 'assets/images/memes/crying_cat.jpg'),
  Meme(id: 'm08', imagePath: 'assets/images/memes/polite_cat.jpg'),
];

// A list of all scenarios in the game
final List<Scenario> scenarios = [
  // Scenario 1
  Scenario(
    title: 'POV: You told your grandma you were sick in front of your mom.',
    roles: ['Your Grandma', 'Your Mom', 'You'],
    correctSolution: {
      'Your Grandma': 'm01', // Sad Cat
      'Your Mom': 'm03', // Angry Cat
      'You': 'm08', // Polite Cat
    },
  ),
  // Scenario 2
  Scenario(
    title: 'When you open a can of tuna in the kitchen.',
    roles: ['You', 'Every Cat in a 5-mile radius'],
    correctSolution: {
      'You': 'm05', // Happy Cat
      'Every Cat in a 5-mile radius': 'm06', // Screaming Cat
    },
  ),
  // Scenario 3
  Scenario(
    title: 'My cat watching me clean the litter box it just used.',
    roles: ['Me', 'My Cat'],
    correctSolution: {
      'Me': 'm07', // Crying Cat
      'My Cat': 'm04', // Smug Cat
    },
  ),
];
