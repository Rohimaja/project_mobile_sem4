import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_lecturer/models/presence/course_presence_detail_model.dart';
import 'package:stipres/screens/features_lecturer/models/presence/presence_detail_model.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/presence/presence_detail_card.dart';
import 'package:stipres/constants/styles.dart';

class PresenceDetailScreen extends StatefulWidget {
  const PresenceDetailScreen({super.key});

  @override
  State<PresenceDetailScreen> createState() => _PresenceDetailScreenState();
}

class _PresenceDetailScreenState extends State<PresenceDetailScreen>
    with SingleTickerProviderStateMixin {
  late double height, width;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  final List<CourseDetailModel> dummyCourseDetailModel = [
    CourseDetailModel(
        prodi: 'Teknik Informatika',
        matkul: 'Pemrograman Dasar',
        jamPresensi: '09.00 - 11.00 WIB'),
  ];

  final List<PresenceDetailModel> dummyPresenceDetailModel = [
    PresenceDetailModel(
      nim: 'E41231215',
      nama: 'Izzul Islam Ramadhan',
      keterangan: 'hadir',
      jeniskelamin: 'laki-laki',
    ),
    PresenceDetailModel(
      nim: 'E41231299',
      nama: 'Citra Rahayu Meigita N.',
      keterangan: 'izin',
      jeniskelamin: 'perempuan',
    ),
    PresenceDetailModel(
      nim: 'E41231099',
      nama: 'Bimaa Achmad Fiil Ardhi',
      keterangan: 'hadir',
      jeniskelamin: 'laki-laki',
    ),
    PresenceDetailModel(
      nim: 'E41231275',
      nama: 'Edwin Kurniawan',
      keterangan: 'hadir',
      jeniskelamin: 'laki-laki',
    ),
    PresenceDetailModel(
      nim: 'E41231324',
      nama: 'Muhammad Diega Syahputra',
      keterangan: 'sakit',
      jeniskelamin: 'laki-laki',
    ),
    PresenceDetailModel(
      nim: 'E41231222',
      nama: 'Aldo Gaming',
      keterangan: 'alpa',
      jeniskelamin: 'laki-laki',
    ),
  ];

  String? selectedSemester;
  String? selectedProdi;

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

    final filteredMahasiswa = dummyPresenceDetailModel.where((nama) {
      final query = _searchController.text.toLowerCase();
      return nama.nama.toLowerCase().contains(query) ||
          nama.nim.toLowerCase().contains(query) ||
          nama.keterangan.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // HEADER (tidak berubah)
                      Container(
                        width: width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/bgheader.png'),
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
                                    'assets/icons/ic_back.png',
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: TextField(
                                                controller: _searchController,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Cari data mahasiswa...',
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
                                          "Presensi Mata Kuliah",
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
                                        _animationController.forward();
                                      } else {
                                        _animationController.reverse();
                                        _searchController.clear();
                                      }
                                    });
                                  },
                                  customBorder: const CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Image.asset(
                                      'assets/icons/ic_search.png',
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
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Body Konten
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detail Presensi Mahasiswa',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: blueColor,
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100, // Set the desired width
                                    child: Text(
                                      'Program Studi',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    ':',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    dummyCourseDetailModel[0].prodi,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100, // Set the desired width
                                    child: Text(
                                      'Mata Kuliah',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    ':',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    dummyCourseDetailModel[0].matkul,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100, // Set the desired width
                                    child: Text(
                                      'Jam Presensi',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    ':',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    dummyCourseDetailModel[0].jamPresensi,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Divider(
                                  height: 1, color: Color(0xFFDADADA)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        filteredMahasiswa.isEmpty
                            ? Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 30),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/ic_noData.png',
                                      height: 120,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      _searchController.text.isEmpty
                                          ? "Tidak ada data mahasiswa"
                                          : "Data mahasiswa tidak ditemukan",
                                      style: TextStyle(
                                        color: greyColor,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 150),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: filteredMahasiswa.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: PresenceDetailCard(
                                      mahasiswa: filteredMahasiswa[index],
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
