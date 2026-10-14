import 'package:flutter/material.dart';

// ============================================================================
// 1. DATA IDENTITAS MAHASISWA
// Semua data identitas diletakkan di satu tempat agar mudah dikelola & diganti.
// ============================================================================
const String kNamaMahasiswa = "Muhammad Lutfi Maulana";
const String kNim = "2495114039";
const String kProgramStudi = "Teknik Informatika";
const String kUniversitas = "Universitas Hasyim Asy’ari";
const String kHobiDeskripsi =
    "Membaca / Gemar membaca untuk memperkaya sudut pandang, mengasah imajinasi, dan terus bertumbuh";

// Data Informasi Tambahan
const String kJudulInfoTambahan = "Informasi Tambahan";
const String kDeskripsiInfoTambahan =
    "Mahasiswa Teknik Informatika yang gemar membaca dan sedang mempelajari Flutter pada mata kuliah Pemrograman Mobile.";

// ============================================================================
// 2. KONSTANTA DESAIN & TEMA VISUAL (DESIGN SYSTEM)
// Kumpulan nilai desain (warna, jarak, radius) agar rapi, seragam, & mudah diubah.
// ============================================================================
class AppColors {
  // Palet Warna Utama & Pendamping (Satu Identitas Visual)
  static const Color primary = Color(0xFF1E3A8A); // Deep Indigo
  static const Color primaryGradientDark = Color(0xFF172554); // Dark Navy untuk gradasi AppBar
  static const Color secondary = Color(0xFF0EA5E9); // Sky Cyan untuk gradasi placeholder
  static const Color background = Color(0xFFF8FAFC); // Latar belakang netral lembut (Slate Light)
  static const Color surface = Color(0xFFFFFFFF); // Permukaan kartu (Pure White)
  static const Color textPrimary = Color(0xFF0F172A); // Teks utama (Slate 900)
  static const Color textSecondary = Color(0xFF475569); // Teks sekunder/label (Slate 600)
  static const Color border = Color(0xFFE2E8F0); // Garis batas kartu halus (Slate 200)
  static const Color iconColor = Color(0xFF2563EB); // Warna ikon identitas seragam
  static const Color placeholderBg = Color(0xFFF1F5F9); // Latar avatar & kontainer ikon (Slate 100)
  static const Color shadow = Color(0x0A0F172A); // Bayangan lembut kartu
}

class AppSpacing {
  // Skala Jarak Teratur (Kelipatan 4 & 8)
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
}

class AppRadius {
  // Skala Radius Sudut Seragam
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
}

// ============================================================================
// 3. MAIN ENTRY POINT & APP ROOT
// ============================================================================
void main() {
  runApp(const ProfilMahasiswaApp());
}

class ProfilMahasiswaApp extends StatelessWidget {
  const ProfilMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
      ),
      home: const ProfilMahasiswaPage(),
    );
  }
}

// ============================================================================
// 4. HALAMAN UTAMA PROFIL MAHASISWA
// Mengikuti 100% struktur dan urutan elemen pada wireframe:
// 1. AppBar ("Profil Mahasiswa", menu di kiri, tiga titik di kanan)
// 2. Foto profil lingkaran
// 3. Teks "Nama Mahasiswa" di bawah foto
// 4. Kartu identitas (4 baris: NIM, Program Studi, Universitas, Hobi / Deskripsi Singkat)
// 5. Kartu "Informasi Tambahan" (placeholder gambar di kiri, teks di kanan)
// 6. Tombol "Detail" di bagian bawah
// ============================================================================
class ProfilMahasiswaPage extends StatelessWidget {
  const ProfilMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: Kerangka dasar halaman antarmuka
    return Scaffold(
      backgroundColor: AppColors.background,
      // 1. AppBar: Judul, ikon menu di kiri, ikon tiga titik di kanan dengan gradasi tema
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        shadowColor: AppColors.primary.withValues(alpha: 0.25),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            tooltip: 'Opsi Lainnya',
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          // Container dengan dekorasi gradasi warna pada header/AppBar
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryGradientDark, AppColors.primary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      // Body: SafeArea & SingleChildScrollView untuk responsivitas layout
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xxl,
          ),
          // Column: Menyusun komponen secara vertikal sesuai urutan wireframe
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 2. Foto profil berbentuk lingkaran dengan bingkai dan bayangan halus
              _buildProfilePicture(),

              const SizedBox(height: AppSpacing.md),

              // 3. Teks "Nama Mahasiswa" di bawah foto profil
              const Text(
                kNamaMahasiswa,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // 4. Kartu identitas (NIM, Program Studi, Universitas, Hobi / Deskripsi Singkat)
              _buildIdentityCard(),

              const SizedBox(height: AppSpacing.lg),

              // 5. Kartu "Informasi Tambahan" (placeholder gambar di kiri, judul & teks di kanan)
              _buildAdditionalInfoCard(),

              const SizedBox(height: AppSpacing.xxl),

              // 6. Tombol "Detail" di bagian bawah (tidak membuka halaman baru)
              _buildDetailButton(),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // WIDGET HELPER: FUNGSI KARTU SERAGAM (Menghapus Duplikasi Kode)
  // Tepi kartu sejajar dengan tombol Detail (margin nol), isi kartu putih bersih
  // ==========================================================================
  Widget _buildCard({required Widget child}) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: const BorderSide(color: AppColors.border),
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  // ==========================================================================
  // WIDGET HELPER: 2. FOTO PROFIL LINGKARAN
  // ==========================================================================
  Widget _buildProfilePicture() {
    return Container(
      // Container dengan dekorasi lingkaran, border putih tebal, dan bayangan lembut
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const CircleAvatar(
        radius: 54,
        backgroundColor: AppColors.placeholderBg,
        backgroundImage: AssetImage('assets/foto_profil.dat'),
      ),
    );
  }

  // ==========================================================================
  // WIDGET HELPER: 4. KARTU IDENTITAS MAHASISWA
  // ==========================================================================
  Widget _buildIdentityCard() {
    return _buildCard(
      // Column untuk menyusun 4 baris data identitas
      child: Column(
        children: [
          _buildIdentityRow(
            icon: Icons.badge_outlined,
            label: 'NIM',
            value: kNim,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildIdentityRow(
            icon: Icons.school_outlined,
            label: 'Program Studi',
            value: kProgramStudi,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildIdentityRow(
            icon: Icons.account_balance_outlined,
            label: 'Universitas',
            value: kUniversitas,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildIdentityRow(
            icon: Icons.menu_book_outlined,
            label: 'Hobi / Deskripsi Singkat',
            value: kHobiDeskripsi,
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // WIDGET HELPER: BARIS IDENTITAS (Row: Ikon, Label, Titik Dua, Nilai)
  // ==========================================================================
  Widget _buildIdentityRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    // Row: Menyusun informasi secara horizontal dalam format "label : nilai"
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ikon kecil dengan warna dan gaya seragam di setiap baris
        Container(
          padding: const EdgeInsets.all(AppSpacing.xs),
          decoration: BoxDecoration(
            color: AppColors.placeholderBg,
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppColors.iconColor,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        // Label teks dengan lebar tetap 120 agar tanda titik dua (colon) sejajar rapi
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        // Tanda pemisah titik dua
        const Text(
          ': ',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        // Nilai identitas mahasiswa
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================================
  // WIDGET HELPER: 5. KARTU INFORMASI TAMBAHAN
  // ==========================================================================
  Widget _buildAdditionalInfoCard() {
    return _buildCard(
      // Row: Menyusun placeholder gambar di kiri dan teks di kanan
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar placeholder kotak 72x72 dengan gradasi tema dan ikon kode putih
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Center(
              child: Icon(
                Icons.code_rounded,
                size: 36,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          // Judul dan teks penjelasan di sisi kanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  kJudulInfoTambahan,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  kDeskripsiInfoTambahan,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // WIDGET HELPER: 6. TOMBOL "DETAIL" DI BAGIAN BAWAH
  // ==========================================================================
  Widget _buildDetailButton() {
    // Tombol "Detail" dengan gaya selaras tema, tidak membuka halaman baru
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // Aksi tombol tidak membuka halaman baru karena tidak diminta pada LKP
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: AppColors.primary.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
        child: const Text(
          'Detail',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
