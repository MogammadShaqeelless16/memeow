class Meme {
  final String id;
  final String imagePath;

  const Meme({required this.id, required this.imagePath});
}

class Scenario {
  final String title;
  final List<String> roles;
  final Map<String, String> correctSolution; // Map<Role, MemeId>

  const Scenario({
    required this.title,
    required this.roles,
    required this.correctSolution,
  });
}
