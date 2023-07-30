import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/detail_page.dart';
import 'package:meditation/widgets/category_boxes.dart';
import 'package:meditation/icons.dart';
import 'package:meditation/widgets/discover_card.dart';
import 'package:meditation/widgets/discover_small_card.dart';
import 'package:meditation/widgets/svg_asset.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121421),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 28.w,
                right: 18.w,
                top: 36.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Math Mindfulness",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.w,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    borderRadius: BorderRadius.circular(360),
                    onTap: onSearchIconTapped,
                    child: Container(
                      height: 35.w,
                      width: 35.w,
                      child: Center(
                        child: SvgAsset(
                          assetName: AssetName.search,
                          height: 24.w,
                          width: 24.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120.h,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 28.w,
                  ),
                  tagSearchButton("Test Anxiety"),
                  tagSearchButton("Trauma Informed Math"),
                  tagSearchButton("Algebra"),
                  tagSearchButton("Precalculus"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                        color: Color(0xff515979),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.w),
                  ),
                  GestureDetector(
                      onTap: onSeeAllTapped,
                      child: Text("See All",
                          style: TextStyle(
                              color: Color(0xff4A80F0),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w)))
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 176.w,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 28.w,
                  ),
                  DiscoverCard(
                    tag: "Math Meditation",
                    onTap: () => onDetailsTapped("Math Meditation"),
                    title: "Math Meditation",
                    subtitle:
                        "Bring peaceful Mathematical Thinking into your subconcious",
                  ),
                  SizedBox(width: 20.w),
                  DiscoverCard(
                    tag: "Algebra Healing",
                    onTap: () => onDetailsTapped("Algebra Healing"),
                    title: "Algebra Healing",
                    subtitle: "10 Days Audio and Video Series",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Text(
                "Recent",
                style: TextStyle(
                    color: Color(0xff515979),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.w),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    mainAxisExtent: 125.w,
                    mainAxisSpacing: 19.w),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  smallCard("Math Soundscapes", icons: ["headphones"]),
                  smallCard("Positive Mindset",
                      icons: ["headphones", "video_camera_back"]),
                  smallCard("Affirmations", icons: ["headphones"]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  DiscoverSmallCard smallCard(String topic, {List<String> icons = const []}) {
    //automatically generate a color based on the hash of the topic
    Color color1 = Color(topic.hashCode);
    Color color2 = Color.alphaBlend(color1, Color.fromARGB(255, 0, 0, 0));
    return DiscoverSmallCard(
        onTap: () => onDetailsTapped(topic),
        title: topic,
        gradientStartColor: color1,
        gradientEndColor: color2,
        icons: icons);
  }

  CategoryBoxes tagSearchButton(String tag) {
    return CategoryBoxes(
      text: tag,
      onPressed: (value) => filterCards(tag, value),
    );
  }

  void onSeeAllTapped() {}

  void onDetailsTapped(String topic) {
    Get.to(() => DetailPage(topic: topic), transition: Transition.rightToLeft);
  }

  void onAlgebraHealingTapped() {}

  void onSearchIconTapped() {}
}

filterCards(String tag, bool value) {}
