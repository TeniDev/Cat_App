import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/utils/utils.dart';
import 'package:cat_app/services/services.dart';

class CatCard extends StatelessWidget {
  const CatCard({
    Key? key,
    required this.catInfo,
    required this.goToDetail,
  }) : super(key: key);

  final Cat catInfo;
  final Function goToDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: size.vertical(context, .025),
      padding: size.all(context, .05),
      width: size.fullWidth(context),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colors.lightGrey.withOpacity(.2),
            offset: const Offset(0, 0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // NAME
              Text(
                catInfo.name!,
                style: styles.boldMedium(),
              ),

              //  MORE INFO
              InkWell(
                onTap: () => goToDetail(context, catInfo),
                child: Container(
                  padding: size.symmetric(context, .02, .01),
                  decoration: BoxDecoration(
                    color: colors.accent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    AppLocalizationService.of(context).translate(
                      'cat_card_text',
                      'see_more_text',
                    )!,
                    style: styles.regularMedium(color: colors.white),
                  ),
                ),
              ),
            ],
          ),

          // IMAGE
          Container(
            margin: size.top(context, .05),
            padding: size.horizontal(context, .025),
            width: size.fullWidth(context),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Hero(
              tag: '${catInfo.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  catInfo.imageCat!.url!,
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Icon(
                        Icons.image_rounded,
                        size: size.width(context, .3),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: size.width(context, .05)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // COUNTRY ORIGIN
              Text(
                catInfo.origin!,
                style: styles.mediumLarge(),
              ),
              Column(
                children: [
                  // LABEL
                  Text(
                    AppLocalizationService.of(context).translate(
                      'cat_card_text',
                      'intelligence_text',
                    )!,
                    style: styles.regularSmall(),
                  ),
                  SizedBox(height: size.width(context, .01)),
                  // RATING
                  RatingBarIndicator(
                    rating: catInfo.intelligence!.toDouble(),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: size.width(context, .05),
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
