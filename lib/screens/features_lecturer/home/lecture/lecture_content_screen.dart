import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_lecturer/models/lecture_model.dart';
import 'package:stipres/screens/features_lecturer/widgets/cards/lecture_card.dart';
import 'package:stipres/constants/styles.dart';

class LectureContentScreen extends StatefulWidget {
  const LectureContentScreen({super.key});

  @override
  State<LectureContentScreen> createState() => _LectureContentScreenState();
}

class _LectureContentScreenState extends State<LectureContentScreen>
    with TickerProviderStateMixin {
  late double height, width;

  final List<PerkuliahanModel> perkuliahanOnline = [
    PerkuliahanModel(
      semester: 3,
      matkul: 'Pemrograman Mobile',
      tanggal: 'Senin, 11 Maret 2025',
      dosen: 'Aldo Rayhan Radittyanuh S.Kom,M.Kom',
      jam: '08:00 - 10:00',
      linkZoom: 'https://zoom.us/j/123456789',
    ),
  ];

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Link Perkuliahan Online',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: blueColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    perkuliahanOnline.isEmpty
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
                                  'Link tidak tersedia',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: greyColor,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: perkuliahanOnline.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: PerkuliahanCard(
                                  data: perkuliahanOnline[index],
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
