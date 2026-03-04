void main() {
  int angka = 7;

  if (angka <= 5) {
    // Format sederhana untuk angka kecil
    for (int i = 1; i <= 10; i++) {
      print('$angka x $i = ${angka * i}');
    }
  } else {
    // Format tabel untuk angka besar
    print('Tabel perkalian $angka:');
    print('-------------------');

    for (int i = 1; i <= 10; i++) {
      int hasilKali = angka * i;
      String hasil = '$angka x $i = $hasilKali';

      // Tambahkan highlight untuk hasil genap
      if (hasilKali % 2 == 0) {
        print('$hasil (genap)');
      } else {
        print(hasil);
      }
    }
  }
}