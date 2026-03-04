//import library
import 'dart:io';
import 'dart:math';

void main() {
//variabel random untuk memakai generator angka random
  var random = Random();
  //variabel sial untuk menampung angka random
  int sial = random.nextInt(10) + 1; 

//Tampilkan teks pada terminal
  print('=== Unlucky Roulette ===');
  stdout.write('Pilih angka aman (1-10): ');
  //variabel tebakan untuk menampung angka yang diinput
  int tebakan = int.parse(stdin.readLineSync()!);

//Kondisi untuk mengecek tebakan
  if (tebakan == sial) {
    print('BOOM! Kamu terkena kutukan di angka $sial!');
  } else {
    print('HORE! Kamu beruntung. Kutukan ada di angka $sial.');
  }
}