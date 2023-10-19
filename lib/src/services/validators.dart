String? loginValidator(String? seller) {
  if (seller == null || seller.isEmpty) {
    return 'Login inválido, verifique.';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Senha inválida, verifique.';
  }
  return null;
}
