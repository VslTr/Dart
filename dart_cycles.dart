// ЦЫКЛЫ

//import 'dart:indexed_db';

void main() {
  //myFor();
  myForEach();
  //myWhile();
  //myDoWhile();
}

void myFor() {
  // For
  // Первый вариант
  var list1 = [10, 20, 30, 40, 50];
  // for (var i = 0; i < list1.length; i++) {
  //   print('For Element: ${list1[i]}');
  //   list1[i]++; // увеличеваем на 1 элемент по индексу 'i'
  //   print(list1[i]);
  // }

  // Второй вариант
  for (var i in list1) {
    print('For El-t: $i');
    list1[list1.indexOf(i)]++;
    // так как тут берем сам элемент, а не его индекс, то для его изменения сначла узнаем его индекс 'list1.indexOf(i)'
    // потом к этому элементу по индексу применяем инкремент
  }
  print(list1);
}

void myForEach() {
  var list2 = [10, 20, 30, 40, 50];
  list2.forEach((i) {
    print(i); // выводим элемент
    list2[list2.indexOf(i)]++; // добавлеем к каждому элементу +1
  });
  print(list2);
  print('');
  // или если необходимо просто вывести все элементы, можно использовать стрелочную ф-ию в одну строку
  list2.forEach((i) => print('Index: ${list2.indexOf(i)} Value: $i'));
}

void myWhile() {
  var list3 = [10, 20, 30, 40, 50];
  var i = 0;
  while (i < list3.length) {
    print('While Element: ${list3[i]}');
    list3[i]++;
    i++;
  }
  print(list3);
}

void myDoWhile() {
  var list4 = [10, 20, 30, 40, 50];
  var i = 0;
  do {
    print('DoWhile Element: ${list4[i]}');
    list4[i]++;
    i++;
  } while (i < list4.length);
  print(list4);
}
