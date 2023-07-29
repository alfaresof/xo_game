import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xo_game/notifire/notifire.dart';
import 'package:xo_game/state/state.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(XOProvider);
    final controller = ref.read(XOProvider.notifier);
    List<String> options = ['', 'X', 'O'];
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              state.status == Status.init
                  ? "الآن دور : ${state.isComputePlayer ? "X" : "O"}"
                  : state.status == Status.draw
                      ? "تعادل"
                      : "الفائز هو : ${state.winner}",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: state.status == Status.init
                    ? Colors.black
                    : state.status == Status.draw
                        ? Colors.red
                        : Colors.greenAccent,
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () async {
                    controller.setIndex(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12.0)),
                    alignment: Alignment.center,
                    child: Text(
                      options[state.board[index]],
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
