import 'package:bannerbot_youtube_thumbnail/src/modules/generate_thumbnails/models/thumbnail_data.dart';
import 'package:bannerbot_youtube_thumbnail/src/utils/common.dart';
import 'package:bannerbot_youtube_thumbnail/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ThumbnailImage extends StatelessWidget {
  final ThumbnailData thumbnailData;

  const ThumbnailImage({super.key, required this.thumbnailData});

  CustomTextSize getTextSize() {
    int concatenatedTextLength = 0;
    for (var text in thumbnailData.thumbnailTexts) {
      concatenatedTextLength += text.value?.length ?? 0;
    }
    if (concatenatedTextLength > 32) {
      return CustomTextSize.regular;
    }
    return CustomTextSize.medium;
  }

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment humanImageAlignment = CrossAxisAlignment.center;
    CrossAxisAlignment textItemsAlignment = CrossAxisAlignment.center;

    // image & texts alignment will always be opposite for readability
    if (thumbnailData.humanImagePosition == 'left') {
      humanImageAlignment = CrossAxisAlignment.start;
      textItemsAlignment = CrossAxisAlignment.end;
    } else if (thumbnailData.humanImagePosition == 'right') {
      humanImageAlignment = CrossAxisAlignment.end;
      textItemsAlignment = CrossAxisAlignment.start;
    }
    return Container(
        width: 300,
        height: 168.75,
        decoration: const BoxDecoration(color: Colors.amber),
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: humanImageAlignment,
                children: [
                  thumbnailData.humanImageUrl == null
                      ? Container()
                      : Image.network(
                          thumbnailData.humanImageUrl!,
                          width: 100,
                        )
                ],
              ),
            ),
            SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: textItemsAlignment,
                children: thumbnailData.thumbnailTexts
                    .map((item) => Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(4),
                          color: getColorFromHex(item.backgroundColor, null),
                          child: CustomText(
                            item.value ?? '',
                            size: getTextSize(),
                            style: TextStyle(
                                color: getColorFromHex(item.color, null)),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ));
  }
}
