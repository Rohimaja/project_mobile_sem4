import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/controllers/features_lecturer/home/lectures/lecture_controller.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/lecture_card.dart';
import 'package:stipres/screens/features_lecturer/widgets/dialog/edit_lecture_dialog.dart';
import 'package:stipres/constants/styles.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen({super.key});

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen>
    with TickerProviderStateMixin {
  late double height, width;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final _controller = Get.find<LectureController>();

  // final List<PerkuliahanModel> perkuliahanHariIni = [
  //   PerkuliahanModel(
  //     semester: 3,
  //     matkul: 'Pemrograman Mobile',
  //     tanggal: 'Senin, 11 Maret 2025',
  //     dosen: 'Aldo Rayhan Radittyanuh S.Kom,M.Kom',
  //     jam: '08:00 - 10:00',
  //     linkZoom: 'https://zoom.us/j/123456789',
  //   ),
  //   PerkuliahanModel(
  //     semester: 3,
  //     matkul: 'Pemrograman Website',
  //     tanggal: 'Senin, 11 Maret 2025',
  //     dosen: 'Izzul Islam Ramadhan S.Kom,M.Kom',
  //     jam: '08:00 - 10:00',
  //     linkZoom: 'https://zoom.us/j/123456789',
  //   ),
  //   PerkuliahanModel(
  //     semester: 3,
  //     matkul: 'Logika Algoritma',
  //     tanggal: 'Senin, 11 Maret 2025',
  //     dosen: 'Bima Achmad Fiil A. S.Kom,M.Kom',
  //     jam: '08:00 - 10:00',
  //     linkZoom: 'https://zoom.us/j/123456789',
  //   ),
  //   PerkuliahanModel(
  //     semester: 3,
  //     matkul: 'Machine Learning',
  //     tanggal: 'Senin, 11 Maret 2025',
  //     dosen: 'Edwin Kurniawan S.Kom,M.Kom',
  //     jam: '08:00 - 10:00',
  //     linkZoom: 'https://zoom.us/j/123456789',
  //   ),
  // ];

  late AnimationController _animationController;
  late Animation<double> _animation;

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

    return Scaffold(
        backgroundColor: mainColor,
        body: Obx(() {
          final filteredPerkuliahan =
              _controller.lectureList.where((perkuliahan) {
            final query = _searchController.text.toLowerCase();
            return perkuliahan.namaMatkul.toLowerCase().contains(query);
          }).toList();
          return SafeArea(
            child: Column(
              children: [
                // HEADER + Search Bar
                Stack(
                  clipBehavior: Clip.none,
                  children: [
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
                              onTap: () => Navigator.pop(context),
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
                          // Animated Search Bar dengan fade
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
                                        "Perkuliahan Online",
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
                          const SizedBox(width: 10),
                          // Tombol pencarian tetap di posisi yang sama
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

                // Body Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Perkuliahan Hari Ini',
                            style: TextStyle(
                              fontSize: 16,
                              color: blueColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: filteredPerkuliahan.isEmpty
                              ? Container(
                                  width: double
                                      .infinity, // Biar bisa center dalam parent
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
                                            ? "Tidak ada perkuliahan minggu ini."
                                            : "Tidak ada mata kuliah ditemukan.",
                                        style: TextStyle(
                                          color: greyColor,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: filteredPerkuliahan.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final currentData =
                                        filteredPerkuliahan[index];

                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: PerkuliahanCard(
                                        data: currentData,
                                        onEdit: (String currentLink,
                                            int presensisId) {
                                          showEditLinkDialog(
                                            context,
                                            currentLink,
                                            (String newLink) {
                                              // ✅ Tangani perubahan di sini
                                              _controller.submitUpdateLecture(
                                                  presensisId,
                                                  newLink,
                                                  currentLink, currentData);
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
