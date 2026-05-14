class DiceResult {
  final String id;
  final int diceType;
  final int result;
  final DateTime timestamp;
  final bool isCriticalSuccess;
  final bool isCriticalFailure;

  DiceResult({
    required this.id,
    required this.diceType,
    required this.result,
    required this.timestamp,
    this.isCriticalSuccess = false,
    this.isCriticalFailure = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diceType': diceType,
      'result': result,
      'timestamp': timestamp.toIso8601String(),
      'isCriticalSuccess': isCriticalSuccess,
      'isCriticalFailure': isCriticalFailure,
    };
  }

  factory DiceResult.fromJson(Map<String, dynamic> json) {
    return DiceResult(
      id: json['id'],
      diceType: json['diceType'],
      result: json['result'],
      timestamp: DateTime.parse(json['timestamp']),
      isCriticalSuccess: json['isCriticalSuccess'] ?? false,
      isCriticalFailure: json['isCriticalFailure'] ?? false,
    );
  }
}
