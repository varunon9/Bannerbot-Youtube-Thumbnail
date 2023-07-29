const List<String> defaultBackgroundImageKeywords = [];
const List<ThumbnailText> defaultThumbnailTexts = [];

//enum HumanPosition { left, right, center }

class ThumbnailText {
  String? value;
  String? backgroundColor;
  String? color;

  ThumbnailText({this.value, this.backgroundColor, this.color});

  factory ThumbnailText.fromJson(Map<String, dynamic> jsonData) {
    return ThumbnailText(
        value: jsonData['value'] as String?,
        backgroundColor: jsonData['background_color'] as String?,
        color: jsonData['color'] as String?);
  }
}

class ThumbnailData {
  String? backgroundImageUrl;
  List<String> backgroundImageKeywords;
  String? humanImageUrl;
  String? humanImageDescription;
  String? humanPosition;
  List<ThumbnailText> thumbnailTexts;

  ThumbnailData(
      {this.backgroundImageUrl,
      this.backgroundImageKeywords = defaultBackgroundImageKeywords,
      this.humanImageUrl,
      this.humanImageDescription,
      this.humanPosition,
      this.thumbnailTexts = defaultThumbnailTexts});

  factory ThumbnailData.fromJson(Map<String, dynamic> jsonData) {
    List<String> backgroundImageKeywords =
        List<String>.from(jsonData['background_image_keywords']);
    List<ThumbnailText> thumbnailTexts = [];
    List<dynamic> textsArr = jsonData['thumbnail_texts'];
    for (var element in textsArr) {
      thumbnailTexts.add(ThumbnailText.fromJson(element));
    }

    return ThumbnailData(
        backgroundImageUrl: jsonData['background_image_url'] as String?,
        backgroundImageKeywords: backgroundImageKeywords,
        humanImageUrl: jsonData['human_image_url'] as String?,
        humanImageDescription: jsonData['human_image_description'] as String?,
        humanPosition: jsonData['human_position'] as String?,
        thumbnailTexts: thumbnailTexts);
  }

  Map<String, dynamic> toJson() => {
        'background_image_url': backgroundImageUrl,
        'background_image_keywords': backgroundImageKeywords,
        'human_image_url': humanImageUrl,
        'human_image_description': humanImageDescription,
        'human_position': humanPosition,
        'thumbnail_texts': thumbnailTexts
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
