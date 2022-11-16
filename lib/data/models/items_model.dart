
class ItemModel {

  ItemModel({
    required this.description,
    required this.image,
    required this.name,
    required this.quantity
});
  String description;
  String image;
  String name;
  int quantity;

  factory ItemModel.fromJson(Map<String,dynamic> json){
    return ItemModel(
        description: json['description'] as String,
        image: json['image'] as String,
        name: json['name'] as String,
        quantity: json['quantity'] as int,
    );
  }
  toJson(){
    return {
      'description':description,
      'image':image,
      'name':name,
      'quantity':quantity
    };
  }
}