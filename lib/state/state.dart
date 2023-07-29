enum Status { init, finish, draw }

class XOState {
  List<int> board;
  bool isComputePlayer;
  String winner;
  Status status;

  XOState({
    required this.board,
    required this.status,
    required this.winner,
    required this.isComputePlayer,
  });

  factory XOState.Initial() {
    return XOState(
      board: [0, 0, 0, 0, 0, 0, 0, 0, 0],
      status: Status.init,
      winner: "none",
      isComputePlayer: false,
    );
  }

  XOState copyWith({
    List<int>? play,
    Status? status,
    String? winner,
    bool? isComputerPlayer,
  }) {
    return XOState(
      board: play ?? this.board,
      status: status ?? this.status,
      winner: winner ?? this.winner,
      isComputePlayer: isComputePlayer ?? this.isComputePlayer,
    );
  }
}
