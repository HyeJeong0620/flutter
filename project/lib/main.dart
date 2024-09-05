import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lst = List<String>.generate(0, (index) => "$index ");
    lst.insert(0,"에스쿱스");
    lst.insert(1,"원우");
    lst.insert(2,"민규");
    lst.insert(3,"버논");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My HomePage'),
          backgroundColor: Colors.lightBlue[100],
        ),
        body: Mypage(lst)
      ),
    );
  }
}

Widget Mypage(List<String> lst) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        RichText(
          text: const TextSpan(children: [
            TextSpan(
              text: '안녕하세요, ',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w100,
              ),
            ),
            TextSpan(
              text: '양혜정',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w200,
                decorationThickness: 2,
                decoration: TextDecoration.underline,
                decorationColor: Colors.purple,
              ),
            ),
            TextSpan(
              text: '입니다',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w100,
              ),
            ),
          ]),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 121.4, // 이미지와 텍스트가 잘 보일 수 있도록 높이를 수정
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.blueAccent),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://lifet-img.s3.ap-northeast-2.amazonaws.com/6b980705-1d57-46a4-8193-ca490d19d00d',
                  ),
                ],
              ),
            ),
            SizedBox(width: 20), // 이미지와 텍스트 사이의 간격 조정
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🏫 부산소프트웨어마이스터고등학교 재학 중',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '💬 yhyejeong26@gamil.com',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '📞 010-9955-4550',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30),
        Divider(),
        Text("SEVENTEEN",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        Divider(),
        Expanded(
            child: ListView.separated(
                itemCount: lst.length, // 아이템 개수
                separatorBuilder: (context, index) {
                  // 구분선 생성
                  return const Divider();
                },
                itemBuilder: (context, index) {                  // 리스트 아이템 생성
                  return GestureDetector(//터치 이벤트 감지 위젯
                    child: buildListItem(lst, index),
                    onTap: () {
                      showSnackBar(context, "${lst[index]}을/를 선택했습니다.");
                    },
                  );
                }
                )
        ),
      ],
    ),
  );
}

Widget buildListItem(List<String> lst, int index) {
  // 리스트 아이템 위젯 생성
  return ListTile(
    leading: Image.asset(
      'assets/images/image${index + 1}.jpg',
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    ),
    title: Text(lst[index],
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500),
    ),
    trailing: Image.asset('assets/images/logo.jpg',), // 오른쪽 아이콘
  );
}


void showSnackBar(BuildContext ctx, String s) {
  // 스낵바 보여주는 함수 호출
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(s)));
}




