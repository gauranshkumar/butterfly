import 'package:butterfly/config/colors.dart';
import 'package:butterfly/models/music_card.dart';
import 'package:butterfly/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card();
  }
}

class Card extends StatefulWidget {
  const Card({Key key}) : super(key: key);
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  static final _cardList = cards;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount: _cardList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, RouteNames.albumPage),
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: cards[index].background),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: cards[index].illustration,
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      height: 36,
                      child: Text(
                        cards[index].title,
                        style: TextStyle(
                          color: BrandColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 34,
                        child: Text(
                          cards[index].subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BrandColors.black,
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1.2 : 1.3);
          }),
    );
  }
}
