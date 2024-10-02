import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ChatBotApp extends StatefulWidget {
  @override
  _ChatBotAppState createState() => _ChatBotAppState();
}

class _ChatBotAppState extends State<ChatBotApp> {
  Map<String, dynamic>? _responses;

  @override
  void initState() {
    super.initState();
    _loadResponses();
  }

  Future<void> _loadResponses() async {
    String jsonString = await rootBundle.loadString('assets/responses.json');
    setState(() {
      _responses = json.decode(jsonString);
    });
  }

  String _getResponse(String key) {
    return _responses?[key] ?? "Bilmiyorum.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Uygulaması'),
      ),
      body: _responses == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    String response = _getResponse('greetings');
                    _showDialog(response);
                  },
                  child: Text('Selamlaş'),
                ),
                ElevatedButton(
                  onPressed: () {
                    String response = _getResponse('help');
                    _showDialog(response);
                  },
                  child: Text('Yardım İste'),
                ),
                ElevatedButton(
                  onPressed: () {
                    String response = _getResponse('farewell');
                    _showDialog(response);
                  },
                  child: Text('Veda Et'),
                ),
              ],
            ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
