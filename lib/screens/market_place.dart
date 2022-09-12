import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:starbuzz_app/screens/nav_bar.dart';
import 'package:starbuzz_app/utils/categoryButton.dart';
import 'package:starbuzz_app/utils/custom_textfield.dart';
import 'package:starbuzz_app/utils/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  SolidController _controller = SolidController();
  List<ImageProvider> cardImage = [
    const AssetImage("https://source.unsplash.com/random/800x600?house"),
    const AssetImage("https://source.unsplash.com/random/800x600?house")
  ];

  List<String> supportingTextList = [
    'Beautiful home to rent, recently refurbished with modern appliances...',
    'Beautiful home to rent, recently refurbished with modern appliances...'
  ];

  @override
  Widget build(BuildContext context) {
    var _formattedNumber = NumberFormat.compact().format(23000);
    print('Formatted Number is: $_formattedNumber');
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 130,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.arrow_back_ios_new_outlined),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Market Place",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: CustomTextField(
                    labelText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey.shade200,
                    obsecureText: false,
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.008,
                      bottom: MediaQuery.of(context).size.height * 0.008,
                    ),
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: IconButton(
                      iconSize: 25,
                      icon: const Icon(Icons.filter_alt_outlined),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        //StarBuzzService.influencers();
                        showModalBottomSheet(
                          enableDrag: true,
                          context: context,
                          builder: (context) => buildsheet(),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: StarBuzzService.influencers(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return buildCard(
                          image: snapshot.data[i].photo,
                          name: snapshot.data[i].name,
                          followerContainerTop: MediaQuery.of(context).size.height * 0.2,
                          followerContainerTright: MediaQuery.of(context).size.height * 0.01);
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

  Card buildCard({required String image, required String name, required double followerContainerTop, required double followerContainerTright}) {
    var cardImage = NetworkImage(image);
    var supportingText = 'Beautiful home to rent, recently refurbished with modern appliances...';
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      elevation: 4.0,
      child: Stack(
        children: [
          followers(top: followerContainerTop, right: followerContainerTright),
          Column(
            children: [
              SizedBox(
                height: 200.0,
                child: Ink.image(
                  image: cardImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
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

Widget followers({required double top, required double right}) {
  return Positioned(
    top: top,
    right: right,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            style: BorderStyle.none,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
      height: 40,
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Expanded(
            child: Icon(
              Icons.supervisor_account_outlined,
              size: 20,
            ),
          ),
          Expanded(child: Text("23Kkk")),
        ],
      ),
    ),
  );
}

Widget buildsheet() {
  return Wrap(
    children: [
      Row(
        children: const [
          Expanded(
            child: ListTile(
              title: Text(
                'Niche',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: Divider(
            color: Colors.black,
            thickness: 0.5,
          ))
        ],
      ),
      Container(
        width: 150,
        padding: EdgeInsets.all(10),
        child: CategoryButton(categoryTitle: "Platform"),
      ),
      Row(
        children: const [
          Expanded(
            child: ListTile(
              title: Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.black,
              thickness: 0.25,
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Flexible(
              child: CategoryButton(
            categoryTitle: "Beauty",
          )),
          Flexible(
              child: CategoryButton(
            categoryTitle: "Fashion",
          )),
          Flexible(
              child: CategoryButton(
            categoryTitle: "Food",
          )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Flexible(
              child: CategoryButton(
            categoryTitle: "Sport",
          )),
          Flexible(
              child: CategoryButton(
            categoryTitle: "Tech",
          )),
          Flexible(
              child: CategoryButton(
            categoryTitle: "Fitness",
          )),
        ],
      ),
    ],
  );
}
