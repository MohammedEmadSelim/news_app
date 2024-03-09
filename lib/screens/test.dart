void main(List<String> args) async {
  print('hello main');
  Future.delayed(Duration(seconds: 3), () => print('hello second 3'));
  await printFuture().then((value) => print(value));
  print('hallo after then ');
  Future.delayed(Duration(seconds: 2), () => print('hello second 2'));
  print('hey');
  Future.delayed(Duration(seconds: 1), () => print('hello second 1'));
}

Future<String> printFuture() {
  final value = Future.value('hello Future value');
  return value;
}
