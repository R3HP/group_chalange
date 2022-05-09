import 'package:theme_notif_challange/features/api/domain/repository/api_repository.dart';

class SaveSelectedCityInLocalUseCase {
  final ApiRepository apiRepository;

  SaveSelectedCityInLocalUseCase({
    required this.apiRepository,
  });

  Future<void> call(String selectedCityID) async {
    try {
      final response = await apiRepository.saveSelectedCityInLocal(selectedCityID);
      return response;
    } catch (error) {
      rethrow ;
    }
  }
}
