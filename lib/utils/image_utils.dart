class ImageUtils {
  static final validImageMap = {
    'asian': 'asian',
    'mexican': 'mexican',
    'fast-food': 'fast-food',
    'pizza': 'pizza',
    'pasta': 'pasta',
  };
  static String validImage(name) {
    return validImageMap[name] ?? 'fast-food';
  }
}
