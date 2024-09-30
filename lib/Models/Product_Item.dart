class ProductItem {
  final String name;
  final TypeOfProduct type;
  String count = '';

  ProductItem({required this.name, required this.type});
}

enum TypeOfProductCount {
  peaceMeal,
  liter;
}

abstract class TypeOfProduct {
  String name;
  TypeOfProductCount type;

  TypeOfProduct({required this.name, required this.type});
}

class Vodka implements TypeOfProduct {
  @override
  String name = 'Водка';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Gin implements TypeOfProduct {
  @override
  String name = 'Джин';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Wiskey implements TypeOfProduct {
  @override
  String name = 'Виски';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Rum implements TypeOfProduct {
  @override
  String name = 'Ром';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Vermouth implements TypeOfProduct {
  @override
  String name = 'Вермут';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Kognac implements TypeOfProduct {
  @override
  String name = 'Коньяк';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Wine implements TypeOfProduct {
  @override
  String name = 'Вино';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Shampagne implements TypeOfProduct {
  @override
  String name = 'Игристое вино';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Tequila implements TypeOfProduct {
  @override
  String name = 'Текила';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class Liquor implements TypeOfProduct {
  @override
  String name = 'Ликеры и биттеры';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class NonAlcoholByLiter implements TypeOfProduct {
  @override
  String name = 'Безалкогольные напитки';

  @override
  TypeOfProductCount type = TypeOfProductCount.liter;
}

class NonAlcoholByPeaceMeal implements TypeOfProduct {
  @override
  String name = 'Безалкогольные напитки';

  @override
  TypeOfProductCount type = TypeOfProductCount.peaceMeal;
}

class Beer implements TypeOfProduct {
  @override
  String name = 'Пиво';

  @override
  TypeOfProductCount type = TypeOfProductCount.peaceMeal;
}
