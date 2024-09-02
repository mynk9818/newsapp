import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/controller.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    newsController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 8, 72),
        title: const Text(
          "News App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (newsController.userData.value == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: newsController.userData.value?.articles?.length,
            itemBuilder: (BuildContext context, int index) {
              var article = newsController.userData.value?.articles?[index];
              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (article?.urlToImage != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            article?.urlToImage ?? "",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(height: 5),
                      if (article?.publishedAt != null)
                        Text(
                          "Published at: ${article?.publishedAt}",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      const SizedBox(height: 15),
                      if (article?.author != null)
                        Text(
                          "Author: ${article?.author}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      const SizedBox(height: 10),
                      if (article?.title != null)
                        Text(
                          article?.title ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      const SizedBox(height: 10),
                      if (article?.description != null)
                        Text(
                          article?.description ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                      const SizedBox(height: 10),
                      if (article?.content != null)
                        Text(
                          article?.content ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
