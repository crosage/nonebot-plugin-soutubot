import 'package:flutter/material.dart';
import 'package:search_nhentai/ThumbnailWithDetail.dart';
import 'package:search_nhentai/UploadImage.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

Map<String, String> DEFAULT_HEADERS = {
  "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36",
  "authority": "soutubot.moe",
  "origin": "https://soutubot.moe",
  "referer": "https://soutubot.moe/",
  "x-requested-with": "XMLHttpRequest"
};
int len_of_header = 111;

class FileController extends GetxController {
  Rx<File> file= File("").obs ;
  void setFile(File value) {
    file.value = value;
  }
}


class ImageList extends StatelessWidget {
  late File? image_;
  final String search_bot = "https://soutubot.moe/api/search";
  final FileController fileController=Get.find<FileController>();
  ImageList({this.image_});

  String calculateQ() {
    int currentTime =
        (DateTime.now().millisecondsSinceEpoch.toInt() / 1000).toInt();
    BigInt bigIntCurrentTime = BigInt.from(currentTime);
    BigInt bigIntQ = bigIntCurrentTime.pow(2) + BigInt.from(111).pow(2);
    String q = bigIntQ.toString();
    return q;
  }

  String encodeQ(String q) {
    String encodedData = base64.encode(utf8.encode(q)).split('').reversed.join();
    encodedData = encodedData.replaceAll('=', '');
    return encodedData;
  }

  Future<dynamic> getDetails() async {
    List<ThumbnailWithDetail> ImageList=[];
    Map<String, String> header = DEFAULT_HEADERS;
    String Q = calculateQ();
    String encode = encodeQ(Q);
    header["x-api-key"] = encode;
    var request = http.MultipartRequest('POST', Uri.parse(search_bot));
    request.headers.addAll(header);
    request.fields['factor'] = (1.2).toString();
    print(request.files);
    var stream = http.ByteStream((image_!).openRead());
    var length = await (image_!).length();
    print(stream);
    request.files.add(await http.MultipartFile('file', stream,length,filename: "test.png"));
    print(request.files);
    var response = await request.send();
    print(image_?.path);
    var responseString = await response.stream.bytesToString();
    // print(responseString);
    dynamic responseJson = json.decode(responseString);
    print(responseJson);
    int now=0;
    for(final i in responseJson["data"]){
      print(now);
      ImageList.add(
          ThumbnailWithDetail(
              title: i["title"],
              source: i["source"],
              similarity: i["similarity"],
              subjectPath: i["subjectPath"],
              language: i["language"],
              page: i["page"],
              pagePath: i["pagePath"],
              previewImage: i["previewImageUrl"]
          )
      );
      // print(i);
    }
    print("************");
    print(ImageList);
    print("************");
    return ImageList;
    // ImageList.add(ThumbnailWithDetail(title: title, author: author, similarity: similarity, subjectPath: subjectPath, language: language, page: page, pagePath: pagePath, previewImage: previewImage));
  }

  @override
  Widget build(BuildContext context) {
    image_=fileController.file.value;
    return Scaffold(
        body: FutureBuilder<dynamic>(
      future: getDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("**************");

          return ListView(
            children: [
              for(final i in snapshot.data)
                  ThumbnailWithDetail(
                      title: i.title,
                      source: i.source,
                      similarity: i.similarity,
                      subjectPath: i.subjectPath,
                      language: i.language,
                      page: i.page,
                      pagePath: i.pagePath,
                      previewImage: i.previewImage
                  )
                  ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          );
        }
      },
    ));
  }
}
