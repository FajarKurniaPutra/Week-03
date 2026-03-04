// import library
import 'dart:io';
import 'dart:math';

void main() {
  // Variabel random untuk generator angka acak
  var random = Random();
  // Variabel untuk menampung jumlah pemain, rentang angka, dan angka sial
  int? jumlahPemain;
  int rentangAngka;
  int sial;
  
  // VARIABEL BARU: List untuk menyimpan status akhir setiap pemain untuk leaderboard
  List<String> leaderboard = [];
  // List untuk mencatat angka yang sudah diambil agar tidak dipilih ulang
  List<int> tebakanTerpakai = [];

  print('=== UNLUCKY ROULETTE: THE FINAL TOURNAMENT ===');

  // 1. FITUR DIFFICULTY: Memilih tingkat kesulitan
  print('\nPilih Tingkat Kesulitan:');
  print('1. Mudah (1-15)\n2. Normal (1-10)\n3. Hardcore (1-5)');
  stdout.write('Masukkan pilihan (1/2/3): ');
  String inputDiff = stdin.readLineSync() ?? '2';

  // Menentukan rentang angka berdasarkan input user
  if (inputDiff == '1') {
    rentangAngka = 15;
    print('>> Mode Mudah: Peluang selamat lebih besar.');
  } else if (inputDiff == '3') {
    rentangAngka = 5;
    print('>> Mode HARDCORE: Sangat berbahaya!');
  } else {
    rentangAngka = 10;
    print('>> Mode Normal.');
  }

  // 2. VALIDASI PEMAIN: Memastikan jumlah pemain adalah 1-4 orang
  do {
    stdout.write('\nMasukkan jumlah pemain (1-4): ');
    jumlahPemain = int.tryParse(stdin.readLineSync() ?? '');
    if (jumlahPemain == null || jumlahPemain < 1 || jumlahPemain > 4) {
      print('Error: Input tidak valid! Gunakan angka 1 sampai 4.');
    }
  } while (jumlahPemain == null || jumlahPemain < 1 || jumlahPemain > 4);

  // Mengacak angka sial sesuai dengan rentang kesulitan yang dipilih
  sial = random.nextInt(rentangAngka) + 1;

  // 3. LOOP UTAMA PERMAINAN
  for (int i = 1; i <= jumlahPemain; i++) {
    int? tebakan;

    // Loop validasi input tebakan (Cek validasi & Duplikat)
    while (true) {
      print('\n--- Giliran Pemain $i ---');
      stdout.write('Pilih angka aman (1-$rentangAngka): ');
      tebakan = int.tryParse(stdin.readLineSync() ?? '');

      // Cek apakah input valid (angka dan sesuai rentang)
      if (tebakan == null || tebakan < 1 || tebakan > rentangAngka) {
        print('Masukkan angka yang benar (1-$rentangAngka)!');
      } 
      // Cek fitur No Duplicate: apakah angka sudah pernah diambil
      else if (tebakanTerpakai.contains(tebakan)) {
        print('Angka $tebakan sudah diambil player lain! Cari angka lain.');
      } 
      else {
        // Simpan angka ke list agar tidak bisa dipakai pemain selanjutnya
        tebakanTerpakai.add(tebakan);
        break; // Keluar dari loop validasi input
      }
    }

    // 4. LOGIKA PENGECEKAN & LEADERBOARD
    if (tebakan == sial) {
      print('BOOM! Pemain $i terkena kutukan di angka $sial!');
      // Tambahkan status ELIMINASI ke catatan leaderboard
      leaderboard.add('Pemain $i: TERELIMINASI 💀');

      // Jika ada pemain yang kalah, pemain setelahnya dianggap tidak sempat main
      for (int j = i + 1; j <= jumlahPemain; j++) {
        leaderboard.add('Pemain $j: Belum Sempat Main ⏩');
      }
      break; // Hentikan seluruh permainan karena sudah ada yang kalah
    } else {
      print('Pemain $i selamat! Angka $tebakan aman.');
      // Tambahkan status SELAMAT ke catatan leaderboard
      leaderboard.add('Pemain $i: SURVIVOR 🛡️');
    }
  }

  // 5. PENUTUP & MENAMPILKAN LEADERBOARD
  print('\n' + '='*40);
  print('        RINGKASAN HASIL PERMAINAN');
  print('='*40);
  
  // Melakukan perulangan untuk mencetak isi list leaderboard satu per satu
  for (var baris in leaderboard) {
    print('  $baris');
  }

  print('----------------------------------------');
  print('Angka kutukan yang harus dihindari: $sial');
  print('='*40);
  print('   Terima kasih sudah bertahan hidup!');
}