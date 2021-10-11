// ФУНКЦИИ

void main(List<String> args) {
  // fn1();
  // fn2(20, 30);

  // вызов fn22 с обязательными именованными параметрами
  print(fn22(par_a: 'cash', par_b: 10));

  // передаем в fn23 по позиции 2 элемента, без необязательного элемента
  print(fn23('Alex', 'Hi'));
  // передаем в fn23 все элементы по позиции
  print(fn23('Bob', 'Hello!!', 5));

  // var _fn3_ = fn3(100, 200); // функция 'fn3' возврашает '300'
  // print('fn3: $_fn3_');

  // var _fn41_ =
  //     fn4('Hello', 'World'); // ф-я 'fn4' возврашает 'HelloWorld'-строку
  // print('fn4 _1: $_fn41_');
  // var _fn42_ = fn4(111, 333); // ф-я 'fn4' возврашает '444'-число
  // print('fn4 _2: $_fn42_');
}

// void функция ни чего не принимает и не возвращает
void fn1() {
  var a = 5, b = 10;
  print('fn1: ${a + b}');
}

// void функция принимает 2-а значения, можно указать тип (void sum_fn2(int a, duble b) {})
void fn2(a, b) {
  print('fn2: ${a + b}');
}

// Функция принимает ИМЕНОВАННЫЕ ПАРАМЕТРЫ, указваются в фигурных скобках
// т.к Dart не допускает null значений нужно либо указать через спец слово "required" обязательность передачи параметров
// или задать им базовые значения, например String fn22({String parameter_a = 'csc', int parameter_b = 10}) {
String fn22({required String par_a, required int par_b}) {
  return '$par_a - ${par_b + 10}';
}

// Функция принимает ПОЗИЦИОННЫЕ ПАРАМЕТРЫ, т.е параметры должны передаватся в строгой последовательности
// не обязательные параметры указываются в конце в квадратных скобках
String fn23(String name, String msg, [int number = 0]) {
  var result = '$name пишет $msg';

  if (number != 0) {
    result = '$result сообщение № $number';
  }
  return result;
}

// Функция возвращает данные типа 'int'
/*
int fn3(a, b) {} - возвращает данные типа 'int'
int fn3(a, b) {
  return a + b;
}
*/
// если метод содержит только одну строку (return) реализуем его через '=>'
int fn3(a, b) => a + b;

// Функция 'dynamic' может возвращать разные типы данных
dynamic fn4(c, d) => c + d;