enum BallEventType {
  dot,
  single,
  doubleRun,
  triple,
  four,
  six,
  wide,
  noBall,
  wicket,
}

class BallEvent {
  final BallEventType type;
  final int runs;
  final bool legalDelivery;
  final String? batsman;
  final String? bowler;

  const BallEvent({
    required this.type,
    required this.runs,
    required this.legalDelivery,
    this.batsman,
    this.bowler,
  });

  bool get isWicket => type == BallEventType.wicket;

  bool get isBoundary =>
      type == BallEventType.four ||
          type == BallEventType.six;

  bool get isExtra =>
      type == BallEventType.wide ||
          type == BallEventType.noBall;

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'runs': runs,
      'legalDelivery': legalDelivery,
      'batsman': batsman,
      'bowler': bowler,
    };
  }

  factory BallEvent.fromMap(Map<String, dynamic> map) {
    final typeName = map['type'] as String? ?? 'dot';

    final type = BallEventType.values.firstWhere(
          (event) => event.name == typeName,
      orElse: () => BallEventType.dot,
    );

    return BallEvent(
      type: type,
      runs: map['runs'] as int? ?? 0,
      legalDelivery: map['legalDelivery'] as bool? ?? true,
      batsman: map['batsman'] as String?,
      bowler: map['bowler'] as String?,
    );
  }
}