import 'dart:developer';

import 'package:sekolahdulu/data/materi_controller.dart';
import 'package:sekolahdulu/data/remote/materi.dart';
import 'package:sekolahdulu/views/screen/materi/list_materi_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sekolahdulu/views/screen/materi/course_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Import the CourseScreen from the materi folder

class ThirdPage extends StatefulWidget {
  final String title;
  final int index;

  const ThirdPage({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final MateriController _materiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          iconSize: 36,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LiveCoursesScreen(),
              ),
            );
          },
        ),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Vina',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '17 y.o / 12th grade',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/profile-pict.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: _materiController.fetchSpecificMateri(
                      widget.index,
                      widget.title,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          final materi = snapshot.data as Materi;

                          log('${materi.urlVideo} ${materi.judul}',
                              name: 'youtube');

                          return YoutubePlayerBuilder(
                            player: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: materi.urlVideo.substring(
                                  materi.urlVideo.lastIndexOf('/'),
                                  materi.urlVideo.length,
                                ),
                                flags: const YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                ),
                              ),
                              showVideoProgressIndicator: true,
                              onReady: () {},
                            ),
                            builder: (context, player) {
                              return player;
                            },
                          );
                        }
                      }

                      return Container();
                    }),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FutureBuilder(
                    future: _materiController.fetchSpecificMateri(
                        widget.index, widget.title),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          final materi = snapshot.data as Materi;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(59, 38, 122, 1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          materi.durasi,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.access_time,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                materi.deskripsi,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(59, 38, 122, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          );
                        }
                      }

                      return Container();
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Choose Other Video',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16),
                FutureBuilder(
                    future: _materiController.fetchAllMateri(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          List<Materi> materiList =
                              snapshot.data as List<Materi>;

                          List<Materi> filteredList = materiList
                              .where((e) => e.judul != widget.title)
                              .toList();

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ThirdPage(
                                      title: filteredList[index].judul,
                                      index: materiList.indexWhere((e) =>
                                          e.judul == filteredList[index].judul),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.play_circle_fill,
                                        color: Color.fromRGBO(59, 38, 122, 1),
                                        size: 36,
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            filteredList[index].judul,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            filteredList[index].durasi,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }

                      return Container();
                    }),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 128,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Color.fromRGBO(184, 186, 196, 1),
                        ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 46, 10, 94),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
