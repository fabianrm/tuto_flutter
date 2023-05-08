void main() {
  final String myName = 'Fabián';
  print('Hola $myName');
  print('Hola ${myName.toLowerCase()}');
  print(sumar(3, 5));
  print('Sumando => ${3 + 3}');
}

int sumar(int n1, int n2) {
  return n1 + n2;
}
