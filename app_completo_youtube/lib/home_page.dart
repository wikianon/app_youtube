import 'package:flutter/material.dart';
import 'app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

//coisas que vao modificar ficam dentro de HomeState
class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Colocando uma Drawer MenuList
      //no canto superior esquerdo do aplicativo
      drawer: Drawer(
        child: Column(
          children: [
           UserAccountsDrawerHeader(
            //Deixando a imagen redonda usando o 
            //widget ClipRRect para cortar a imagen 
            //e o borderRadius para arredondar
            currentAccountPicture: ClipRRect(
              //O borderRadius é filho do ClipRRect
              borderRadius: BorderRadius.circular(40),
              child: Image.asset('assets/imagens/imagebackground.jpg')
              ),

            //Podemos tambem usar o ClipOval que é bem mais simples
            //currentAccountPicture: ClipOval(
            //child: Image.asset('assets/imagens/imagebackground.jpg')
            //),

            accountName: const Text('Jean Zonta'), 
            accountEmail: const Text('usuario@email.com'),
            ),

           ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              subtitle: const Text('tela de inicio'),
              onTap: () {
                print('Home');
              },
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Logout'),
              subtitle: const Text('Finalizar sessão'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ]
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          CustomSwitch(),
        ],
      ),

      // Centralizando o CustomSwitch com um container
      body: SizedBox(
        // double.infinity representa o maior valor double possível
        // nesse contexto, está dizendo para o componente ser desenhado
        // na tela no máximo que conseguir para altura e largura
        width: double.infinity,
        height: double.infinity,
        // Coluna com scrool(rolar a tela pra cima e para baixo)
        // para isso devemos utilizar o ListView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $counter'),
            //Muda a altura do texto Contador para o botao de alteração de estados da cor do app
            Container(height: 10),
            CustomSwitch(),
            //Muda a altura dos containers dentro de Row no children
            Container(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            ),

            ElevatedButton(
               onPressed: (){
                  setState(() {
                    if(counter > 0)
                     {
                      counter--;
                     }
                  });
                },
               child: Text('Decrementar'),
              ),
              
          ],
        ),
      ),

      //Ao clicar no botao incrementa
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        }, //onPressed
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
