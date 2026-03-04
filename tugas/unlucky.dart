import 'dart:io';
import 'dart:math';

void main() {
  // Variabel random untuk generator angka
  var random = Random();
  // Variabel untuk menampung jumlah pemain dan rentang angka
  int? jumlahPemain;
  int rentangAngka;

  print('=== Unlucky Roulette: Difficulty Edition ===');

  // Menampilkan menu pilihan tingkat kesulitan
  print('Pilih Tingkat Kesulitan:');
  print('1. Mudah (1-15)\n2. Normal (1-10)\n3. Hardcore (1-5)');
  stdout.write('Masukkan pilihan (1/2/3): ');
  String inputDiff = stdin.readLineSync() ?? '2';

  // Logika percabangan untuk menentukan rentang angka berdasarkan kesulitan
  if (inputDiff == '1') {
    rentangAngka = 15;
    print('Mode Mudah dipilih. Peluang selamat lebih besar!');
  } else if (inputDiff == '3') {
    rentangAngka = 5;
    print('Mode HARDCORE dipilih. Siapkan mentalmu!');
  } else {
    rentangAngka = 10;
    print('Mode Normal dipilih.');
  }

  // Validasi jumlah pemain maksimal 4 orang
  do {
    stdout.write('\nMasukkan jumlah pemain (1-4): ');
    jumlahPemain = int.tryParse(stdin.readLineSync() ?? '');
    if (jumlahPemain == null || jumlahPemain < 1 || jumlahPemain > 4) {
      print('Error: Pemain minimal 1 dan maksimal 4 orang!');
    }
  } while (jumlahPemain == null || jumlahPemain < 1 || jumlahPemain > 4);

  // Angka sial diacak berdasarkan rentangAngka yang sudah dipilih
  int sial = random.nextInt(rentangAngka) + 1;
  // List untuk mencatat angka yang sudah diambil pemain lain
  List<int> tebakanTerpakai = [];

  // Loop utama permainan berdasarkan jumlah pemain
  for (int i = 1; i <= jumlahPemain; i++) {
    int? tebakan;
    // Loop validasi agar tidak memilih angka yang sama
    while (true) {
      print('\n--- Giliran Pemain $i ---');
      stdout.write('Pilih angka aman (1-$rentangAngka): ');
      tebakan = int.tryParse(stdin.readLineSync() ?? '');

      if (tebakan == null || tebakan < 1 || tebakan > rentangAngka) {
        print('Masukkan angka yang valid (1-$rentangAngka)!');
      } else if (tebakanTerpakai.contains(tebakan)) {
        print('Angka $tebakan sudah diambil player lain! Pilih angka lain.');
      } else {
        // Simpan angka ke list riwayat
        tebakanTerpakai.add(tebakan);
        break;
      }
    }

    // Pengecekan hasil tebakan
    if (tebakan == sial) {
      print('BOOM! Pemain $i terkena kutukan di angka $sial!');
      break;
    } else {
      print('Pemain $i aman. Kutukan bukan di angka $tebakan.');
    }
  }
}