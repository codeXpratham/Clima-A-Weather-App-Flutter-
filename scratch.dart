import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  print(task2());
  // task3( task2data);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {

  Duration threesec = Duration(seconds: 3);
  // sleep(threesec);
  String result;
  await Future.delayed(threesec, (){
    print('Task 2 complete');
     result = 'task 2 data';
  });
  return result;
}

void task3(String task2data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2data');
}