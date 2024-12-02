import 'dart:io';

class RedNosedReports {
  final List<List<int>> _reports = [];
  Future<void> _fetchData() async {
    final file = File('lib/day_2/day_2.txt');
    final lines = await file.readAsLines();

    for (final line in lines) {
      final parts = line.split(' ');
      _reports.add(parts.map(int.parse).toList());
    }
  }

  void countSafeReports() async {
    await _fetchData();
    int safeReportsCount = 0;

    for (final report in _reports) {
      final bool increasing = report[1] > report[0];
      final bool decreasing = report[1] < report[0];
      bool isSafe = true;

      for (int i = 1; i < report.length; i++) {
        final int diff = (report[i] - report[i - 1]).abs();

        if (diff < 1 || diff > 3) {
          isSafe = false;
          break;
        }

        if ((increasing && report[i] <= report[i - 1]) || (decreasing && report[i] >= report[i - 1])) {
          isSafe = false;
          break;
        }
      }

      if (isSafe) {
        safeReportsCount++;
      }
    }
    print(safeReportsCount);
  }
}
