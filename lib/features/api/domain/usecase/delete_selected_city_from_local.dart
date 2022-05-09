import 'package:theme_notif_challange/features/api/domain/repository/api_repository.dart';

class DeleteSelectedCityFromLocal {
  final ApiRepository apiRepository;

  DeleteSelectedCityFromLocal({
    required this.apiRepository,
  });

  Future<void> call(String cityId)async{
    try {
      final response = apiRepository.deleteSelectedCityInLocal(cityId);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
