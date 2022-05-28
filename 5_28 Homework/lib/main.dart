import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:server_seminar/movie_api.dart';
import 'package:server_seminar/schedule_api.dart';
import 'package:server_seminar/movielist_api.dart';

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

        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'TV Show Information'),
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

  TextEditingController textEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController countryEditingController = TextEditingController();
  MovieInfo movieInfo = MovieInfo();
  List<Schedule> schedule = [];
  MovieInfo detailSchedule = MovieInfo();
  List<MovieList> movieList = [];


  Future<void> _searchMovie() async {
    final dio = Dio(); // Provide a dio instance
    final client = MovieRestClient(dio);

    movieInfo = await client.getMovieInfo(textEditingController.text);
    setState(() {

    });
  }

  Future<void> _searchSchedule() async {
    final dio = Dio(); // Provide a dio instance
    final client = ScheduleRestClient(dio);

    schedule = await client.getSchedule(dateEditingController.text, countryEditingController.text);
    setState(() {

    });
  }

  Future<void> _detailScheduleLoad(String q) async {
    final dio = Dio(); // Provide a dio instance
    final client = MovieRestClient(dio);

    detailSchedule = await client.getMovieInfo(q);
    setState(() {

    });
  }


  Future<void> _movieListLoad() async {
    final dio = Dio(); // Provide a dio instance
    final client = MovieListRestClient(dio);

    movieList = await client.getMovieList(textEditingController.text);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child:
        ListView( children:
        [Container(
          margin: EdgeInsets.all(30),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("SERACH TV SHOW INFORMATION"),


              TextField(
                controller: textEditingController,

              ),
              GestureDetector(
                onTap: _movieListLoad,
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.cyan.shade200,
                  child: Text("Search TV Show"),
                ),
              ),

              for (var element in movieList) Container(color: Colors.cyan.shade50, width: MediaQuery.of(context).size.width*0.8,margin: EdgeInsets.all(30),child: Column(children: [
                  Text("Title: ${element.name??"N/A"}"),
                  Text("in ${element.language??"N/A"}"),
                  Text("from ${element.network??"N/A"}"),
                  Text("first premiered on ${element.premiered??"N/A"}"),
                  //Text("${m.summary??"N/A"}"),
                  FlatButton(onPressed: () async {
                    await _detailScheduleLoad(element.name??"");

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return DetailView(title: detailSchedule.name, language: detailSchedule.language, channel: detailSchedule.network, date: detailSchedule.premiered, summary: detailSchedule.summary, genre: detailSchedule.genres, image: detailSchedule.image);
                    }));



                  }, child: Text("Detail>")),

                ],),),
              //MovieView( title: movieInfo.name, language: movieInfo.language, channel: movieInfo.network, date: movieInfo.premiered, summary: movieInfo.summary, genre: movieInfo.genres, image: movieInfo.image,),
              //Text("${movieInfo.id??""}"),
              //Text("${movieInfo.name??""}"),
              //Text("${movieInfo.language??""}"),
              //Text("${movieInfo.runtime??""}"),



            ],
          ),
        ),

      Container(
          margin: EdgeInsets.all(30),
          child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("SERACH SCHEDULE"),
                Text("Date YYYY-MM-DD"),
                TextField(
                  controller: dateEditingController,

                ),
                Text("Country Code (KR, US ...)"),
                TextField(
                  controller: countryEditingController,

                ),

                GestureDetector(
                  onTap: _searchSchedule,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.cyan.shade200,
                    child: Text("Search Schedule"),
                  ),
                ),



                for (var m in schedule) Container(color: Colors.cyan.shade50, width: MediaQuery.of(context).size.width*0.8,margin: EdgeInsets.all(30),child: Column(children: [
                  Text("Title: ${m.title??"N/A"}"),
                  Text("Date: ${m.airdate??"N/A"}"),
                  Text("Time: ${m.airtime??"N/A"}"),
                  //Text("${m.summary??"N/A"}"),
                  FlatButton(onPressed: () async {
                    await _detailScheduleLoad(m.title??"");

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return DetailView(title: detailSchedule.name, language: detailSchedule.language, channel: detailSchedule.network, date: detailSchedule.premiered, summary: detailSchedule.summary, genre: detailSchedule.genres, image: detailSchedule.image);
                    }));



                  }, child: Text("Detail>")),

                ],),),

                ]) )


  ])
      ),

    );
  }
}


class MovieView extends StatelessWidget {

  const MovieView({Key? key, required this.title, required this.language, required this.channel, required this.date, required this.summary, required this.genre, required this.image}) : super(key: key);
  final String? title;
  final String? language;
  final String? channel;
  final String? date;
  final String? summary;
  final List<String>? genre;
  final String? image;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan.shade50,
      width: MediaQuery.of(context).size.width*0.8,
      margin: EdgeInsets.all(5),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            Text("Title: ${title??"N/A"}"),
            Text("in ${language??"N/A"}"),
            Text("from ${channel??"N/A"}"),
            Text("first premiered on ${date??"N/A"}"),
            //Text(summary??"N/A"),

            for (var element in genre??[]) Text(element),



            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return DetailView(title: title, language: language, channel: channel, date: date, summary: summary, genre: genre, image: image);
              }));

            }, child: Text("Detail>")),

          ],)

    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.title, required this.language, required this.channel, required this.date, required this.summary, required this.genre, required this.image}) : super(key: key);

  final String? title;
  final String? language;
  final String? channel;
  final String? date;
  final String? summary;
  final List<String>? genre;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child:
          ListView(
            children: [

              Container(child: Column(children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.home)),

                Container(width: MediaQuery.of(context).size.width*0.8,child: Image.network(image??"https://www.chanchao.com.tw/images/default.jpg"),),


                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Title: ${title??"N/A"}"),
                  Text("in ${language??"N/A"}"),
                  Text("from ${channel??"N/A"}"),
                  Text("first premiered on ${date??"N/A"}"),
                  Text(summary??"N/A"),

                  for (var element in genre??[]) Text(element),

                ])
              ],),)

              ,],),



      )



    );
  }
}
