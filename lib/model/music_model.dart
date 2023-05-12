class MusicModel {
  Data? data;
  Extensions? extensions;

  MusicModel({this.data, this.extensions});

  MusicModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    extensions = json['extensions'] != null
        ? new Extensions.fromJson(json['extensions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.extensions != null) {
      data['extensions'] = this.extensions!.toJson();
    }
    return data;
  }
}

class Data {
  Products? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  List<Edges>? edges;

  Products({this.edges});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = <Edges>[];
      json['edges'].forEach((v) {
        edges!.add(new Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.edges != null) {
      data['edges'] = this.edges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  Node? node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    return data;
  }
}

class Node {
  String? id;
  String? name;
  bool? isAvailable;
  Thumbnail? thumbnail;
  String? created;

  Node({this.id, this.name, this.isAvailable, this.thumbnail, this.created});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isAvailable = json['isAvailable'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isAvailable'] = this.isAvailable;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    data['created'] = this.created;
    return data;
  }
}

class Thumbnail {
  String? url;

  Thumbnail({this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Extensions {
  Cost? cost;

  Extensions({this.cost});

  Extensions.fromJson(Map<String, dynamic> json) {
    cost = json['cost'] != null ? new Cost.fromJson(json['cost']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cost != null) {
      data['cost'] = this.cost!.toJson();
    }
    return data;
  }
}

class Cost {
  int? requestedQueryCost;
  int? maximumAvailable;

  Cost({this.requestedQueryCost, this.maximumAvailable});

  Cost.fromJson(Map<String, dynamic> json) {
    requestedQueryCost = json['requestedQueryCost'];
    maximumAvailable = json['maximumAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestedQueryCost'] = this.requestedQueryCost;
    data['maximumAvailable'] = this.maximumAvailable;
    return data;
  }
}
