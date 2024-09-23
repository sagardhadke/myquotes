
class QuotesModel {
    List<Quotes>? quotes;
    int? total;
    int? skip;
    int? limit;

    QuotesModel({this.quotes, this.total, this.skip, this.limit});

    QuotesModel.fromJson(Map<String, dynamic> json) {
        quotes = json["quotes"] == null ? null : (json["quotes"] as List).map((e) => Quotes.fromJson(e)).toList();
        total = json["total"];
        skip = json["skip"];
        limit = json["limit"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(quotes != null) {
            _data["quotes"] = quotes?.map((e) => e.toJson()).toList();
        }
        _data["total"] = total;
        _data["skip"] = skip;
        _data["limit"] = limit;
        return _data;
    }
}

class Quotes {
    int? id;
    String? quote;
    String? author;

    Quotes({this.id, this.quote, this.author});

    Quotes.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        quote = json["quote"];
        author = json["author"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["quote"] = quote;
        _data["author"] = author;
        return _data;
    }
}