import 'dart:io';

void main() {
  File file = new File('dec.txt');
  // ignore: unused_local_variable
  List<String> lines = file.readAsLinesSync();
}
