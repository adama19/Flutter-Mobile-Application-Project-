class Model {
  String image;
  String title;
  String publisher;
  String price;
  String availability;

  Model(
      {this.image, this.title, this.publisher, this.price, this.availability});

  factory Model.fromJson(dynamic json) {
    return Model(
      image: "${json['image']}",
      title: "${json['title']}",
      publisher: "${json['publisher']}",
      price: "${json['price']}",
      availability: "${json['availability']}",
    );
  }
  Map toJson() => {
        "image": image,
        "title": title,
        "publisher": publisher,
        "price": price,
        "availability": availability,
      };
}
