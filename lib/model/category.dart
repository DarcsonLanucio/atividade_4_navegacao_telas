enum Category { doces, salgadas, bebidas }

extension CategoryX on Category {
  String get label {
    switch (this) {
      case Category.doces: return 'Doces';
      case Category.salgadas: return 'Salgadas';
      case Category.bebidas: return 'Bebidas';
    }
  }

  static Category fromLabel(String s) {
    switch (s) {
      case 'Doces': return Category.doces;
      case 'Salgadas': return Category.salgadas;
      case 'Bebidas': return Category.bebidas;
      default: return Category.doces;
    }
  }
}
