import 'package:ThiruvalluvarGPT/core/chatgpt/data/chatgpt_repository.dart';
import 'package:ThiruvalluvarGPT/core/chatgpt/domain/chatgpt_chat.dart';
import 'package:ThiruvalluvarGPT/core/chatgpt/domain/chatgpt_response.dart';
import 'package:ThiruvalluvarGPT/main/chatgpt/data/network/chatgpt_api_service.dart';

class ChatGptRepositoryImpl implements ChatGptRepository {
  ChatGptRepositoryImpl(this._chatGptApiService);

  final ChatGptApiService _chatGptApiService;

  @override
  Future<ChatGptResponse?> askQuestion(ChatGptChat chatGptChat, String question) async {
    final chatGptResponseDto = await _chatGptApiService.fetchResponse(chatGptChat, question);
    return chatGptResponseDto?.toChatGptResponse();
  }
}
