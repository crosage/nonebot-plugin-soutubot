import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:search_nhentai/IconWithText.dart';

class ThumbnailWithDetail extends StatefulWidget{
  final String? previewImage;
  final String? source;
  final String? title;
  final double? similarity;
  final String? pagePath;
  final int? page;
  final String? language;
  final String? subjectPath;

  const ThumbnailWithDetail({
      super.key,
      this.title,
      this.source,
      this.similarity,
      this.subjectPath,
      this.language,
      this.page,
      this.pagePath,
      this.previewImage
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
          Container(
            width: 180,
            child: Image.network(widget.previewImage!),
          ),
          Column(
            children: [
              IconWithText(
                  flexText: widget.title!,
                  flexIcon: RawChip(
                    label: Text("标题"),
                    avatar: Icon(Icons.title),
                  )
              ),
              IconWithText(
                  flexText: widget.source!,
                  flexIcon: RawChip(
                    label: Text("图源"),
                    avatar: Icon(
                      Icons.web_stories,
                    ),
                  )
              ),
              IconWithText(
                  flexText: widget.similarity.toString(),
                  flexIcon: RawChip(
                    label: Text("相似度"),
                    avatar: Icon(
                      Icons.thumb_up,
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}