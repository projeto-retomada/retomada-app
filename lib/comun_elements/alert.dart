import 'package:flutter/material.dart';

/*
Componente de alertas do projeto retomada
  Esse componente possui 4 tipos:
    - success
    - alert
    - error
    - info

   É possível dizer qual o tipo, customizar a mensagem e inserir um botão de ação nesse componente
   As cores e os ícones laterais não são customizáveis

  -------------------------
   Como Usar:
  -------------------------
  Nas páginas em que os alerts forem utilizados é necessário importar esse arquivo:
    - import 'package:retomada/comun_elements/alert.dart'
  Depois é deve-se instanciar um objeto da classe RetomadaAlert:
    - RetomadaAlert alert = new RetomadaAlert();
  Feito isso, basta que o método getAlert seja utilizado, esse método retorna um widget do tipo Container.
  O método getAlert recebe até 5 atributos, sendo 3 obrigatórios e 2 opcionais:

    ---------------------------
      Exemplos:
    ---------------------------
    - Alert Success Simples (só texto):
      alert.getAlert(
        context,
        'success',
        'Aqui você vai por a string da sua mensagem'
       )

    - Alert Info com botão de ação:
      alert.getAlert(
        context,
        'info',
        'Aqui você vai por a string da sua mensagem',
        buttonText: 'Aqui é o texto do seu botão',
        buttonFunction: ()=>{
          Aqui é a função que seu botão deve executar
        }
      ),
 */


class RetomadaAlert extends Container {
  static getColor(alertType) {
    if (alertType == 'success') {
      return Color.fromRGBO (202, 249, 202, 1);
    } else if (alertType == 'alert') {
      return Color.fromRGBO (245, 249, 195, 1);
    } else if (alertType == 'error') {
      return Color.fromRGBO (249, 195, 195, 1);
    } else if (alertType == 'info') {
      return Color.fromRGBO (195, 222, 249, 1);
    }
  }

  static getChildrenColor(alertType) {
    if (alertType == 'success') {
      return Color.fromRGBO (154, 214, 154, 1);
    } else if (alertType == 'alert') {
      return Color.fromRGBO (223, 229, 133, 1);
    } else if (alertType == 'error') {
      return Color.fromRGBO (224, 136, 136, 1);
    } else if (alertType == 'info') {
      return Color.fromRGBO (137, 179, 221, 1);
    }
  }

  static getIcon(alertType) {
    if (alertType == 'success') {
      return Icons.check_circle;
    } else if (alertType == 'alert') {
      return Icons.error;
    } else if (alertType == 'error') {
      return Icons.cancel;
    } else if (alertType == 'info') {
      return Icons.info;
    }
  }

  getButton(buttonText, buttonFunction, alertType) {
    if (buttonText != null  && buttonFunction != null) {
      return Container (
        padding: EdgeInsets.only (left: 30, top: 5),
        child: FlatButton (
          onPressed: buttonFunction,
          color: getChildrenColor (alertType),
          child: Text (buttonText.toUpperCase(), style: TextStyle (
              fontSize: 12,
              color: getColor(alertType),
              fontWeight: FontWeight.w600
          ),),
        ),
      );
    }
    else return;
  }

  Container getAlert(BuildContext context, String alertType, String alertText, {String buttonText, Function buttonFunction}) {
    return Container (
        padding: EdgeInsets.all (10),
        margin: EdgeInsets.only (top: 10, bottom: 10),
        color: getColor (alertType),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon (
                  getIcon(alertType),
                  color: getChildrenColor (alertType),
                ),
                Container (
                  padding: EdgeInsets.only (left: 10.0, right: 10.0),
                  width: MediaQuery
                      .of (context)
                      .size
                      .width * 0.68,
                  child: Text (
                    alertText,
                    style: TextStyle (
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            Container(
              child: getButton(buttonText, buttonFunction, alertType),
            )
          ],
        )
    );
  }
}
