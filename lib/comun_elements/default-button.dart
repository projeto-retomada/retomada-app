import 'package:flutter/material.dart';

/*
Componente default-button do projeto retomada
  
   É possível dizer qual o texto, qual a ícone (por meio do código da classe Icons) e escutar o evento
   onPressed do botão
  -------------------------
   Como Usar:
  -------------------------
  Nas páginas em que o botão for utilizado é necessário importar esse arquivo:
    - import 'package:retomada/comun_elements/default-button.dart'
  Depois é deve-se instanciar um objeto da classe DefaultButton, definindo o texto e o parâmetro
  do botão:
    - DefaultButton('texto', 9999);
    ---------------------------
      Exemplo:
    ---------------------------
    - DefaultButton('Botão', 59403);
 */

class DefaultButton extends StatelessWidget {
  String _text;
  int _iconcode;

  DefaultButton(String text, int iconcode, {@required this.onPressed}) {
    _text = text;
    _iconcode = iconcode;
  }
  GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        color: Color.fromRGBO(32, 153, 160, 1),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black12,
        padding: EdgeInsets.all(12.0),
        splashColor: Color.fromRGBO(32, 153, 160, 0),
        shape: StadiumBorder(),
        child: Row(
          children: [
            Icon(
              IconData(_iconcode, fontFamily: 'MaterialIcons'),
              color: Colors.white,
            ),
            SizedBox(
              width: 6.0,
            ),
            Text(
              _text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}
