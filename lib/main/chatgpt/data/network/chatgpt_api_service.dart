import 'package:ThiruvalluvarGPT/core/chatgpt/domain/chatgpt_chat.dart';
import 'package:ThiruvalluvarGPT/main/chatgpt/data/network/chatgpt_response_dto.dart';

abstract class ChatGptApiService {
  Future<ChatGptResponseDto?> fetchResponse(ChatGptChat chatGptChat, String question);
}
