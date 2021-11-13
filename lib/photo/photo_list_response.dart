/// msg : "success"
/// code : 1
/// data : [{"desc":"喜欢神奇宝贝的人一定都知道鲤鱼王。这个特别的精灵没有特别强大的能力，除了长相呆萌，好像没有其他优点。不过下面这名男子却对这个超弱的精灵情有独钟，他戴着鲤鱼王面具大玩Cosplay，照片被上传到网路后立刻成为网友们热议的话题。","pvnum":"","createdate":"2017-01-11 01:39:21","scover":"http://img3.cache.netease.com/photo/0031/2017-01-11/s_CAFBLLL26LRK0031.jpg","setname":"靠Cosplay鲤鱼王而走红的型男真面目","cover":"http://img3.cache.netease.com/photo/0031/2017-01-11/CAFBLLL26LRK0031.jpg","pics":["http://img3.cache.netease.com/photo/0031/2017-01-11/CAFBLLL26LRK0031.jpg","http://img4.cache.netease.com/photo/0031/2017-01-11/CAFBLLTT6LRK0031.jpg","http://img4.cache.netease.com/photo/0031/2017-01-11/CAFBLM0J6LRK0031.jpg"],"clientcover1":"","replynum":"57","topicname":"","setid":"91744","seturl":"http://play.163.com/photoview/6LRK0031/91744.html","datetime":"2017-01-11 01:42:32","clientcover":"","imgsum":"7","tcover":"http://img4.cache.netease.com/photo/0031/2017-01-11/t_CAFBLLL26LRK0031.jpg"},{"desc":"最后要推荐的一组图是台湾Coser：Mon小夢夢的最新作品——菲利克斯COS。在原作里，这位角色拥有着不属于女性的萌系着装以及言行举止，然而事实上却是个真·汉子......","pvnum":"","createdate":"2017-01-10 10:58:46","scover":"http://img4.cache.netease.com/photo/0031/2017-01-10/s_CADP9L5P6LRK0031.jpg","setname":"灵魂陷入危机之中 Re:0菲利克斯COS","cover":"http://img3.cache.netease.com/photo/0031/2017-01-10/CADP9L5P6LRK0031.jpg","pics":["http://img3.cache.netease.com/photo/0031/2017-01-10/CADP9L5P6LRK0031.jpg","http://img3.cache.netease.com/photo/0031/2017-01-10/CADP9JU36LRK0031.jpg","http://img4.cache.netease.com/photo/0031/2017-01-10/CADP9K7J6LRK0031.jpg"],"clientcover1":"","replynum":"0","topicname":"","setid":"91731","seturl":"http://play.163.com/photoview/6LRK0031/91731.html","datetime":"2017-01-10 11:00:15","clientcover":"","imgsum":"5","tcover":"http://img3.cache.netease.com/photo/0031/2017-01-10/t_CADP9L5P6LRK0031.jpg"}]

class AlbumResponse {
  AlbumResponse({
    String? msg,
    int? code,
    List<Photo>? data,
  }) {
    _msg = msg;
    _code = code;
    _data = data;
  }

  AlbumResponse.fromJson(dynamic json) {
    _msg = json['msg'];
    _code = json['code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Photo.fromJson(v));
      });
    }
  }

  String? _msg;
  int? _code;
  List<Photo>? _data;

  String? get msg => _msg;

  int? get code => _code;

  List<Photo>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// desc : "喜欢神奇宝贝的人一定都知道鲤鱼王。这个特别的精灵没有特别强大的能力，除了长相呆萌，好像没有其他优点。不过下面这名男子却对这个超弱的精灵情有独钟，他戴着鲤鱼王面具大玩Cosplay，照片被上传到网路后立刻成为网友们热议的话题。"
/// pvnum : ""
/// createdate : "2017-01-11 01:39:21"
/// scover : "http://img3.cache.netease.com/photo/0031/2017-01-11/s_CAFBLLL26LRK0031.jpg"
/// setname : "靠Cosplay鲤鱼王而走红的型男真面目"
/// cover : "http://img3.cache.netease.com/photo/0031/2017-01-11/CAFBLLL26LRK0031.jpg"
/// pics : ["http://img3.cache.netease.com/photo/0031/2017-01-11/CAFBLLL26LRK0031.jpg","http://img4.cache.netease.com/photo/0031/2017-01-11/CAFBLLTT6LRK0031.jpg","http://img4.cache.netease.com/photo/0031/2017-01-11/CAFBLM0J6LRK0031.jpg"]
/// clientcover1 : ""
/// replynum : "57"
/// topicname : ""
/// setid : "91744"
/// seturl : "http://play.163.com/photoview/6LRK0031/91744.html"
/// datetime : "2017-01-11 01:42:32"
/// clientcover : ""
/// imgsum : "7"
/// tcover : "http://img4.cache.netease.com/photo/0031/2017-01-11/t_CAFBLLL26LRK0031.jpg"

class Photo {
  Photo({
    String? desc,
    String? pvnum,
    String? createdate,
    String? scover,
    String? setname,
    String? cover,
    List<String>? pics,
    String? clientcover1,
    String? replynum,
    String? topicname,
    String? setid,
    String? seturl,
    String? datetime,
    String? clientcover,
    String? imgsum,
    String? tcover,
  }) {
    _desc = desc;
    _pvnum = pvnum;
    _createdate = createdate;
    _scover = scover;
    _setname = setname;
    _cover = cover;
    _pics = pics;
    _clientcover1 = clientcover1;
    _replynum = replynum;
    _topicname = topicname;
    _setid = setid;
    _seturl = seturl;
    _datetime = datetime;
    _clientcover = clientcover;
    _imgsum = imgsum;
    _tcover = tcover;
  }

  Photo.fromJson(dynamic json) {
    _desc = json['desc'];
    _pvnum = json['pvnum'];
    _createdate = json['createdate'];
    _scover = json['scover'];
    _setname = json['setname'];
    _cover = json['cover'];
    _pics = json['pics'] != null ? json['pics'].cast<String>() : [];
    _clientcover1 = json['clientcover1'];
    _replynum = json['replynum'];
    _topicname = json['topicname'];
    _setid = json['setid'];
    _seturl = json['seturl'];
    _datetime = json['datetime'];
    _clientcover = json['clientcover'];
    _imgsum = json['imgsum'];
    _tcover = json['tcover'];
  }

  String? _desc;
  String? _pvnum;
  String? _createdate;
  String? _scover;
  String? _setname;
  String? _cover;
  List<String>? _pics;
  String? _clientcover1;
  String? _replynum;
  String? _topicname;
  String? _setid;
  String? _seturl;
  String? _datetime;
  String? _clientcover;
  String? _imgsum;
  String? _tcover;

  String? get desc => _desc;

  String? get pvnum => _pvnum;

  String? get createdate => _createdate;

  String? get scover => _scover;

  String? get setname => _setname;

  String? get cover => _cover;

  List<String>? get pics => _pics;

  String? get clientcover1 => _clientcover1;

  String? get replynum => _replynum;

  String? get topicname => _topicname;

  String? get setid => _setid;

  String? get seturl => _seturl;

  String? get datetime => _datetime;

  String? get clientcover => _clientcover;

  String? get imgsum => _imgsum;

  String? get tcover => _tcover;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['desc'] = _desc;
    map['pvnum'] = _pvnum;
    map['createdate'] = _createdate;
    map['scover'] = _scover;
    map['setname'] = _setname;
    map['cover'] = _cover;
    map['pics'] = _pics;
    map['clientcover1'] = _clientcover1;
    map['replynum'] = _replynum;
    map['topicname'] = _topicname;
    map['setid'] = _setid;
    map['seturl'] = _seturl;
    map['datetime'] = _datetime;
    map['clientcover'] = _clientcover;
    map['imgsum'] = _imgsum;
    map['tcover'] = _tcover;
    return map;
  }
}

enum ALBUM_STATUS_TYPE {
  init,
  emptyAlbum,
  noMorePhoto,
  refreshError,
  loadMoreError,
  refreshOK,
  loadMoreOK,
  loadingMore,
}
