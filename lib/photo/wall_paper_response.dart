import 'dart:typed_data';

class WallPaper {
  String url;
  Uint8List bytes;

  WallPaper(this.url, this.bytes);

  WallPaper.bytes(this.bytes) : url = '';

  WallPaper.url(this.url) : bytes = Uint8List(0);
}
