import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{}; // 아이콘 띄워주기 위해
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: [
          // 상단 아이콘
          IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      // 전체 여백을 지정하는 옵션, 상하좌우 16의 여백
      // 만약 특정 부분만 하려면 EdgeInsets.only(left: 10.0)과 같이 사용
      itemBuilder: (context, i) {
        // itemBuilder : 아이템이 화면에 보여질 때 생성해낸다
        // i가 짝수일 땐, 메서드는 ListTile를 추가
        // i가 홀수일 땐, 시각적으로 ListTile을 구분하기 위해 Divider widget을 추가
        if (i.isOdd) return Divider();
        // i가 짝수일때 1 픽셀 높이를 가지는 Divider widget를 반환하는데 ListView의 각 행 앞에 배치

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          // 단어 짝 배열
          // index가 배열 크기보다 같거나 크면, 저장된 단어 짝을 다 썼다는 뜻
          _suggestions.addAll(generateWordPairs().take(10));
          // 10개를 더 생성해서 addAll()로 _suggestions에 추가
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    // ListTile을 return하는 간단한 함수
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      leading: Icon(
        // trailing으로 하면 하트가 오른쪽에, leading으로 하면 왼쪽에
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        // tap 했을 때 상태 변환 (하트채움)
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _saved.map(
              (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });

      final divided = ListTile.divideTiles(tiles: tiles, context: context).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('saved Suggestions'),
        ),
        body: ListView(children: divided,),
      );
    }));
  }
}
