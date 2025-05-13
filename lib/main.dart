// Flutter App: Controle de Acesso com foco em programação e design
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    ),
  );
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 72,
                      color: const Color.fromARGB(255, 92, 230, 92),
                    ),
                    Transform.rotate(
                      angle: 5.497787, // 315 graus em radianos
                      child: Icon(Icons.vpn_key, size: 35, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Text(
                  'GUARDIÃO',
                  style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _UserTypeIcon(label: 'Morador'),
                _UserTypeIcon(label: 'Portaria'),
                _UserTypeIcon(label: 'Admin'),
              ],
            ),
            SizedBox(height: 32),
            TextField(decoration: InputDecoration(hintText: 'Email')),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Senha'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegistrosPage()),
                );
              },
              child: Text('Entrar'),
            ),
            SizedBox(height: 16),
            Text(
              'Esqueceu a senha?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserTypeIcon extends StatelessWidget {
  final String label;
  const _UserTypeIcon({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[800],
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
      ],
    );
  }
}

class RegistrosPage extends StatelessWidget {
  final List<Map<String, String>> registros = [
    {'nome': 'Pedro Almeida', 'placa': 'ABC-1234'},
    {'nome': 'Ricardo Santos', 'placa': 'ABC-1234'},
    {'nome': 'Prestador de serviço', 'placa': 'Casa 15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Registros'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('+ Novo Registro'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: registros.length,
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final registro = registros[index];
                  return Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[700],
                          radius: 24,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              registro['nome']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              registro['placa']!,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
