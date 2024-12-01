import 'dart:io';

class HistorianHysteria {
  List<int> leftNumbers = [];
  List<int> rightNumbers = [];

  Future<void> _fetchData() async {
    final file = File('lib/day_1/day_1.txt');
    final lines = await file.readAsLines();

    for (final line in lines) {
      final parts = line.split('  ');
      if (parts.length == 2) {
        leftNumbers.add(int.parse(parts[0]));
        rightNumbers.add(int.parse(parts[1]));
      }
    }
  }

  void calculateTotalDistance() async {
    await _fetchData();
    leftNumbers.sort();
    rightNumbers.sort();
    int distance = 0;

    for (int i = 0; i < leftNumbers.length; i++) {
      distance += (rightNumbers[i] - leftNumbers[i]).abs();
    }
    print(distance);
  }

  void calculateSimilarityScore() async {
    await _fetchData();
    int score = 0;

    for (int i = 0; i < leftNumbers.length; i++) {
      for (int j = 0; j < rightNumbers.length; j++) {
        int counter = 0;
        if (leftNumbers[i] == rightNumbers[j]) {
          counter++;
        }
        score += leftNumbers[i] * counter;
      }
    }
    print(score);
  }
}
