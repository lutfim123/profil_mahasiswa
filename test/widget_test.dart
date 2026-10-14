import 'package:flutter_test/flutter_test.dart';
import 'package:profil_mahasiswa/main.dart';

void main() {
  testWidgets('Profil Mahasiswa smoke test - renders all wireframe elements',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProfilMahasiswaApp());

    // 1. Memeriksa AppBar dengan judul "Profil Mahasiswa"
    expect(find.text('Profil Mahasiswa'), findsOneWidget);

    // 2. Memeriksa nama mahasiswa placeholder
    expect(find.text(kNamaMahasiswa), findsOneWidget);

    // 3. Memeriksa baris pada kartu identitas
    expect(find.text('NIM'), findsOneWidget);
    expect(find.text('Program Studi'), findsOneWidget);
    expect(find.text('Universitas'), findsOneWidget);
    expect(find.text('Hobi / Deskripsi Singkat'), findsOneWidget);

    // 4. Memeriksa kartu Informasi Tambahan
    expect(find.text(kJudulInfoTambahan), findsOneWidget);

    // 5. Memeriksa tombol "Detail"
    expect(find.text('Detail'), findsOneWidget);
  });
}
