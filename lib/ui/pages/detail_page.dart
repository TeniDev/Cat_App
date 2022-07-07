import 'package:cat_app/services/services.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/utils/utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.catInfo,
  }) : super(key: key);

  final Cat catInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: Text(
          catInfo.name!,
          style: styles.boldLarge(color: colors.white),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: size.width(context, .05),
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.fullHeight(context),
        width: size.fullWidth(context),
        child: Column(
          children: [
            Padding(
              padding: size.fromLTRB(context, .05, .05, .05, 0),
              child: Hero(
                tag: '${catInfo.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: size.width(context, .6),
                    width: size.fullWidth(context),
                    child: Image.network(
                      catInfo.imageCat!.url!,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: size.all(context, .075),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    catInfo.description!,
                    textAlign: TextAlign.justify,
                    style: styles.lightMedium(),
                  ),
                  SizedBox(height: size.width(context, .05)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'origin_text',
                        )!,
                        style: styles.boldLarge(),
                      ),
                      SizedBox(height: size.width(context, .025)),
                      Text(
                        catInfo.origin!,
                        style: styles.lightSmall(),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width(context, .05)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'temperament_text',
                        )!,
                        style: styles.boldLarge(),
                      ),
                      SizedBox(height: size.width(context, .025)),
                      Text(
                        catInfo.temperament!,
                        style: styles.lightMedium(),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width(context, .05)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'life_span_text',
                        )!,
                        style: styles.boldLarge(),
                      ),
                      SizedBox(height: size.width(context, .025)),
                      Text(
                        "${catInfo.lifeSpan!} years",
                        style: styles.lightMedium(),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width(context, .05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'intelligence_text',
                        )!,
                        style: styles.boldLarge(),
                      ),
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
                  SizedBox(height: size.width(context, .05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'adaptability_text',
                        )!,
                        style: styles.boldLarge(),
                      ),
                      RatingBarIndicator(
                        rating: catInfo.adaptability!.toDouble(),
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
                  SizedBox(height: size.width(context, .05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'child_friendly_text',
                        )!,
                        style: styles.boldLarge(),
                      ),
                      RatingBarIndicator(
                        rating: catInfo.childFriendly!.toDouble(),
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
                  SizedBox(height: size.width(context, .05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'health_issues_text',
                        )!,
                        style: styles.boldLarge(),
                      ),
                      RatingBarIndicator(
                        rating: catInfo.healthIssues!.toDouble(),
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
                  SizedBox(height: size.width(context, .1)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: colors.primary,
                      onPrimary: colors.accent,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      final Uri url = Uri.parse(catInfo.wikipediaUrl!);
                      launchUrl(url);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        AppLocalizationService.of(context).translate(
                          'detail_cat_text',
                          'more_info_text',
                        )!,
                        style: styles.boldLarge(color: colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
