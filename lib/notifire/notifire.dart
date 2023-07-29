import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xo_game/state/state.dart';

final XOProvider = StateNotifierProvider<XONotifier, XOState>((ref) {
  return XONotifier();
});

class XONotifier extends StateNotifier<XOState> {
  XONotifier() : super(XOState.Initial());

  void setIndex(int ind) {
    if (state.status != Status.init) {
      state = state.copyWith(
          play: [0, 0, 0, 0, 0, 0, 0, 0, 0],
          isComputerPlayer: false,
          status: Status.init,
          winner: "none");
    }

    if (state.board[ind] == 0) {
      state.board[ind] = getPlayer();
    } else {
      return;
    }
    ;
    checkWinner();
    if (state.board.contains(0) == false) {
      state = state.copyWith(status: Status.draw);
    }
    if (state.status == Status.init) {
      state.isComputePlayer = !state.isComputePlayer;
      state = state.copyWith(isComputerPlayer: state.isComputePlayer);
    }
  }

  void checkWinner() {
    if (state.board[0] == state.board[1] &&
        state.board[0] == state.board[2] &&
        state.board[0] != 0) {
      setWinner();
    } else if (state.board[3] == state.board[4] &&
        state.board[3] == state.board[5] &&
        state.board[3] != 0) {
      setWinner();
    } else if (state.board[6] == state.board[7] &&
        state.board[6] == state.board[8] &&
        state.board[6] != 0) {
      setWinner();
    } else if (state.board[0] == state.board[3] &&
        state.board[0] == state.board[6] &&
        state.board[0] != 0) {
      setWinner();
    } else if (state.board[1] == state.board[4] &&
        state.board[1] == state.board[7] &&
        state.board[1] != 0) {
      setWinner();
    } else if (state.board[2] == state.board[5] &&
        state.board[2] == state.board[8] &&
        state.board[2] != 0) {
      setWinner();
    } else if (state.board[0] == state.board[4] &&
        state.board[0] == state.board[8] &&
        state.board[0] != 0) {
      setWinner();
    } else if (state.board[2] == state.board[4] &&
        state.board[2] == state.board[6] &&
        state.board[2] != 0) {
      setWinner();
    }
  }

  void setWinner() {
    List<String> win = ['none', 'X', 'O'];

    state = state.copyWith(status: Status.finish, winner: win[getPlayer()]);
  }

  int getPlayer() {
    return state.isComputePlayer ? 1 : 2;
  }
}
