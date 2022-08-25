import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:quizapp/models/question_model.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuestionModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: ColoredBox(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: SizedBox(
                    height: Get.width * 0.18,
                    width: Get.width * 0.18,
                    child: CachedNetworkImage(
                      imageUrl: model.image!,
                      placeholder: (context, url) => Center(
                        child: Lottie.asset('assets/lotties/loadingblue.json'),
                      ),
                      errorWidget: (BuildContext context, String url, error) =>
                          Center(
                        child: Lottie.asset('assets/lotties/errorloading.json'),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(model.description),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
