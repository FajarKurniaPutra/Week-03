//import library
import 'dart:io';
import 'dart:math';

void main() {
  // Variabel random untuk generator angka
  var random = Random();
  // Variabel untuk menampung jumlah pemain
  int? jumlahPemain;

  print('=== Unlucky Roulette: Multiplayer Edition ===');

  // Perulangan untuk memvalidasi jumlah pemain (1-4)
  do {
    stdout.write('Masukkan jumlah pemain (1-4): ');
    // Membaca input dan mengubah ke integer
    jumlahPemain = int.tryParse(stdin.readLineSync() ?? '');

    // Cek jika input kosong atau di luar jangkauan 1-4
    if (jumlahPemain == null || jumlahPemain < 1 || jumlahPemain > 4) {
      print('Error: Pemain minimal 1 dan maksimal 4 orang!');
    }
  } while (jumlahPemain == null || jumlahPemain < 1 || jumlahPemain > 4);

  // Variabel sial untuk menampung angka random 1-10
  int sial = random.nextInt(10) + 1;
  // List untuk menampung angka yang sudah dipilih
  List<int> tebakanTerpakai = []; 

  // Perulangan untuk menjalankan giliran setiap pemain
  for (int i = 1; i <= jumlahPemain; i++) {
    int? tebakan;
    while (true) {
      print('\n--- Giliran Pemain $i ---');
      stdout.write('Pilih angka aman (1-10): ');
      tebakan = int.tryParse(stdin.readLineSync() ?? '');

      if (tebakan == null || tebakan < 1 || tebakan > 10) {
        print('Masukkan angka 1-10!');
      } else if (tebakanTerpakai.contains(tebakan)) {
        print('Angka $tebakan sudah diambil player lain! Pilih angka lain.');
      } else {
        // Simpan angka agar tidak bisa dipakai lagi
        tebakanTerpakai.add(tebakan); 
        break;
      }
    }

    // Kondisi mengecek apakah pemain terkena angka sial
    if (tebakan == sial) {
      print('Kamu terkena kutukan di angka $sial!');
      break; // Permainan berhenti jika ada yang kena
    } else {
      print('Pemain $i aman. Kutukan bukan di angka $tebakan.');
    }
  }
}