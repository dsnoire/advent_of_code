import 'dart:io';

class MullItOver {
  late List<String> _input;

  Future<void> _fetchData() async {
    final file = File('lib/day_3/day_3.txt');
    _input = await file.readAsLines();
  }

  void calculateValidInstruction() async {
    await _fetchData();

    final RegExp validMulRegex = RegExp(r'mul\(\d{1,3},\d{1,3}\)');
    int totalSum = 0;

    for (final line in _input) {
      final matches = validMulRegex.allMatches(line);

      for (final match in matches) {
        final validInstruction = match.group(0)!;
        final numbers = RegExp(r'\d+').allMatches(validInstruction).map((x) => int.parse(x.group(0)!)).toList();

        if (numbers.length == 2) {
          totalSum += numbers[0] * numbers[1];
        }
      }
    }
    print(totalSum);
  }
}
