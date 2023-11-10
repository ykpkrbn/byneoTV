import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ListeGostermeController extends GetxController{
  @override
  void onInit() {
    getVideoInformation();
    super.onInit();
  }

  List<String> links = [
    "http://kraliptv.xyz:8080/erolciran4901/KYzwjrw5DaLp/127",
  ];

  List<String> names = [];
  List<String> images = [];

  void getVideoInformation() async {
    for (int i = 0; i < links.length; i++) {
      var uri = Uri.parse(links[i]);
      var response = await http.get(uri);
      var body = response.body;
      List<String> lines = body.split("\n");
      for (int j = 0; j < lines.length; j++) {
        if (lines[j].startsWith("#EXTINF")) {
          // Bu satır bir video bilgisidir
          // Videonun adını ve amblemini çekin
          String name = lines[j].split(",")[1];
          print('-----'*30);
          print('$name Eklendiiiiiiiiiiiiiiiiii');
          names.add(name);
          if (lines[j].contains("tvg-logo")) {
            // Videonun amblemi vardır
            // Amblemini çekin
            String image = lines[j].split("tvg-logo=")[1].split(" ")[0];
            images.add(image);
          } else {
            // Videonun amblemi yoktur
            images.add("");
          }
        } else if (lines[j].startsWith("http")) {
          // Bu satır bir video linkidir
          // Linki kullanarak videoyu oynatın
        }
      }
    }
  }




}