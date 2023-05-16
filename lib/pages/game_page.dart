import 'package:app/data_structures/lista_de_adjacencia.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GamePage extends StatefulWidget {
  final ListaDeAdjacencia<Color> listaDeAdjacencia;

  const GamePage({
    super.key,
    required this.listaDeAdjacencia,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late RiveAnimation personagem;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double margin = size.width * 0.1;
    final double availableWidth = size.width - margin * 2;
    final double availableHeight = size.height - margin * 2 - size.height * 0.2;
    return ValueListenableBuilder(
      valueListenable: personagemPositionController,
      builder: (context, snapshot, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("MazeGraph")),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: LayoutBuilder(builder: (context, constraints) {
                  final double margin = constraints.maxWidth * 0.1;
                  final double availableWidth =
                      constraints.maxWidth - margin * 2;
                  final double availableHeight = constraints.maxHeight -
                      margin * 2 -
                      constraints.maxHeight * 0.2;
                  final double aspectRatio = availableWidth / availableHeight;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          personagemPositionController.colorMatriz.length,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: personagemPositionController.colorMatriz.length *
                        personagemPositionController.colorMatriz.length, // row
                    itemBuilder: (BuildContext context, int index) {
                      final row = index ~/
                          personagemPositionController.colorMatriz[0].length;
                      final col = index %
                          personagemPositionController.colorMatriz[0].length;

                      if (personagemPositionController.colorMatriz[row][col] ==
                          Colors.red) {
                        return const RiveAnimation.asset(
                          'assets/personagem_2.riv',
                          animations: [
                            "Walk sem livro",
                          ],
                        );
                      }
                      return Container(
                        color: personagemPositionController.colorMatriz[row]
                            [col],
                      );
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomButtonsDialog();
                          });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.play_arrow_sharp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomButtonsDialog extends StatelessWidget {
  const CustomButtonsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
      width: 400,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButtom(
            backGroundColor: Colors.orange,
            title: "Toda BFS",
            left: MediaQuery.of(context).size.height / 20,
            bottom: MediaQuery.of(context).size.height / 20,
            onPressed: () async {
              await personagemPositionController.rodaAllBFS();
              personagemPositionController.comecaAandar(Colors.orange);
              Navigator.of(context).pop();
            },
          ),
          CustomButtom(
            backGroundColor: Colors.purple,
            title: "Resolver DFS",
            right: MediaQuery.of(context).size.height / 20,
            bottom: MediaQuery.of(context).size.height / 20,
            onPressed: () async {
              await personagemPositionController.rodaDFS();
              personagemPositionController.comecaAandar(Colors.purple);
              Navigator.of(context).pop();
            },
          ),
          CustomButtom(
            backGroundColor: Colors.green,
            title: "Caminho BFS",
            bottom: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 3,
            right: MediaQuery.of(context).size.width / 3,
            onPressed: () async {
              await personagemPositionController.rodaBFSpath();
              personagemPositionController.comecaAandar(Colors.green);
              Navigator.of(context).pop();
            },
          ),
          CustomButtom(
            backGroundColor: Colors.blue,
            title: "Djikistra",
            bottom: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 3,
            right: MediaQuery.of(context).size.width / 3,
            onPressed: () async {
              await personagemPositionController.rodaBFSpath();
              personagemPositionController.comecaAandar(Colors.blue);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ));
  }
}

class CustomButtom extends StatelessWidget {
  final double? left;
  final double? right;
  final double? bottom;
  final void Function()? onPressed;
  final String title;

  final Color backGroundColor;
  const CustomButtom({
    this.bottom,
    this.left,
    this.right,
    this.onPressed,
    required this.title,
    super.key,
    required this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backGroundColor)),
      onPressed: onPressed,
      child: SizedBox(
        height: 40,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.play_arrow_sharp),
            Text(title),
          ],
        ),
      ),
    );
  }
}
