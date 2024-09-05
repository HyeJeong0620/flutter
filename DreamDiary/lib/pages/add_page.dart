import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'diary.dart';

class AddPage extends StatefulWidget {
  final Function(Diary) onSave;

  const AddPage({Key? key, required this.onSave});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('다이어리 추가'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: Text(
                        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}"
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: "제목을 입력하세요",
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                  decoration: const InputDecoration(
                    hintText: "내용을 입력하세요",
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      String title = _titleController.text;
                      String content = _contentController.text;
                      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

                      if (title.isNotEmpty && content.isNotEmpty) {
                        Diary newDiary = Diary(
                          title: title,
                          content: content,
                          date: formattedDate,
                        );
                        widget.onSave(newDiary);
                        Navigator.pop(context, newDiary);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('오류'),
                            content: const Text('제목과 내용을 모두 입력하세요'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('확인'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
