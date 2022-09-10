import 'package:flutter/material.dart';
import 'package:starbuzz_app/screens/nav_bar.dart';

import 'package:starbuzz_app/utils/custom_textfield.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          "Market Place",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: CustomTextField(
                    labelText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildCard();
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Card buildCard() {
    var cardImage = const NetworkImage('https://source.unsplash.com/random/800x600?house');
    var supportingText = 'Beautiful home to rent, recently refurbished with modern appliances...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.snapchat)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.snapchat))
              ],
            )
          ],
        ));
  }
}
