import 'package:flutter/material.dart';

class Componentes {
  appBar(funcao) {
    return AppBar(
      title: const Text('Calculadora de IMC'),
      centerTitle: true,
      backgroundColor: Colors.red,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: funcao,
        )
      ],
    );
  }

  iconeGrande() {
    return const Icon(
      Icons.person,
      size: 120,
      color: Colors.red,
    );
  }

  criaInputTexto(tipoTeclado, textoEtiqueta, controlador, msgValidacao) {
    return TextFormField(
      keyboardType: tipoTeclado,
      decoration: InputDecoration(
        labelText: textoEtiqueta,
        labelStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 20,
      ),
      controller: controlador,
      validator: (value) {
        if (value!.isEmpty) {
          return msgValidacao;
        }
      },
    );
  }

  criaBotao(controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            if (controladorFormulario.currentState.validate()) {
              funcao();
            }
          },
          child: Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }

  criaTexto(conteudo, tamanho, cor) {
    return Text(
      conteudo,
      style: TextStyle(
        fontSize: tamanho,
        color: cor,
      ),
    );
  }
}
