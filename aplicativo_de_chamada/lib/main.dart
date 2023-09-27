import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de presença',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 162, 236, 201)),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double screenHeight;
  late double fontSizeAsPercentage;
  late TextStyle titleStyle;

  bool isStudentCheck = false;
  bool isProfessorCheck = false;

  String nomeCadastro = "";
  String emailCadastro = "";
  String senhaCadastro = "";


  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;

    TextStyle titleStyle = TextStyle(fontFamily: 'DancingScript',
        fontSize: screenHeight * 0.1,
        fontWeight: FontWeight.bold,
        color: Colors.black);

    SizedBox nameReturn() {
      return SizedBox(
        width: screenHeight * 0.5,
        child: TextField(
          onChanged: (text) {
            nomeCadastro = text;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 3),
                borderRadius: BorderRadius.circular(20.0),
              ),
              labelText: 'Nome do novo usuário'),
        ),
      );
    }

    SizedBox emailReturn() {
      return SizedBox(
        width: screenHeight * 0.5,
        child: TextField(
          onChanged: (text) {
            emailCadastro = text;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3),
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: 'Email do novo usuário',
          ),
        ),
      );
    }

    SizedBox passwordReturn() {
      return SizedBox(
        width: screenHeight * 0.5,
        child: TextField(
          onChanged: (text) {
            senhaCadastro = text;
          },
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3),
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: 'Senha do novo usuário',
          ),
        ),
      );
    }

    ButtonTheme buttonCreateNewUser() {
      return ButtonTheme(
        minWidth: screenHeight * 0.2,
        height: screenHeight * 0.1,
        child: ElevatedButton(
          onPressed: () {
            print(nomeCadastro);
            print(emailCadastro);
            print(senhaCadastro);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text(
            'Criar Usuário',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    CheckboxListTile checkboxStudent = CheckboxListTile(
      value: isStudentCheck,
      onChanged: (bool? value) {
        setState(() {
          isStudentCheck = value!;
          isProfessorCheck = false;
        });
      },
      title: const Text('Aluno'),
      subtitle:
          const Text('Caso o novo usuário seja um aluno, selecione essa opção'),
    );

    CheckboxListTile checkboxProfessor = CheckboxListTile(
      value: isProfessorCheck,
      onChanged: (bool? value) {
        setState(() {
          isProfessorCheck = value!;
          isStudentCheck = false;
        });
      },
      title: const Text('Professor'),
      subtitle: const Text(
          'Caso o novo usuário seja um professor, selecione essa opção'),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text("Cadastro",
                      style: titleStyle, textAlign: TextAlign.center)),
              SizedBox(height: screenHeight * 0.05),
              nameReturn(),
              SizedBox(height: screenHeight * 0.05),
              emailReturn(),
              SizedBox(height: screenHeight * 0.05),
              passwordReturn(),
              SizedBox(height: screenHeight * 0.05),
              checkboxProfessor,
              SizedBox(height: screenHeight * 0.05),
              checkboxStudent,
              SizedBox(height: screenHeight * 0.05),
              buttonCreateNewUser()
            ],
          ),
        ),
      ),
    );
  }
}
