import 'package:flutter/material.dart';
import 'package:starbuzz_app/models/influencers.dart';
import 'package:starbuzz_app/screens/MarketPlace/followers.dart';
import 'package:starbuzz_app/screens/MarketPlace/build_sheet.dart';
import 'package:starbuzz_app/utils/custom_textfield.dart';
import 'package:starbuzz_app/utils/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  List<ImageProvider> cardImage = [
    const AssetImage("https://source.unsplash.com/random/800x600?house"),
    const AssetImage("https://source.unsplash.com/random/800x600?house")
  ];

  List<String> supportingTextList = [
    'Beautiful home to rent, recently refurbished with modern appliances...',
    'Beautiful home to rent, recently refurbished with modern appliances...'
  ];
  Map<String, bool> categoryFilteredMap = <String, bool>{};

  late List<Influencer> filterdInfluencers;
  late List<Influencer> unfilteredInfluencers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text("Market Place"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: CustomTextField(
                    labelText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey.shade200,
                    obsecureText: false,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.004,
                    bottom: MediaQuery.of(context).size.height * 0.004,
                  ),
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: IconButton(
                    iconSize: 25,
                    icon: const Icon(Icons.filter_alt_outlined),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      showModalBottomSheet(
                        enableDrag: true,
                        context: context,
                        builder: (context) => BuildSheet(categoryFilterMap: categoryFilteredMap),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                      ).whenComplete(
                        () {
                          setState(
                            () {
                              // check if any filter needs to be applied
                              if (categoryFilteredMap.entries.any((element) => element.value)) {
                                filterdInfluencers = unfilteredInfluencers
                                    // filter the influencers based on categoryFilterMap
                                    .where(
                                      (influencer) => influencer.category!.any(
                                        (category) => categoryFilteredMap[category] ?? false,
                                      ),
                                    )
                                    .toList();
                              } else {
                                filterdInfluencers = unfilteredInfluencers;
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            FutureBuilder<List<Influencer>>(
              future: StarBuzzService.influencers(),
              builder: (context, AsyncSnapshot<List<Influencer>> snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  unfilteredInfluencers = snapshot.data!;
                  if (categoryFilteredMap.entries.any((element) => element.value)) {
                    filterdInfluencers = snapshot.data!
                        .where(
                          (influencer) => influencer.category!.any(
                            (category) => categoryFilteredMap[category] ?? false,
                          ),
                        )
                        .toList();
                  } else {
                    filterdInfluencers = snapshot.data!;
                  }

                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filterdInfluencers.length,
                    itemBuilder: (context, i) {
                      return buildCard(
                          imageUrl: filterdInfluencers[i].photo,
                          name: filterdInfluencers[i].name,
                          followerContainerTop: 150,
                          followerContainerright: MediaQuery.of(context).size.height * 0.01);
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Card buildCard({String? imageUrl, String? name, required double followerContainerTop, required double followerContainerright}) {
    var supportingText = 'Neon Lighting of brightly glowing , electrified glass tubes or bulbs that contain rarefare neon or other';
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 4.0,
      child: Stack(
        children: [
          Followers(top: followerContainerTop, right: followerContainerright),
          Column(
            children: [
              SizedBox(
                  height: 200.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Ink.image(
                        image: (imageUrl == null || imageUrl.isEmpty) ? Image.asset('assets/starbuzz_logo.png').image : NetworkImage(imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  name!,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(supportingText),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "#neon #Light #bright",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.facebookF, color: Colors.grey)),
                  IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.twitter, color: Colors.grey)),
                  IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.instagram, color: Colors.grey)),
                  IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.youtube, color: Colors.grey))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
