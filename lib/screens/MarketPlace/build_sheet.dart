import 'package:flutter/material.dart';
import 'package:starbuzz_app/screens/MarketPlace/filter_chip.dart';
import 'package:starbuzz_app/utils/database.dart';

class BuildSheet extends StatefulWidget {
  Map<String, bool> categoryFilterMap;
  BuildSheet({Key? key, required this.categoryFilterMap}) : super(key: key);

  @override
  State<BuildSheet> createState() => _BuildSheetState();
}

class _BuildSheetState extends State<BuildSheet> {
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(10),
          child: FilterCat(
            categoryName: "PlatForm",
            isSelected: false,
            onSelect: (isSlect) {},
          ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: StarBuzzService.categories(),
            builder: ((context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.hasData) {
                snapshot.data!.forEach(
                  (element) => widget.categoryFilterMap.putIfAbsent(element, () => false),
                );

                return Wrap(
                  runSpacing: 5.0,
                  spacing: 5.0,
                  children: widget.categoryFilterMap.entries
                      .map((categoryEntry) => FilterCat(
                            categoryName: categoryEntry.key,
                            isSelected: categoryEntry.value,
                            onSelect: (selected) {
                              setState(() {
                                widget.categoryFilterMap.update(categoryEntry.key, (value) => selected);
                              });
                            },
                          ))
                      .toList(),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ),
        )
      ],
    );
  }
}
