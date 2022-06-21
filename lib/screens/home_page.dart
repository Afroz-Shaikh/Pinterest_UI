import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
      'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    ];
    TabController? _tab;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leadingWidth: 0,
            flexibleSpace: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabBar(
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    indicatorWeight: 1,
                    labelPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.symmetric(
                        // horizontal: 60
                        horizontal: MediaQuery.of(context).size.width / 3),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tab,
                    tabs: [
                      Tab(
                          height: 20,
                          child: Text(
                            'Browse',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          )),
                      Tab(
                        height: 20,
                        child: Text(
                          'Watch',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            Container(
                color: Colors.black26,
                child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    pattern: [
                      WovenGridTile(1),
                      WovenGridTile(
                        5 / 7,
                        crossAxisRatio: 0.9,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: imageList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )),
            Container(
              color: Colors.blue,
            ),
          ])),
    );
  }
}
