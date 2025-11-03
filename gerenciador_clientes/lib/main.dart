import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 1. Importar o Firebase Core
import 'firebase_options.dart'; // (Gerado automaticamente pelo FlutterFire CLI)

// 2. Importar o MODELO (singular)
import 'package:gerenciador_clientes/modelos/cliente.dart'; A
// O 'GerenciadorClientes' (plural) foi substituído pelo 'ServicoClientes'
// que está dentro do arquivo 'cliente.dart', mas não precisamos dele aqui.

// 3. A função main() AGORA É ASYNC
Future<void> main() async {
  // 4. Garantir que os Widgets do Flutter foram inicializados
  WidgetsFlutterBinding.ensureInitialized();
  
  // 5. Inicializar o Firebase (aguarda a conexão ser estabelecida)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // O cadastro do "Admin" foi removido daqui.
  // Você deve fazê-lo usando a TelaCadastro do próprio app
  // ou manualmente no console do Firebase.

  runApp(const AplicativoClientes());
}

class AplicativoClientes extends StatelessWidget {
  const AplicativoClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Clientes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      // 6. A TELA INICIAL AGORA É A TELA DE LOGIN
      // O usuário hardcoded (dev@gmail.com) foi removido.
      home: const TelaLogin(),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  // Esta tela continua correta: ela DEVE receber o cliente que fez login.
  final Cliente cliente;

  const TelaPrincipal({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Principal'),
        // Adiciona um botão de "Sair"
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              // Volta para a Tela de Login e remove todas as telas anteriores
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TelaLogin()),
                (Route<dynamic> route) => false, // Impede o usuário de "voltar"
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Bem vindo, ${cliente.nome}!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------
// TELAS DE LOGIN E CADASTRO (ESBOÇOS)
// -----------------------------------------------------------------
// Você deve substituir estas pelas suas telas STATEFUL
// (Aquelas que já têm os TextFormFields e os botões)
// -----------------------------------------------------------------

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // AVISO: Este é apenas o esboço. 
    // Você deve usar aqui a sua TELA DE LOGIN STATEFUL (com o _fazerLogin)
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Aqui vai seu formulário de Login...'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Ir para Cadastro'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaCadastro()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});
  
  @override
  Widget build(BuildContext context) {
    // AVISO: Este é apenas o esboço. 
    // Você deve usar aqui a sua TELA DE CADASTRO STATEFUL
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: const Center(child: Text('Aqui vai seu formulário de Cadastro...')),
    );
  }
}