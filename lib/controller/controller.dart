import 'package:get/get.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/repo/repo.dart';

class NewsController extends GetxController {
  final NewsRepo newsRepo = NewsRepo();
  var userData = Rx<NewsModel?>(null);

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      var response = await newsRepo.fetchApi();
      userData.value = NewsModel.fromJson(response);
      print(userData.value?.status);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
