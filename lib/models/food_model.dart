class FoodModel {
  final String name;
  final double price;
  final double weight;
  final double calory;
  final double protein;
  final String item;
  final String imgPath;

  FoodModel(
      {this.name,
        this.price,
        this.weight,
        this.calory,
        this.protein,
        this.item,
        this.imgPath});

  static List<FoodModel> list = [
    FoodModel(
      name: "Tacos Nanchas",
      price: 120,
      weight: 130,
      calory: 460,
      protein: 30,
      imgPath: "1.png",
    ),
    FoodModel(
      name: "Porata Masala",
      price: 100,
      weight: 120,
      calory: 300,
      protein: 45,
      imgPath: "2.png",
    ),
    FoodModel(
      name: "Taco Kebab",
      price: 90,
      weight: 100,
      calory: 320,
      protein: 150,
      imgPath: "3.png",
    ),
    FoodModel(
      name: "Chicken Salad",
      price: 50,
      weight: 30,
      calory: 65,
      protein: 50,
      imgPath: "4.png",
    ),
    FoodModel(
      name: "Chicken Eggs",
      price: 20,
      weight: 30,
      calory: 120,
      protein: 310,
      imgPath: "5.png",
    ),
  ];
}