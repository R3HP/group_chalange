import 'package:theme_notif_challange/features/api/data/model/response_item.dart';
import 'package:theme_notif_challange/features/api/domain/repository/api_repository.dart';

class GetApiListResponseUseCase {
  final ApiRepository apiRepository;

  GetApiListResponseUseCase({
    required this.apiRepository,
  });


  Future<List<ResponseItem>> call() async {
    try {
      final list = await apiRepository.getApiResposne();
      return list;
    } catch (error) {
      rethrow;
    }
  }
}
