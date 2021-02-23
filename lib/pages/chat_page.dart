import 'dart:io';

import 'package:chattiemporeal/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _estaEscribiendo = false;

  List<ChatMessage> _messages = [
    // ChatMessage(
    //   texto: 'Hola Mundo',
    //   uid: '123',
    // ),
    // ChatMessage(
    //   texto: 'Hola Mundo',
    //   uid: '12dsa3',
    // ),
    // ChatMessage(
    //   texto:
    //       'Hola Mundodassflogvifodkgvdf,kgpdlgdflg;ldf,gldfkgpdfklgpdlg[dflgdpflg[dfplgp[dflgdfp[gl',
    //   uid: '123',
    // )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue,
              maxRadius: 15,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Melissa Flores',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: _messages.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            color: Colors.white,
            child: _inputChat(),
          )
        ],
      )),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _estaEscribiendo ? _handleSubmit : null,
                onChanged: (String texto) {
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration:
                    InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: _estaEscribiendo
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send,
                          ),
                          onPressed: _estaEscribiendo
                              ? () => _handleSubmit(_textController.text.trim())
                              : null,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = new ChatMessage(
      uid: '123',
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    //OFF DEL SOCKET
    _messages.forEach((i) => i.animationController.dispose());
    super.dispose();
  }
}
