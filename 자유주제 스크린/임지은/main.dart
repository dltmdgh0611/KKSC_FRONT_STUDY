import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Screen Navigation',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('asset/background.jpeg'),
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('가천길잡이',
            style: TextStyle(
                fontFamily: 'EastSeaDokdo',
                fontSize: 70,
            ),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NoticeListScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text('나랑 공지 확인할래 ~?',
                      style: TextStyle(
                        fontFamily: 'EastSeaDokdo',
                        fontSize: 25,
                      ),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text('나랑 로그인 할래 ~?',
                      style: TextStyle(
                        fontFamily: 'EastSeaDokdo',
                        fontSize: 25,
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoticeListScreen extends StatelessWidget {
  final List<Map<String, String>> notices = [
    {'title': '나 완전 인기 많아', 'content': '공지 1 ! ! !'},
    {'title': '다 나만 봐 ~', 'content': '공지 2 ! ! !'},
    {'title': '헤헤', 'content': '공지 3 ! ! !'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('asset/background.jpeg'),
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('고옹지',
            style: TextStyle(
              fontFamily: 'EastSeaDokdo',
              fontSize: 70,
            ),),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: notices.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(notices[index]['title']!, style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoticeDetailScreen(
                        title: notices[index]['title']!,
                        content: notices[index]['content']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class NoticeDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  NoticeDetailScreen({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('asset/background.jpeg'),
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('asset/background.jpeg'),
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('로그인 해',
            style: TextStyle(
              fontFamily: 'EastSeaDokdo',
              fontSize: 70,
            ),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('로그인 하라고 ',
                style: TextStyle(
                  fontFamily: 'EastSeaDokdo',
                  fontSize: 35,
                ),),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: '아이디 넣어',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: '비밀번호 적어',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 로그인 로직 추가 가능
                  Navigator.pop(context);
                },
                child: Text('눌러',
                  style: TextStyle(
                    fontFamily: 'EastSeaDokdo',
                    fontSize: 20,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
