import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Compaigns",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.95,
          child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 20,
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            itemCount: 5,
            itemBuilder: buildImageCard,
            staggeredTileBuilder: (index) => StaggeredTile.count(2, index.isEven ? 1.75 : 1.5),
          ),
        ),
      ],
    );
  }
}

final List<Color> listColors = [
  const Color.fromARGB(255, 236, 232, 254),
  const Color.fromARGB(255, 230, 244, 255),
  const Color.fromARGB(255, 255, 241, 220),
  const Color.fromARGB(255, 227, 239, 217),
  const Color.fromARGB(255, 251, 231, 228)
];

final List<Color> listIconColors = [Colors.indigo, Colors.blue, Colors.orange, Colors.green, Colors.red];

final List<IconData> listOfIcons = [Icons.checklist, Icons.repeat, Icons.person_add_alt, Icons.pending_outlined, Icons.error];

final List<String> titles = ["Completed", "Ongoing", "Initiated by you", "Pending", "Rejected"];
final List<String> numberOfComapnies = ['15', '24', '15', '24', '15'];

Widget buildImageCard(BuildContext context, int index) {
  double bigBubbleRadius = 70;
  double smallBubbleRadius = 30;
  return Card(
    color: listColors[index],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Stack(
      children: [
        bubbleWidget(
          bubbleRadius: bigBubbleRadius,
          top: -50,
          left: MediaQuery.of(context).size.width * 0.25,
          bubbleColor: const Color.fromARGB(140, 242, 255, 255),
        ),
        bubbleWidget(
          bubbleRadius: smallBubbleRadius,
          top: 30,
          left: MediaQuery.of(context).size.width * 0.2,
          bubbleColor: const Color.fromARGB(150, 242, 254, 255),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Icon(
                listOfIcons[index],
                color: listIconColors[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(titles[index],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "${numberOfComapnies[index]} Campaigns",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget bubbleWidget({required double bubbleRadius, required double top, required double left, required Color bubbleColor}) {
  return Positioned(
    top: top,
    left: left,
    child: Container(
      width: bubbleRadius * 2,
      height: bubbleRadius * 2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(bubbleRadius), color: bubbleColor),
    ),
  );
}
