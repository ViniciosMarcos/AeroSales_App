class Cliente {
  int? codigo;
  String? nome;
  String? fantasia;
  String? bloqueado;
  String? endereco;
  String? bairro;
  String? numero;
  String? cidade;
  String? cpf;
  String? telefone;

  Cliente({
    this.codigo,
    this.nome,
    this.fantasia,
    this.bloqueado,
    this.endereco,
    this.bairro,
    this.numero,
    this.cidade,
    this.cpf,
    this.telefone,
  });

  String formatterPhoneNumber() {
    String telefoneFormatado;
    //Remove todos os caracteres, se houver.
    if (telefone!.isNotEmpty) {
      telefoneFormatado = telefone!.replaceAll(RegExp(r'[^\d]'), '');

      //Fixo
      if (telefoneFormatado.length == 10) {
        return '(${telefoneFormatado.substring(0, 2)}) ${telefoneFormatado.substring(2, 6)}-${telefoneFormatado.substring(6)}';
      } else if (telefoneFormatado.length == 11) {
        //Celular
        return '(${telefoneFormatado.substring(0, 2)}) ${telefoneFormatado.substring(2, 3)} ${telefoneFormatado.substring(3, 7)}-${telefoneFormatado.substring(7)}';
      }
    } else {
      return telefoneFormatado = '';
    }
    return telefoneFormatado; // Não foi possível formatar, retorna o número original
  }

  String formatterCpfCpnj() {
    final cgcFormatado = cpf!.replaceAll(RegExp(r'[^\d]'), '');

    //cpf
    if (cgcFormatado.length <= 11) {
      return '${cgcFormatado.substring(0, 3)}.${cgcFormatado.substring(3, 6)}.${cgcFormatado.substring(6, 9)}-${cgcFormatado.substring(9, 11)}';
    } else {
      return '${cgcFormatado.substring(0, 2)}.${cgcFormatado.substring(2, 5)}.${cgcFormatado.substring(5, 8)}/${cgcFormatado.substring(8, 12)}-${cgcFormatado.substring(12, 14)}';
    }
  }
}
