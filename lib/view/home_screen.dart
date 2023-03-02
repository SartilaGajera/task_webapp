import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getData() async {
    QuerySnapshot data = await FirebaseFirestore.instance.collection('music').get();
    debugPrint("Data==============${data}");
    return data.docs;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff242440),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12), color: const Color(0xff493a5b)),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: const TextStyle(color: Colors.white30, fontSize: 14),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white38,
                              size: 30,
                            ),
                            fillColor: const Color(0xff493a5b),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Trending right now",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 180,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff493a5b),
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://img.freepik.com/free-vector/musical-notes-frame-with-text-space_1017-32857.jpg?w=2000"),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 10),
                                          height: 50,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0xff282581)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "The Dark side",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.music_note,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        "Music-Therory",
                                                        style: TextStyle(
                                                            color: Colors.white70,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w400),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: index == 0 ? Color(0xff35278c) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Text(
                                      index == 0
                                          ? "Trending right now"
                                          : index == 1
                                              ? "Rock"
                                              : index == 2
                                                  ? "Hip Hop"
                                                  : index == 3
                                                      ? "Melody"
                                                      : index == 4
                                                          ? "Traditional"
                                                          : "Exotic",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        FutureBuilder(
                            future: getData(),
                            builder: (BuildContext context, AsyncSnapshot snapShot) {
                              debugPrint("jgjgjgjgjg${snapShot.connectionState}");

                              final player = AudioPlayer();
                              return snapShot.connectionState == ConnectionState.done
                                  ? ListView.builder(
                                      itemCount: snapShot.data.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 70,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  image: const DecorationImage(
                                                    image: NetworkImage(
                                                      'https://img.freepik.com/free-vector/musical-notes-frame-with-text-space_1017-32857.jpg?w=2000',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${snapShot.data[index]['title']}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.download,
                                                        color: Colors.white.withOpacity(0.3),
                                                        size: 15,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        "${snapShot.data[index]['subTitle']}",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.white.withOpacity(0.3),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )),
                                              const SizedBox(
                                                width: 14,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  debugPrint(
                                                      "Url==============${"${snapShot.data[index]['url']}"}");

                                                  final duration = await player
                                                      .setUrl(snapShot.data[index]['url']);

                                                  await player.play();
                                                },
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              const Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : Center(child: const CircularProgressIndicator());
                            }),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: const Color(0xff3f4055)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              const Icon(
                Icons.search,
                color: Colors.white38,
                size: 30,
              ),
              const Icon(
                Icons.music_note,
                color: Colors.white38,
                size: 30,
              ),
              const Icon(
                Icons.person,
                color: Colors.white38,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
