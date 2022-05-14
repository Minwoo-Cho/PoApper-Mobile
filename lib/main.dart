import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => FormProvider()),
      ChangeNotifierProvider(create: (_) => MovieProvider()),
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '영화 취향 테스트'),
    ),);

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
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [FlatButton(onPressed: () {
              context.read<FormProvider>().increaseAge();
            }, child: Text("Increase age"),),
              FlatButton(onPressed: () {
                context.read<FormProvider>().decreaseAge();
              }, child: Text("Decrease age"),),],),

            TextField(onChanged: (String str) {
              context.read<FormProvider>().changeName(str);

            },),
            Text('${context.watch<FormProvider>().age}살 ${context.watch<FormProvider>().name}입니다.'),
            TextField(onChanged: (String str) {
              context.read<MovieProvider>().changeJenre(str);
            },),
            Text('좋아하는 장르는 ${context.watch<MovieProvider>().genre}입니다.'),

            Text("좋아하는 영화를 선택하세요."),

            Row(children: [Text("Doctor Strange in the Muliverse of Madness"), Checkbox(value:
            context.watch<FavoriteProvider>().stat0, onChanged: (value) {
              context.read<FavoriteProvider>().change0(value);
            },
            ),],),

            Row(children: [Text("Thor: Love and Thunder"), Checkbox(value:
            context.watch<FavoriteProvider>().stat1, onChanged: (value) {
              context.read<FavoriteProvider>().change1(value);
            },
            ),],),

            Row(children: [Text("Dune"), Checkbox(value:
            context.watch<FavoriteProvider>().stat2, onChanged: (value) {
              context.read<FavoriteProvider>().change2(value);
            },
            ),],),

            Row(children: [Text("Now You See Me"), Checkbox(value:
            context.watch<FavoriteProvider>().stat3, onChanged: (value) {
              context.read<FavoriteProvider>().change3(value);
            },
            ),],),

            Row(children: [Text("Interstellar"), Checkbox(value:
            context.watch<FavoriteProvider>().stat4, onChanged: (value) {
              context.read<FavoriteProvider>().change4(value);
            },
            ),],),

            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return ResultScreen();
              }));

            }, child: Text("결과보기")),






          ],
        ),
      ),
    );
  }
}


class FormProvider with ChangeNotifier {
  String _name = "이름";
  int _age = 0;

  int get age => _age;
  String get name => _name;

  void changeName(String str) {
    _name = str;
    notifyListeners();
  }

  void increaseAge() {
    _age++;
    notifyListeners();
  }

  void decreaseAge() {
    _age--;
    notifyListeners();
  }

}

class MovieProvider with ChangeNotifier {
  String _moviejenre = "장르";

  String get genre => _moviejenre;

  void changeJenre(String str) {
    _moviejenre = str;
    notifyListeners();
  }
}


class FavoriteProvider with ChangeNotifier {
  bool _love0 = false;
  bool _love1 = false;
  bool _love2 = false;
  bool _love3 = false;
  bool _love4 = false;

  bool get stat0 => _love0;
  bool get stat1 => _love1;
  bool get stat2 => _love2;
  bool get stat3 => _love3;
  bool get stat4 => _love4;

  void change0(bool? i) {
    _love0 = !_love0;
    notifyListeners();
  }

  void change1(bool? i) {
    _love1 = !_love1;
    notifyListeners();
  }

  void change2(bool? i) {
    _love2 = !_love2;
    notifyListeners();
  }

  void change3(bool? i) {
    _love3 = !_love3;
    notifyListeners();
  }

  void change4(bool? i) {
    _love4 = !_love4;
    notifyListeners();
  }

  String info0() {
    if (_love0) {
      return "좋아";
    } else {
      return "싫어";
    }
  }

  String info1() {
    if (_love1) {
      return "좋아";
    } else {
      return "싫어";
    }
  }

  String info2() {
    if (_love2) {
      return "좋아";
    } else {
      return "싫어";
    }
  }

  String info3() {
    if (_love3) {
      return "좋아";
    } else {
      return "싫어";
    }
  }

  String info4() {
    if (_love4) {
      return "좋아";
    } else {
      return "싫어";
    }
  }

}

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.home)),
      Text("${context.watch<FormProvider>().age}살 ${context.watch<FormProvider>().name}님의 영화 취향 테스트 결과"),
      Text("${context.watch<FormProvider>().name}님이 가장 좋아하는 장르는 ${context.watch<MovieProvider>().genre}입니다."),
      Text("다음은 좋아하는 영화 목록입니다."),
      Text("Doctor Strange in the Muliverse of Madness를 ${context.watch<FavoriteProvider>().info0()}합니다."),
      Text("Thor: Love and Thunder를 ${context.watch<FavoriteProvider>().info1()}합니다."),
      Text("Dune를 ${context.watch<FavoriteProvider>().info2()}합니다."),
      Text("Now You See Me를 ${context.watch<FavoriteProvider>().info3()}합니다."),
      Text("Interstellar를 ${context.watch<FavoriteProvider>().info4()}합니다."),



    ],));
  }
}
