import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp()); // Giriş burdan hocam

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Bu sayfa sabit, o yüzden const dedik

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Sağ üstteki debug yazısını kaldırdık
      home: YouTubeHomePage(), // Ana sayfa burası
    );
  }
}

// Her video için gerekli bilgiler burda hocam, tıpkı ahırdaki yem defteri gibi
class Video {
  final String id;
  final String title;
  final String channel;
  final String views;
  final String thumbnailUrl; // ← Her videonun resmi
  final String channelImageUrl; // ← Kanalın profil fotoğrafı

  Video({
    required this.id,
    required this.title,
    required this.channel,
    required this.views,
    required this.thumbnailUrl,
    required this.channelImageUrl,
  });
}

class YouTubeHomePage extends StatelessWidget {
  // Burda videoları elle doldurduk hocam, veri tabanı yok henüz
  final List<Video> allVideos = [
    Video(
      id: 'fq4N0hgOWzU',
      title: 'Ezsoftla Flutter Öğreniyorum #1',
      channel: 'Süleyman Ezdemir',
      views: '1,5Mn Görüntülenme • 5 gün önce',
      thumbnailUrl: 'https://i.ytimg.com/vi/-RShK2hPfDg/maxresdefault.jpg',
      channelImageUrl: 'https://yt3.googleusercontent.com/ytc/AIdro_nFby-aqUAiRnupW--K4_uJNcFF5oPtBiMo6AVJq5gimSNV=s160-c-k-c0x00ffffff-no-rj',
    ),
    Video(
      id: 'Ej_Pcr4uC2Q',
      title: 'Ezsoftla Flutter Öğreniyorum #2',
      channel: 'Süleyman Ezdemir',
      views: '798B Görüntülenme • 3 gün önce',
      thumbnailUrl: 'https://i.ytimg.com/vi/LuwqubWbqeI/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCTZ4NHndZKwb25w1FiZ6NYwK2QbQ',
      channelImageUrl: 'https://yt3.googleusercontent.com/ytc/AIdro_nFby-aqUAiRnupW--K4_uJNcFF5oPtBiMo6AVJq5gimSNV=s160-c-k-c0x00ffffff-no-rj',
    ),
    Video(
      id: 'N3h3wzG6sMo',
      title: 'Ezsoftla Flutter Öğreniyorum #3',
      channel: 'Süleyman Ezdemir',
      views: '661B Görüntülenme • 1 gün önce',
      thumbnailUrl: 'https://i.ytimg.com/vi/jEpLcTXcIX4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLD7hwz8Er899YkAsV4btis3LekKow',
      channelImageUrl: 'https://yt3.googleusercontent.com/ytc/AIdro_nFby-aqUAiRnupW--K4_uJNcFF5oPtBiMo6AVJq5gimSNV=s160-c-k-c0x00ffffff-no-rj',
    ),
  ];

   YouTubeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sayfa arka planı beyaz
      body: CustomScrollView(
        slivers: [
          // Yukardaki YouTube barı
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 1,
            title: SvgPicture.network(
              'https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg',
              height: 25,
            ),
            actions: [
              IconButton(icon: const Icon(Icons.cast, color: Colors.black), onPressed: () {}),
              IconButton(icon: const Icon(Icons.notifications_none, color: Colors.black), onPressed: () {}),
              IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(radius: 14,backgroundImage: NetworkImage(
  'https://randomuser.me/api/portraits/men/11.jpg', // giriş yapılan kanalın sağ üssteki profil resmi raastgele atıyor..
),

),

              ),
            ],
          ),

          // Video listesi aşağı doğru
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = allVideos[index]; // Her bir video sırayla alınıyor hocam
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video görseli
                    Image.network(
                      video.thumbnailUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Kanalın profil fotoğrafı burda hocam
                          CircleAvatar(
                            backgroundImage: NetworkImage(video.channelImageUrl), // ← Burdan çekiyo
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Video başlığı
                                Text(
                                  video.title,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                // Kanal adı ve görüntülenme kısmı hocam
                                Text(
                                  '${video.channel} • ${video.views}',
                                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}), // Üç nokta menüsü
                        ],
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                  ],
                );
              },
              childCount: allVideos.length, // Kaç video varsa hepsini göster
            ),
          ),
        ],
      ),

      // Alttaki sabit navigasyon menüsü
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Shorts'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Abonelikler'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Siz'),
        ],
      ),
    );
  }
}