import 'package:cart_demo/core/strings.dart';

class ImageUtils {
  static final validImageMap = {
    'asian': 'asian',
    'mexican': 'mexican',
    'fast-food': 'fast-food',
    'pizza': 'pizza',
    'pasta': 'pasta',
  };
  static String validImage(name) {
    return kImagePath + (validImageMap[name] ?? 'fast-food');
  }
}
