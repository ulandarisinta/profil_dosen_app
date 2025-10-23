import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilDosenApp());
}

class ProfilDosenApp extends StatelessWidget {
  const ProfilDosenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Dosen App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const DaftarDosenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// MODEL DATA DOSEN
class Dosen {
  final String nama;
  final String nip;
  final String jabatan;
  final String email;
  final String foto;
  final String deskripsi;

  Dosen({
    required this.nama,
    required this.nip,
    required this.jabatan,
    required this.email,
    required this.foto,
    required this.deskripsi,
  });
}

// DATA DOSEN CONTOH
final List<Dosen> daftarDosen = [
  Dosen(
    nama: 'zainal abdullah, S.Hum., M.Si',
    nip: '19870510 201502 1 001',
    jabatan: 'Dosen Pemrograman Mobile',
    email: 'zainal.abdullah@kampus.ac.id',
    foto: 'https://i.pravatar.cc/150?img=12',
    deskripsi:
        'Beliau mengajar mata kuliah Pemrograman Mobile dan memiliki pengalaman panjang dalam pengembangan aplikasi berbasis Flutter dan Android.',
  ),
  Dosen(
    nama: 'dewi saraswati, M.Kom',
    nip: '19900102 201701 2 002',
    jabatan: 'Dosen Sistem Informasi',
    email: 'dewi.saraswati@kampus.ac.id',
    foto: 'https://i.pravatar.cc/150?img=48',
    deskripsi:
        'Aktif meneliti bidang sistem informasi pendidikan dan pengembangan website akademik berbasis PHP dan Laravel.',
  ),
  Dosen(
    nama: 'Muchlis Rahman, M.T',
    nip: '19851210 201403 1 003',
    jabatan: 'Dosen Basis Data',
    email: 'muchlis.rahman@kampus.ac.id',
    foto: 'https://i.pravatar.cc/150?img=33',
    deskripsi:
        'Fokus pada penelitian database management system dan data warehouse untuk institusi pendidikan.',
  ),
];

/// ---------------- HALAMAN 1 ----------------
class DaftarDosenPage extends StatelessWidget {
  const DaftarDosenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Dosen'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: daftarDosen.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final dosen = daftarDosen[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(dosen.foto),
              ),
              title: Text(
                dosen.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(dosen.jabatan),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.indigo),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDosenPage(dosen: dosen),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// ---------------- HALAMAN 2 ----------------
class DetailDosenPage extends StatelessWidget {
  final Dosen dosen;
  const DetailDosenPage({super.key, required this.dosen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dosen.nama),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                dosen.foto,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              dosen.nama,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              dosen.jabatan,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 30, thickness: 1.2),
            ListTile(
              leading: const Icon(Icons.badge, color: Colors.indigo),
              title: Text('NIP: ${dosen.nip}'),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.indigo),
              title: Text('Email: ${dosen.email}'),
            ),
            const SizedBox(height: 10),
            Text(
              dosen.deskripsi,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
