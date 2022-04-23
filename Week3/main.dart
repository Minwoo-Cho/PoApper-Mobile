import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'YouTube'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);




  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title: Row(children: [Container(padding: EdgeInsets.only(right: 5),width: 50, child:
        Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/2560px-YouTube_full-color_icon_%282017%29.svg.png")),
          Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold))]),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 500, child: ListView(children:[
            Video(subtitle: "코마 1M View 7 Days Ago",
              imageLink: "https://i.ytimg.com/vi/3fQVwM52hOQ/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD-ntfaZ2f0JjWeiPw4byITebP7aw",
              title: "생존일지 최종장", profile: "https://yt3.ggpht.com/ytc/AKedOLTFeyeenuvKEiqGaivcOSlZg9pWMtPvRZ3ltimQKQ=s68-c-k-c0x00ffffff-no-rj"),
              Video(subtitle: "코마 1M View 7 Days Ago",
                  imageLink: "https://i.ytimg.com/vi/3fQVwM52hOQ/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD-ntfaZ2f0JjWeiPw4byITebP7aw",
                  title: "생존일지 최종장", profile: "https://yt3.ggpht.com/ytc/AKedOLTFeyeenuvKEiqGaivcOSlZg9pWMtPvRZ3ltimQKQ=s68-c-k-c0x00ffffff-no-rj"),
              Video(subtitle: "코마 1M View 7 Days Ago",
                  imageLink: "https://i.ytimg.com/vi/3fQVwM52hOQ/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD-ntfaZ2f0JjWeiPw4byITebP7aw",
                  title: "생존일지 최종장", profile: "https://yt3.ggpht.com/ytc/AKedOLTFeyeenuvKEiqGaivcOSlZg9pWMtPvRZ3ltimQKQ=s68-c-k-c0x00ffffff-no-rj"),
              Container(margin: EdgeInsets.all(5),child: Row(children: [
                Container(width: 30, child: Image.network("https://www.edigitalagency.com.au/wp-content/uploads/Youtube-shorts-icon-png.png"))
                ,
                Text("Shorts", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)],),),
              SizedBox(height: 270, child: ListView(scrollDirection: Axis.horizontal, children: [
                Shorts(title: "다람쥐",
                    imageLink: "https://ytshortsvideo.com/wp-content/uploads/2021/07/ytshorts-1080x1920-1-576x1024.jpg",
                    desc: "1M Veiws"),
                Shorts(title: "다람쥐",
                    imageLink: "https://ytshortsvideo.com/wp-content/uploads/2021/07/ytshorts-1080x1920-1-576x1024.jpg",
                    desc: "1M Veiws"),
                Shorts(title: "다람쥐",
                    imageLink: "https://ytshortsvideo.com/wp-content/uploads/2021/07/ytshorts-1080x1920-1-576x1024.jpg",
                    desc: "1M Veiws"),
                Shorts(title: "다람쥐",
                    imageLink: "https://ytshortsvideo.com/wp-content/uploads/2021/07/ytshorts-1080x1920-1-576x1024.jpg",
                    desc: "1M Veiws"),
                Shorts(title: "다람쥐",
                    imageLink: "https://ytshortsvideo.com/wp-content/uploads/2021/07/ytshorts-1080x1920-1-576x1024.jpg",
                    desc: "1M Veiws")
              ],),),
              Video(subtitle: "코마 1M View 7 Days Ago",
                  imageLink: "https://i.ytimg.com/vi/3fQVwM52hOQ/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD-ntfaZ2f0JjWeiPw4byITebP7aw",
                  title: "생존일지 최종장", profile: "https://yt3.ggpht.com/ytc/AKedOLTFeyeenuvKEiqGaivcOSlZg9pWMtPvRZ3ltimQKQ=s68-c-k-c0x00ffffff-no-rj"),
              Video(subtitle: "코마 1M View 7 Days Ago",
                  imageLink: "https://i.ytimg.com/vi/3fQVwM52hOQ/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD-ntfaZ2f0JjWeiPw4byITebP7aw",
                  title: "생존일지 최종장", profile: "https://yt3.ggpht.com/ytc/AKedOLTFeyeenuvKEiqGaivcOSlZg9pWMtPvRZ3ltimQKQ=s68-c-k-c0x00ffffff-no-rj")

            ])
    )

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class Video extends StatelessWidget {
  const Video({Key? key, required this.imageLink, required this.title, required this.subtitle, required this.profile}) : super(key: key);
  final String imageLink;
  final String title;
  final String subtitle;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom:5),

            child:
        Image.network(imageLink)),

        Row(children: [
          Container(
            padding: EdgeInsets.only(right: 5),
            width: 40,
              child:
          Image.network(profile)),

        Column(crossAxisAlignment: CrossAxisAlignment.start ,children:[


        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text(subtitle, style: TextStyle())])])


      ],
    ),);
  }
}


class Shorts extends StatelessWidget {
  const Shorts({Key? key, required this.imageLink, required this.title, required this.desc}) : super(key: key);
  final String imageLink;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(5),child: SizedBox(width: 147,height: 266.66, child: Stack(
      children: [
        Container(padding: EdgeInsets.all(0),child:
        Image.network(imageLink)),
        Container(
          padding: EdgeInsets.all(0),
        alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withAlpha(0), Colors.black.withAlpha(50)])),

            child:
                Container(padding: EdgeInsets.only(left:5, bottom: 5),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,children: [Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
        Text(desc, style: TextStyle(color: Colors.white),)]),
                ))

      ],
    ),));
  }
}
