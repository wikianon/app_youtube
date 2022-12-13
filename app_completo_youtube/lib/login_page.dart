import 'package:flutter/material.dart';

//Criando rota de navegação Manuais
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //string que recebe varias alteraçoes nao pode ser final
  String email = '';
  String password = '';

  Widget _body(BuildContext context) {
    //SingleChildScroolView nao funciona dentro do widget Column no vetor children no Scaffolding
    //SingleChildScrollView nao funcionou no Widget Material ele funcionou no Scaffold
    return SingleChildScrollView(
      //SizedBox e Container dao o alinhamento total da tela
      child: SizedBox(
        //No SizedBox so se pode usar o SingleChildScroolView
        //nao podemos usar double.infinity
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Usando o widget SizedBox para definir o tamanho da imagen
              //Para nao dar erro na abertura da imagen no aplicativo devemos configurar o assets
              //configurando o caminho da imagen no arquivo pubspec.yaml
              SizedBox(
                  width: 200,
                  height: 200,
                  //Adicioando imagem da internet com url
                  //child: Image.network('https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo_TV_2015.png')

                  //Adicionando imagen do computador com um diretorio dentro do projeto
                  //é preferivel adicionar uma imagem local e nao da internet
                  child: Image.asset('assets/imagens/Logo_TV_2015.png')),

              //Definindo o espaçamento entre o textField do email e a imagen
              Container(height: 10),

              //Colocando o TexField dentro de um widget Card.
              //O widget Card aceita apenas um filho chamado child.
              //Para colocar mais de um widget dentro de card precisamos
              //utilizar o widget Column com um array de widget usando children
              //O widget Card deixa os Texfield Email e Password brancos destacados.
              Card(
                //Para colocar mais de um widget dentro de
                child: Padding(
                  //O padding cria um cartao para os TextField
                  //EdgeInsets define um recuo de 12 pixels em cada direção
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              //SizedBox para separar as caixas de texto e os botoes
              ElevatedButton(
                onPressed: () {
                  if (email == 'usuario@email.com' && password == '1234') {
                    //A funcao .push permite voltar a tela inicial de login
                    //Navigator.of(context).push(
                    //MaterialPageRoute(
                    //  builder: (context) => HomePage()
                    //  ),
                    //);

                    //Para desprezar a tela de inicial de login devo utilizar pushReplacement
                    //Navigator.of(context).pushReplacement(
                    //MaterialPageRoute(
                    //  builder: (context) => HomePage()
                    //  ),
                    //);

                    //Chamando as rotas nomeadas com a opção de voltar na tela de login
                    //Navigator.of(context).pushNamed('/home');

                    //Chamando as rotas nomeadas sem a opçao de voltar a tela de login
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    //debugPrint('login invalido!!!');

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Atenção',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                          content: const Text(
                            'Login inválido!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text(
                                'Fechar',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //O widget Stack empilha todos os widgets no array children
      body: Stack(
        children: [
          SizedBox(
              //height altura da imagen
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/imagens/imagebackground.jpg',
                fit: BoxFit.cover,
              )),
          Container(
            //withOpacity 0.3 define 30% de opacidade
            //o maximo de opacidade é até 1
            color: Colors.black.withOpacity(0.3),
          ),
          _body(context),
        ],
      ),
    );
  }
}
