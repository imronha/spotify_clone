import 'package:flutter/material.dart';

// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final SnackBar currentSong = const SnackBar(content: Text('Showing Current Song'));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final TextStyle topMenuStyle = new TextStyle(
      fontFamily: 'Avenir next',
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
          // color: Colors.red,
          child: Center(
        child: ListView(
          children: <Widget>[
            // Container(
            //   height: 430,
            //   // color: Colors.blue,
            //   decoration: new BoxDecoration(
            //     image: new DecorationImage(
            //         image: new AssetImage("lib/assets/starwars1.jpg"),
            //         fit: BoxFit.fill),
            //   ), // we can change to be backgroundimage instead
            // ),
            makeSongWidget("Recently Played"),
            makePlaylistWidget("Made for You"),
            makePlaylistWidget("Popular Playlists"),
            makePlaylistWidget("More of what you like"),
          ],
        ),
      )),
    );
  }

  Widget makePlaylistWidget(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 320,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]),
          ),
          Container(
            height: 260,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makePlaylistContainers()),
          )
        ],
      ),
    );
  }

// Widget currentSongWidget(BuildContext context) {
//   return Scaffold(
//     key: scaffoldKey,
//     appBar: AppBar(
//       title: const Text('Current Song Widget'),
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.add_alert),
//           tooltip: 'Show Snackbar',
//           onPressed: () {
//             scaffoldKey.currentState.showSnackBar(currentSong);
//           },
//         ),
//       ],
//     ),
//     body: const Center(
//       child: Text(
//         'This is the home page',
//         style: TextStyle(fontSize: 24),
//       ),
//     ),
//   );
// }
  Widget makeSongWidget(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 200,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]),
          ),
          Container(
            height: 170,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContainers()),
          )
        ],
      ),
    );
  }

  int counter = 0;
  List<Widget> makeContainers() {
    List<Container> songList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      songList.add(new Container(
          padding: EdgeInsets.all(5),
          height: 200,
          child: Column(children: <Widget>[
            Expanded(
                child: Image(
              image: AssetImage("lib/assets/" + counter.toString() + ".jpg"),
            )),
            Container(
                height: 20,
                child: Text(
                  'Song info here',
                  style: TextStyle(fontSize: 10),
                ))
          ])));
      if (counter == 12) {
        counter = 0;
      }
    }
    return songList;
  }

  List<Widget> makePlaylistContainers() {
    List<Container> songList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      songList.add(new Container(
          padding: EdgeInsets.all(5),
          height: 250,
          child: Column(children: <Widget>[
            Expanded(
                child: Image(
              image: AssetImage("lib/assets/" + counter.toString() + ".jpg"),
            )),
            Container(
                height: 20,
                child: Text(
                  'Playlist Name Here',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                )),
            Container(
                height: 10,
                child: Text('Playlist Info', style: TextStyle(fontSize: 9)))
          ])));
      if (counter == 12) {
        counter = 0;
      }
    }
    return songList;
  }
}
