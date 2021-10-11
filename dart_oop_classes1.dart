void main() {
  // var bob = User(); // создаем обьект класса 'User'
  // bob.name = 'Bob'; // Присваиваем полю 'name' значение 'Bob'

  // Создать обьект класса и задать его полям значения можно одной строчкой, через оператор '..'
  // var bob = User()..age = 40 ..name = 'Bob'..isHappy = true ..hobbies = ['Basketball', 'Skate'];

  // при работе с конструктором создавая обьект класса сразу передаем для него значение полей
  var bob = User('Bob', 40, true, ['Basketball', 'Skate']);
  bob.info();

  var alex = User('Alex', 25, false, ['Football', 'Dance']);
  alex.info();
}

// Создаем класс 'User'
class User {
  late String name;
  late int age;
  late bool isHappy;
  late List<String> hobbies;
  // ключевое слово (модификатор) 'late', говорит о том что перменная(поле) будет проинициализированна позже
  // можно использовать и просто var и dynamic
  // но общепринято полям класса сразу задавать тип

  // Конструктор
  // в конструктор надо передавать значения полей
  // поля до квадратных скобок ('name', 'age') - являются обязательными
  // значения полям в скобках ([isHappy, hobbies]) передавать не обязательно
  User(name, age, [isHappy, hobbies]) {
    this.name = name;
    this.age = age;
    this.isHappy = isHappy;
    this.hobbies = hobbies;
    // когда одинаковые имена у переменных конструктора и полей класса то,
    // надо использовать ключевое слово 'this' которое и указывает что это поле класса
    // которому присваевается значение переменной из конструктора.
  }

  // функция выводящая информацию
  void info() {
    var happy = isHappy ? 'Happy' : 'Unhappy';
    print(
        'User $name is $age years old. \nHe is $happy. \nHis hobbies: $hobbies');
    print(' ');
  }
}
