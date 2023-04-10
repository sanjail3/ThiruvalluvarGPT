import 'package:ThiruvalluvarGPT/core/chatgpt/domain/chatgpt_chat.dart';
import 'package:ThiruvalluvarGPT/core/chatgpt/domain/chatgpt_response.dart';

abstract class ChatGptRepository {
  Future<ChatGptResponse?> askQuestion(ChatGptChat chatGptChat, String question);
}
