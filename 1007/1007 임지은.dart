import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// 버킷 클래스
class Bucket {
  String job;
  bool isDone;

  Bucket(this.job, this.isDone);
}

// 홈 페이지
class HomePage extends StatefulWidget {
  //버킷리스트의 유무에 따라 화면이 다르기 때문에 StatelessWidget 사용
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bucket> bucketList = []; // 전체 버킷리스트 목록

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버킷 리스트"),
      ),
      body: bucketList.isEmpty
          ? Center(child: Text("버킷 리스트를 작성해 주세요."))
          : ListView.builder(
        itemCount: bucketList.length, // bucketList 개수 만큼 보여주기
        itemBuilder: (context, index) {
          Bucket bucket = bucketList[index]; // index에 해당하는 bucket 가져오기
          return ListTile(
            // 버킷 리스트 할 일
            title: Text(
              bucket.job,
              style: TextStyle(
                fontSize: 24,
                color: bucket.isDone ? Colors.grey : Colors.black,
                decoration: bucket.isDone
                //lineThough : 텍스트에 중앙 선
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            // 삭제 아이콘 버튼
            trailing: IconButton(
              icon: Icon(CupertinoIcons.delete),
              onPressed: () {
                // 삭제 버튼 클릭시
                showDeleteDialog(context, index);
              },
            ),
            onTap: () {
              // 아이템 클릭시
              setState(() {
                bucket.isDone = !bucket.isDone;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // + 버튼 클릭시 버킷 생성 페이지로 이동
          String? job = await Navigator.push(
            /*
            await: Navigator.push()로 화면을 띄운 뒤, 해당 화면이 종료될 때까지 기다리도록 만들어주는 코드. 이후, 화면이 종료되면 job 이라는 변수에 반환된 파라미터를 할당하고 다음 코드 진행됨
            - await을 사용하기 위해서는 해당 함수에 async 키워드를 넣어야 함.
            */
            context,
            MaterialPageRoute(builder: (_) => CreatePage()),
          );
          job != null
              ? setState(() {
            Bucket newBucket = Bucket(job, false);
            bucketList.add(newBucket); //버킷 리스트에 추가
          })
              : " ";
        },
      ),
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("삭제하시겠습니까?"),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            //취소버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("취소"),
            ),
            //확인 버튼
            TextButton(
              onPressed: () {
                setState(() {
                  //index에 해당하는 항목 삭제
                  bucketList.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text(
                "확인",
                style: TextStyle(color: Colors.pink),
              ),
            )
          ],
        );
      },
    );
  }
}

/// 버킷 생성 페이지
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  //입력되는 값을 가져오기
  TextEditingController textController = TextEditingController();
  //에러 메세지
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버킷리스트 작성"),
        // 뒤로가기 버튼
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 텍스트 입력창
            TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "하고 싶은 일을 입력하세요",
                errorText: error,
              ),
            ),
            SizedBox(height: 32),
            // 추가하기 버튼
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                child: Text(
                  "추가하기",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // 추가하기 버튼 클릭시
                  String job = textController.text;
                  job.isEmpty
                      ? setState(() {
                    // 내용이 없는 경우 에러 메세지
                    error = "내용을 입력해주세요.";
                  })
                      : setState(() {
                    // 내용이 있는 경우 에러 메세지 숨기기
                    error = null;
                  });
                  // job 변수를 반환하며 화면을 종료
                  Navigator.pop(context, job);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
