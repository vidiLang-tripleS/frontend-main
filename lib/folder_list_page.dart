import 'package:flutter/material.dart';
import 'navbar.dart';

class FolderListPage extends StatefulWidget {
  @override
  _FolderListPageState createState() => _FolderListPageState();
}

class _FolderListPageState extends State<FolderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Folder List Page")), // 폴더 리스트 페이지 내용
      bottomNavigationBar: Navbar(currentIndex: 1),
    );
  }
}
