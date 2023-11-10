import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import '../util/linklerim.dart';

class VideoOynatici extends StatefulWidget {
  bool otomatikOynatilsinMi;
  bool canliMi;
  bool FulEkranOlsunMu;
  String linki;
  String resolutions;

  VideoOynatici(
      {Key? key,
      this.resolutions = Linklerim.kanal1,
      this.otomatikOynatilsinMi = false,
      this.canliMi = false,
      this.FulEkranOlsunMu = false,
      this.linki = Linklerim.kanal1})
      : super(key: key);

  @override
  State<VideoOynatici> createState() => _VideoOynaticiState();
}

class _VideoOynaticiState extends State<VideoOynatici> {
  late BetterPlayerController _betterPlayerController;
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      controlsConfiguration: const BetterPlayerControlsConfiguration(
          controlBarColor: Colors.black26, backgroundColor: Colors.transparent),
      aspectRatio: 16 / 9,
      looping: true,
      eventListener: (p0) {
        return BetterPlayerEvent(BetterPlayerEventType.initialized);
      },
      errorBuilder: (context, errorMessage) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Video oynatılırken hata gerçekleşti.')),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => _setupDataSource(),
              child:
                  const Text('Yeniden Yükle', style: TextStyle(fontSize: 35)),
            ),
          ],
        );
      },
      subtitlesConfiguration: const BetterPlayerSubtitlesConfiguration(),
      autoPlay: widget.otomatikOynatilsinMi,
      fullScreenByDefault: widget.FulEkranOlsunMu,
      fit: BoxFit.contain,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    _setupDataSource();
    _betterPlayerController.enablePictureInPicture(_betterPlayerKey);
    super.initState();
  }

  void _setupDataSource() async {
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      resolutions: {'720': widget.resolutions},
      liveStream: widget.canliMi,
      widget.linki,
      notificationConfiguration: const BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: "",
          author: '',
          imageUrl: '',
          notificationChannelName: 'Spor'),
    );
    await _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(
        controller: _betterPlayerController,
        key: _betterPlayerKey,
      ),
    );
  }
}
