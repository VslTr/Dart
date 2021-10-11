class Vehicle {
  // класс может содержать поля
  late String manufacturer;
  late double fuelCapaciti;
  late double fuelRemaining;

  // класс может содержать методы (функции)
  String showInfo() =>
      '$manufacturer: $fuelRemaining of $fuelCapaciti (critical: $criticalFuelLevel)';

  // класс может содержать (сетеры и гетеры) 'set', 'get'
  // гетер 'criticalFuelLevel' возвращает критический уровень топлива (10% от fuelRemaining)
  double get criticalFuelLevel => fuelCapaciti * 0.1;
  // сетер 'newFuelRemaining' изменяет (устанавливает) уровень топлива
  set newFuelRemaining(double val) => fuelRemaining = val;

//--------- КОНСТРУКТОРЫ (при необходимости из одного конструктора можно вызвать другой) -----------------------
  //~~~~~~~~~~~ default constructor (не именнованый конструктор, может быть только один) ~~~~~~~~~~~~~~~~~~~~~~~
  Vehicle(this.manufacturer, this.fuelCapaciti, this.fuelRemaining);
  // ^^ в Dart можно обьявлять в конструкторе переменные
  // ^^ и сразу инициализировать ими поля класса через ключевое слово 'this'

  //~~~~~~~~~~ named constructor (именнованый конструктор, может быть сколько угодно)~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // конструктор 'fromMap' принимает мапу у которой ключ и значение - строка
  Vehicle.fromMap(Map<String, String> map) {
    // manufacturer = map['manufacturer']!; // можно так если уверенны что не получим 'Null', или если это не важно
    var tmp = map['manufacturer'];
    // ^^ значение для 'tmp' берем из мапы по ключу 'manufacturer'

    // тернарный оператор '??' оператор 'Null' проверки (Null Coalescing operator)
    // Если tmp == 'Null', то manufacturer = 'Name Null Error', иначе manufacturer = tmp
    manufacturer = tmp ?? 'Name Null Error'; //эквивалентно записи ниже
    // if (tmp != null) {
    //   manufacturer = tmp;
    // } else {
    //   manufacturer = 'Name Null Error';
    // }
    // если в мапе не будет ключа 'manufacturer' мы получим 'Null',
    // проверка выведет в место имени производителя 'Name Null Error'
    // => Name Null Error: 5.0 of 55.0 (critical: 5.5)

    fuelCapaciti = double.parse(map['fuelCapaciti']!);
    // ^^ так как поле 'fuelCapaciti' имеет тип 'double', а у мапы значение строка,
    // ^^ то используем статический метод 'parse' для того чтобы распарсить и преобразовать
    fuelRemaining = double.parse(map['fuelRemaining']!);
    // Так как в переменную коструктора может прийти значение 'Null', метод 'parse' получив 'Null' вызовет ошибку
    // В Dart 3 есть функция Added Called Null Safety, которая используется для гарантии того, что ввод не будет нулевым
    // если мы уверенны что 'Null' не будет передан можно просто добавить '!' (bang operator (!))
    // иначе стоит выполнять проверку как с переменной конструктора 'manufacturer'
  }

  // ~~~~~~~~~~~~~~~~~~~~~ INITIALIZER LIST ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Коструктор можно использовать с листом инициализации (через ":")
  // Так как Initializer List инициализируется первым, такую конструкцию
  // можно пременять когда некоторые переменные надо инициализировать сразу, первыми
  // здесь в примере поля 'manufacturer' и 'fuelCapaciti' инициализируются первыми в Initializer List
  // поле 'fuelRemaining' последним в теле конструктора
  Vehicle.fromMap2(Map<String, String> map)
      : manufacturer = map['manufacturer']!,
        fuelCapaciti = double.parse(map['fuelCapaciti']!) {
    fuelRemaining = double.parse(map['fuelRemaining']!);
  }
}

void main() {
  var vehicle = Vehicle('BMW', 60, 30); // создаем экземляр класса
  // ..manufacturer = 'BMW' // если без конструктора то устанавливаем значение полей так
  // ..fuelCapaciti = 60
  // ..fuelRemaining = 30;

  // при помощи сетера 'newFuelRemaining' устанавливаем новое значение уровня топлива 'fuelRemaining'
  vehicle.newFuelRemaining = 20;

  var vehicle2 = Vehicle.fromMap(
      {'manufacturer': 'KIA', 'fuelCapaciti': '55', 'fuelRemaining': '5'});

  var vehicle3 = Vehicle.fromMap2(
      {'manufacturer': 'LADA', 'fuelCapaciti': '40', 'fuelRemaining': '0'});

  print(vehicle.showInfo()); // => BMW: 20.0 of 60.0 (critical: 6.0)
  print(vehicle2.showInfo()); // => KIA: 5.0 of 55.0 (critical: 5.5)
  print(vehicle3.showInfo()); // => LADA: 0.0 of 40.0 (critical: 4.0)
}
