import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemQueVaiMudar = AssetImage("assets/padrao.png");
  var _textoQueVaiMudar = "ESCOLHA DO USUÁRIO:";

  void _opcaoSelecionada(String escolhaDoUsuario) {
    //array de opções para o app
    List<String> opcoesProApp = ["pedra", "papel", "tesoura"];
    //numeros aleatorios
    var numero = Random().nextInt(3);
    var escolhaDoApp = opcoesProApp[numero];

    switch (escolhaDoApp) {
      case "pedra":
        setState(() {
          this._imagemQueVaiMudar = AssetImage("assets/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemQueVaiMudar = AssetImage("assets/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemQueVaiMudar = AssetImage("assets/tesoura.png");
        });
        break;
      default:
    }
    if ((escolhaDoUsuario == "pedra" && escolhaDoApp == "tesoura") ||
        (escolhaDoUsuario == "tesoura" && escolhaDoApp == "papel") ||
        (escolhaDoUsuario == "papel" && escolhaDoApp == "pedra")) {
      setState(() {
        this._textoQueVaiMudar = "PARABÉNS! VOCÊ GANHOU:)";
      });
    } else if ((escolhaDoUsuario == "pedra" && escolhaDoApp == "papel") ||
        (escolhaDoUsuario == "tesoura" && escolhaDoApp == "pedra") ||
        (escolhaDoUsuario == "papel" && escolhaDoApp == "tesoura")) {
      setState(() {
        this._textoQueVaiMudar = "VOCÊ PERDEU! TENTE NOVAMENTE:(";
      });
    } else {
      setState(() {
        this._textoQueVaiMudar = "EMPATE! :|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JOKENPO"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "ESCOLHA DO APP:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Image(
                image: this._imagemQueVaiMudar,
                height: 135,
              ),
              Text(this._textoQueVaiMudar,
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //pedra
                  GestureDetector(
                    child: Image.asset(
                      "assets/pedra.png",
                      height: 95,
                    ),
                    onTap: () => _opcaoSelecionada("pedra"),
                  ),
                  //papel
                  GestureDetector(
                    child: Image.asset(
                      "assets/papel.png",
                      height: 95,
                    ),
                    onTap: () => _opcaoSelecionada("papel"),
                  ),
                  //tesoura
                  GestureDetector(
                    child: Image.asset(
                      "assets/tesoura.png",
                      height: 95,
                    ),
                    onTap: () => _opcaoSelecionada("tesoura"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
