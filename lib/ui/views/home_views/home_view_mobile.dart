part of '../../pages/home_page.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({
    Key? key,
    required this.catList,
  }) : super(key: key);

  final List<Cat> catList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            // CAT LIST
            SizedBox(
              height: size.height(context, .2),
            ),

            catList.isEmpty
                ? SizedBox(
                    height: size.height(context, .65),
                    width: size.fullWidth(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: colors.primary,
                        ),
                        SizedBox(height: size.width(context, .05)),
                        Text(
                          'Cargando información',
                          style: styles.regularMedium(color: colors.lightGrey),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: size.symmetric(context, .05, .05),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => CatCard(
                        catInfo: catList[index],
                      ),
                    ),
                  ),

            /* FutureBuilder(
              future: catService.getCats(),
              builder: (BuildContext context, AsyncSnapshot<List<Cat>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: size.height(context, .65),
                    width: size.fullWidth(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: colors.primary,
                        ),
                        SizedBox(height: size.width(context, .05)),
                        Text(
                          'Cargando información',
                          style: styles.regularMedium(color: colors.lightGrey),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      padding: size.symmetric(context, .05, .05),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => CatCard(
                        catInfo: snapshot.data![index],
                      ),
                    ),
                  );
                }
              },
            ), */
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: size.height(context, .2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors.primary,
                  colors.primaryDark,
                ],
                stops: const [.5, .9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: colors.lightGrey.withOpacity(.5),
                  offset: const Offset(0, 3),
                  blurRadius: 10.0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TITLE
                Center(
                  child: Text(
                    AppLocalizationService.of(context).translate(
                      'general_text',
                      'app_text',
                    )!,
                    style: styles.headerOne(color: colors.accent),
                  ),
                ),

                // SEARCH BAR
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                  ),
                  child: TextField(
                    cursorColor: colors.accent,
                    style: styles.regularLarge(color: colors.accent),
                    decoration: InputDecoration(
                      contentPadding: size.fromLTRB(context, .05, 0, 0, 0),
                      filled: true,
                      fillColor: colors.white,
                      hintText: AppLocalizationService.of(context).translate(
                        'general_text',
                        'search_text',
                      )!,
                      hintStyle: styles.regularLarge(color: colors.accent),
                      suffixIcon: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: SvgPicture.asset(
                          'assets/icons/search_icon.svg',
                          fit: BoxFit.scaleDown,
                          color: colors.accent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.accent, width: 2.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.accent, width: 2.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
