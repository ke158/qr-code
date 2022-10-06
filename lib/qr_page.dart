import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  TextEditingController _textController = TextEditingController();
  String? qrText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRコード表示'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: '文字を入力してください。',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      qrText = _textController.text;
                    });
                  },
                  child: Center(
                      child: Text("QRコード作成", style: TextStyle(fontSize: 20)))),
            ),
          ),
          qrText != null && _textController.text.isNotEmpty
              ? Container(
                  child: Center(
                    child: QrImage(
                      data: qrText!,
                      version: QrVersions.auto,
                      size: 300.0, //QRコードのサイズ
                      padding: const EdgeInsets.all(40),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
