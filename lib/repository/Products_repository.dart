import 'package:new_random/Models/Product_Item.dart';
import 'package:share_plus/share_plus.dart';

class ProductsRepository {
  static List<ProductItem> products = [
    ProductItem(name: "Газ. вода", type: NonAlcoholByLiter()),
    ProductItem(name: "Мин. вода", type: NonAlcoholByLiter()),
    ProductItem(name: "Сок", type: NonAlcoholByLiter()),
    ProductItem(name: "Энергетик хаус", type: NonAlcoholByLiter()),
    ProductItem(name: "Энергетик шт.", type: NonAlcoholByPeaceMeal()),
    ProductItem(name: "Сироп", type: NonAlcoholByLiter()),
    ProductItem(name: "Пиво шт.", type: Beer()),
    ProductItem(name: "Стелла шт.", type: Beer()),
    ProductItem(name: "Стелла ба шт.", type: Beer()),
    ProductItem(name: "Феникс шт.", type: Beer()),
    ProductItem(name: "Водка хаус", type: Vodka()),
    ProductItem(name: "Хортица", type: Vodka()),
    ProductItem(name: "Царская", type: Vodka()),
    ProductItem(name: "Русь матушка", type: Vodka()),
    ProductItem(name: "Виски хаус", type: Wiskey()),
    ProductItem(name: "Таверн хаунд", type: Wiskey()),
    ProductItem(name: "Грей глен", type: Wiskey()),
    ProductItem(name: "Хай Коммишинер", type: Wiskey()),
    ProductItem(name: "Керригрин", type: Wiskey()),
    ProductItem(name: "Олд Верджиния", type: Wiskey()),
    ProductItem(name: "Ром хаус", type: Rum()),
    ProductItem(name: "Кул Скелетон", type: Rum()),
    ProductItem(name: "Вьехо де Кальдас", type: Rum()),
    ProductItem(name: "Коньяк хаус", type: Kognac()),
    ProductItem(name: "Армения", type: Kognac()),
    ProductItem(name: "Грузия", type: Kognac()),
    ProductItem(name: "Джин хаус", type: Gin()),
    ProductItem(name: "Барристер", type: Gin()),
    ProductItem(name: "Текила хаус", type: Tequila()),
    ProductItem(name: "Ликер хаус", type: Liquor()),
    ProductItem(name: "Самбука", type: Liquor()),
    ProductItem(name: "Абсент", type: Liquor()),
    ProductItem(name: "Егермейстер", type: Liquor()),
    ProductItem(name: "Лаветти", type: Shampagne()),
    ProductItem(name: "Ламбруско", type: Shampagne()),
    ProductItem(name: "Я хочу танцевать", type: Wine()),
    ProductItem(name: "Пощечина", type: Wine()),
  ];

  static void changeCount(int index, String count) {
    products[index].setCount = count;
    print(products[index].name + products[index].count);
  }

  static void shareProducts() {
    String shareText = products
        .where((e) => e.count != '')
        .map((e) => '${e.name} ${e.count}')
        .join('\n');

    Share.share(shareText);
  }
}
