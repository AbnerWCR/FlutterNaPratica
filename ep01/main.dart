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

  addReminder("EP 01");
  removeReminder("EP 01");
  
  print(stickyNotes);
}

void addReminder(String reminder) {
  stickyNotes.add(reminder);
}

void removeReminder(String reminder) {
  stickyNotes.remove(reminder);
}

