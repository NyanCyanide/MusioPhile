import 'package:flutter/material.dart';
import 'package:musicplayer/music.dart';
import 'package:musicplayer/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List musics;

  @override
  initState() {
    musics = getList();
    super.initState();
  }

  List getList() {
    return [
      Music(
          title: "Night Changes",
          image:
              "https://images.genius.com/31c7d09c4aa1b324bb911d0db72453a3.1000x1000x1.jpg",
          singer: "One Direction",
          audio:
              "https://drive.google.com/uc?export=view&id=1JkJggiaX_vQaFKHdWQ8TX0tuQ7UpL23-"),
      Music(
          title: "Royalty",
          image:
              "https://cdn.shopify.com/s/files/1/0892/5840/products/ncs_2016_4000.jpg?v=1481640883",
          singer: "NCS",
          audio:
              "https://drive.google.com/uc?export=view&id=1tPZ7BDVVAZv2oYjPOl6KVjH_Z_8G5Sxh"),
      Music(
          title: "Stereo Hearts",
          image:
              "https://www.bing.com/th?id=OIP.AmUlLE27QAUp0-0qmY_S2gHaHa&w=173&h=170&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          singer: "Maroon 5",
          audio:
              "https://drive.google.com/uc?export=view&id=1h1nvnIoW6josUPJDIr9Yrc8YSvNGY6UY"),
      Music(
          title: "Heat Waves",
          image:
              "https://upload.wikimedia.org/wikipedia/en/b/b0/Glass_Animals_-_Heat_Waves.png",
          singer: "Glass Animals",
          audio:
              "https://drive.google.com/uc?export=view&id=15B8vLhKXbUljr060Y5vo8V9XjJ37NTpG"),
      Music(
          title: "In The Name Of Love",
          image:
              "https://i.scdn.co/image/9c829e6c5e6f8bf4edda886704f9702032136c1f",
          singer: "Martin Garrix",
          audio:
              "https://drive.google.com/uc?export=view&id=1z2kQZzGhvf_T1MVah3aHjEbEiMPhSH1W"),
      Music(
          title: "Middle Of the Night",
          image:
              "https://th.bing.com/th/id/OIP.f_pvuCc3v7-ox6BLV24kQwHaHa?pid=ImgDet&rs=1",
          singer: "The Vamps",
          audio:
              "https://drive.google.com/uc?export=view&id=1scogLnyk3e5MlD5ewGjGy36hRgsVdtxz"),
      Music(
          title: "Unstoppable",
          image:
              "https://i.scdn.co/image/ab67616d0000b273754b2fddebe7039fdb912837",
          singer: "Sia",
          audio:
              "https://drive.google.com/uc?export=view&id=1q42mydCbMAIYc0rYcOx1FYt6_ICSBPUl"),
      Music(
          title: "Let me Down Slowly",
          image:
              "https://i.scdn.co/image/ab67616d0000b273459d675aa0b6f3b211357370",
          singer: "Alec Benjamin",
          audio:
              "https://drive.google.com/uc?export=view&id=1v7aysQP7EBvB8zFrAdbmSkCw3tus78vK"),
      Music(
          title: "Dusk Till Dawn",
          image:
              "https://i1.sndcdn.com/artworks-000405545727-arfwqx-t500x500.jpg",
          singer: "Zayn & Sia",
          audio:
              "https://drive.google.com/uc?export=view&id=1tOQaYKx6ZAoS9wSs6urpcHUS1sPtm7Po"),
      Music(
          title: "Hymn Of the Weekend",
          image:
              "http://images.genius.com/dc9362622360700b3a9f2a668aae0b92.1000x1000x1.jpg",
          singer: "Coldplay",
          audio:
              "https://drive.google.com/uc?export=view&id=1ASd90txKAjVwgoOxMMAvTTyOAHammYfx")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MusioPhile"),
          backgroundColor: const Color.fromARGB(238, 0, 0, 0),
        ),
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(223, 0, 0, 0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: musics.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Player(music: musics[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 60.0,
                          width: 60.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(musics[index].image,
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(musics[index].title,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 197, 197, 4),
                                  )),
                              const SizedBox(height: 8.0),
                              Text(musics[index].singer,
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ))
                            ]),
                        const Spacer(),
                        const Icon(Icons.play_circle_fill,
                            color: Color.fromARGB(118, 1, 255, 10), size: 45.0)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Title
// Source
// Singer
// AudioFile
