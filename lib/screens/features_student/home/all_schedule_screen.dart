import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/models/allSchedule_model.dart';
import 'package:stipres/screens/features_student/widgets/cards/allSchedule_card.dart';
import 'package:stipres/styles/constant.dart';

class AllScheduleScreen extends StatefulWidget {
  const AllScheduleScreen({super.key});

  @override
  State<AllScheduleScreen> createState() => _AllScheduleScreenState();
}

class _AllScheduleScreenState extends State<AllScheduleScreen>
    with SingleTickerProviderStateMixin {
  late double height, width;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  final List<AllScheduleModel> JadwalSemester = [
    AllScheduleModel(
      day: 'Senin',
      waktu: '08:00 - 10:00',
      mataKuliah: 'Matematika Dasar',
      lokasi: 'Ruang 101',
      durasi: '2 Jam',
    ),
    AllScheduleModel(
      day: 'Senin',
      waktu: '08:00 - 10:00',
      mataKuliah: 'Logika Algoritma',
      lokasi: 'Ruang 101',
      durasi: '2 Jam',
    ),
    AllScheduleModel(
      day: 'Selasa',
      waktu: '08:00 - 10:00',
      mataKuliah: 'Pemrograman Dasar',
      lokasi: 'Ruang 101',
      durasi: '2 Jam',
    ),
    AllScheduleModel(
      day: 'Rabu',
      waktu: '08:00 - 10:00',
      mataKuliah: 'Basis Data',
      lokasi: 'Ruang 101',
      durasi: '2 Jam',
    ),
    AllScheduleModel(
      day: 'Jumat',
      waktu: '08:00 - 10:00',
      mataKuliah: 'Kewirausahaan',
      lokasi: 'Ruang 101',
      durasi: '2 Jam',
    ),
    AllScheduleModel(
      day: 'Jumat',
      waktu: '08:00 - 10:00',
      mataKuliah: 'Agama',
      lokasi: 'Ruang 101',
      durasi: '2 Jam',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // Rebuild saat teks berubah
    });

    // Setup animation controller untuk fade-in/fade-out
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    final filteredSchedule = JadwalSemester.where((jadwal) {
      final query = _searchController.text.toLowerCase();
      return jadwal.mataKuliah.toLowerCase().contains(query);
    }).toList();

    Map<String, List<AllScheduleModel>> jadwalPerHari = {};
    for (var jadwal in filteredSchedule) {
      jadwalPerHari.putIfAbsent(jadwal.day, () => []).add(jadwal);
    }

    final List<String> daysOfWeek = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];

    final query = _searchController.text.toLowerCase();

    final filteredDays = daysOfWeek.where((day) {
      final jadwals = jadwalPerHari[day] ?? [];
      if (query.isEmpty)
        return true; // Kalau tidak mencari, tampilkan semua hari
      return jadwals
          .any((jadwal) => jadwal.mataKuliah.toLowerCase().contains(query));
    }).toList();

    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // HEADER
                  Container(
                    width: width,
                    height: 80,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('images/bgheader.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(100),
                            customBorder: const CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'icons/ic_back.png',
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _isSearching
                                ? FadeTransition(
                                    opacity: _animation,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        width: width * 0.70,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextField(
                                            controller: _searchController,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              hintText: 'Cari mata kuliah...',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[600]),
                                              border: InputBorder.none,
                                            ),
                                            autofocus: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Jadwal Perkuliahan Semester Ini",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          shape: const CircleBorder(),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isSearching = !_isSearching;
                                  if (_isSearching) {
                                    _animationController
                                        .forward(); // Fade-in saat search aktif
                                  } else {
                                    _animationController
                                        .reverse(); // Fade-out saat search non-aktif
                                    _searchController.clear();
                                  }
                                });
                              },
                              customBorder: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset(
                                  'icons/ic_search.png',
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Corner Bottom-Right U Shape
                  Positioned(
                    bottom: -44,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 44,
                      color: blueColor,
                    ),
                  ),
                  Positioned(
                    bottom: -45,
                    right: 0,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Body
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    filteredSchedule.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: Text(
                                "Tidak ada mata kuliah ditemukan.",
                                style: TextStyle(
                                  color: greyColor,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: filteredDays.map((day) {
                              final jadwal =
                                  (jadwalPerHari[day] ?? []).where((jadwal) {
                                final query =
                                    _searchController.text.toLowerCase();
                                return jadwal.mataKuliah
                                    .toLowerCase()
                                    .contains(query);
                              }).toList();

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      day,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: blueColor,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                  ),
                                  if (jadwal.isEmpty)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'icons/ic_noData.png',
                                              height: 60,
                                              width: 60,
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              "Tidak ada perkuliahan",
                                              style: TextStyle(
                                                color: greyColor,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  else
                                    Column(
                                      children: jadwal.map((jadwal) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 0),
                                          child:
                                              AllScheduleCard(jadwal: jadwal),
                                        );
                                      }).toList(),
                                    ),
                                ],
                              );
                            }).toList()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
