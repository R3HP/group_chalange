import 'package:theme_notif_challange/features/api/domain/repository/api_repository.dart';

class GetSelectedCitiesIdFromLocalUseCase {
  final ApiRepository apiRepository;

  GetSelectedCitiesIdFromLocalUseCase({
    required this.apiRepository,
  });

  Future<List<String>> call() async {
    try {
      final selectedCitiesIdList =
          await apiRepository.getSelectedCitiesIdFromLocal();
      return selectedCitiesIdList;
    } catch (error) {
      rethrow;
    }
  }
}
