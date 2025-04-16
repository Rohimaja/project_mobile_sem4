import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/account/profil.dart'; // Import halaman profil

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardContent(), // Halaman Dashboard
    ProfilPage(), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]), // Hindari tertutup notch
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/template_dashboard.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildCategories(),
          const SizedBox(height: 24),
          Expanded(child: _buildScheduleList()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/foto_izzul.jpg'),
            radius: 24,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Izzul Islam Ramadhan',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'E4123125',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    List<CategoryItem> categories = [
      CategoryItem("Presensi", Icons.check_circle, Colors.green),
      CategoryItem("Materi", Icons.book, Colors.blue),
      CategoryItem("Zoom", Icons.video_call, Colors.purple),
      CategoryItem("Jadwal", Icons.schedule, Colors.orange),
    ];

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CategoryCard(categories[index]),
          );
        },
      ),
    );
  }

  Widget _buildScheduleList() {
    List<ScheduleItem> schedules = [
      ScheduleItem(
        time: '07.00 - 09.00 WIB',
        title: 'Pemrograman Dasar',
        duration: '2 Jam',
        platform: 'Zoom',
        status: 'Lihat Jadwal',
      ),
      ScheduleItem(
        time: '10.00 - 12.00 WIB',
        title: 'Struktur Data',
        duration: '2 Jam',
        platform: 'Google Meet',
        status: 'Lihat Jadwal',
      ),
      ScheduleItem(
        time: '13.00 - 17.00 WIB',
        title: 'Workshop Mobile',
        duration: '4 Jam',
        platform: 'Zoom Meeting',
        status: 'Lihat Jadwal',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        return ScheduleCard(schedules[index]);
      },
    );
  }
}

// Widget untuk kategori
class CategoryItem {
  final String title;
  final IconData icon;
  final Color color;

  CategoryItem(this.title, this.icon, this.color);
}

class CategoryCard extends StatelessWidget {
  final CategoryItem category;
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: category.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(category.icon, color: category.color, size: 32),
          const SizedBox(height: 8),
          Text(category.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Widget untuk jadwal
class ScheduleItem {
  final String time;
  final String title;
  final String duration;
  final String platform;
  final String status;

  ScheduleItem({
    required this.time,
    required this.title,
    required this.duration,
    required this.platform,
    required this.status,
  });
}

class ScheduleCard extends StatelessWidget {
  final ScheduleItem schedule;
  const ScheduleCard(this.schedule, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris pertama: Waktu & Tombol "Lihat Jadwal"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                schedule.time,
                style: const TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Tambahkan navigasi atau aksi ketika tombol ditekan
                },
                child: Text(
                  schedule.status,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Kolom baru dengan informasi tambahan
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                schedule.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text("Durasi: ${schedule.duration}"),
              Text("Platform: ${schedule.platform}"),
            ],
          ),
        ],
      ),
    );
  }
}
