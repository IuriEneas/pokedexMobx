abstract class StringUtil {
  static List<String> splitPaginationUrl(String url) {
    var strings = url.split('=');
    var offset = strings[1].split('&')[0];
    var limit = strings[2];

    return [offset, limit];
  }

  static String formatName(String name) {
    var nameParts = name.split('-');
    var formattedName = '';

    for (var parts in nameParts) {
      formattedName += '$parts ';
    }

    formattedName = formattedName[0].toUpperCase() +
        formattedName.substring(1).toLowerCase();

    String truncatedText = formattedName.length > 12
        ? '${formattedName.substring(0, 9)}...'
        : formattedName;

    return truncatedText;
  }

  static String formatId(int id) {
    return id.toString().padLeft(3, '0');
  }
}
