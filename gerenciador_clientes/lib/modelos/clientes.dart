import 'package:flutter/material.dart';

class Cliente {
  final String nome;
  final String email;
  final String senha;


Cliente({
   required this.nome,
   required this.email,
   required this.senha,
});

@override
String toString(){
  return 'Cliente: $nome, Email: $email';
}
}

class GerenciadorClientes{
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();

  GerenciadorClientes._interno();

  factory GerenciadorClientes() => _instancia;

  final List<Cliente> _clientes = [];

  List<Cliente> get clientes => List.unmodifiable(_clientes);

  bool cadastrar(Cliente cliente){
    if(_clientes.any((c) => c.email.toLowerCase() == cliente.email.toLowerCase())){
      print('Erro: email ${cliente.email} já cadastrado');
      return false;
    }
    _clientes.add(cliente);

    print('Novo cliente: ${cliente.nome}');
    return true;
  }

  Cliente ? login(String email, String senha){
    return _clientes.firstWhere(
      (c) => c.email.toLowerCase() == email.toLowerCase() && c.senha == senha,
      orElse: () => null as Cliente,
    );
  }
  }