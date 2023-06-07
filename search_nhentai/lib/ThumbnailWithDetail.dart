import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ThumbnailWithDetail extends StatefulWidget{
  final String previewImage;
  final String source;
  final String title;
  final double similarity;
  final String pagePath;
  final int page;
  final String language;
  final String subjectPath;

  const ThumbnailWithDetail({
      super.key,
      required this.title,
      required this.source,
      required this.similarity,
      required this.subjectPath,
      required this.language,
      required this.page,
      required this.pagePath,
      required this.previewImage
    }
  );
  @override
  _ThumbnailWithDetailState createState() => _ThumbnailWithDetailState();
}
class _ThumbnailWithDetailState extends State<ThumbnailWithDetail>{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 300,
      child: Row(
        children: [
          Image.network(widget.previewImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.title),
              Text(widget.source)
            ],
          )
        ],
      ),
    );
  }
}