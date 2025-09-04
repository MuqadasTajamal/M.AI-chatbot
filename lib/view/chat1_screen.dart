import 'package:flutter/material.dart';

class ChatBot1Screen extends StatefulWidget {
  const ChatBot1Screen({super.key});

  @override
  State<ChatBot1Screen> createState() => _ChatBot1ScreenState();
}

class _ChatBot1ScreenState extends State<ChatBot1Screen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  // format: {"sender": "user/ai", "text": "message"}

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      // user ka message add karo
      _messages.add({"sender": "user", "text": _controller.text});
    });

    // clear textfield
    _controller.clear();

    // fake AI reply (tum apna logic yahan add kar sakti ho)
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({"sender": "ai", "text": "This is AI response"});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("ChatBot"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message["sender"] == "user";

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message["text"]!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input Field
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
