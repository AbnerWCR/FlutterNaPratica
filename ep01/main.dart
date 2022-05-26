//Objetivos:
//Criar uma lista de lembretes
//Adicionar e remover itens da lista

//Obs:
// [] - quando usa colchetes é a inicialização de uma lista;
// {} - quando usa chaves é a inicialização de um map ou array;
// final - define um valor imutável (em tempo de execução);
// const - define um valor imutável (em tempo de compilação);

final stickyNotes = <String>[];

void main() {
  print(stickyNotes);

  stickyNotes.add("today I watch the first ep");
  print(stickyNotes);

  stickyNotes.remove("today I watch the first ep");
  print(stickyNotes);
}

void addStickyNotes(String reminder) {
  stickyNotes.add(reminder);
}

