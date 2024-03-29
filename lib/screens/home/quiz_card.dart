import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';

import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/widgets/app_icon_text.dart';

class QuizCard extends GetView<FirebaseStorageController> {
  const QuizCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuestionModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: bodyDarkTextColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          // BoxShadow(
          //   color: Colors.black26,
          //   offset: Offset(3.0, 3.0),
          //   blurRadius: 6.0,
          // ),
        ],
      ),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(
            context: context,
            paper: model,
            tryAgain: false,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: ColoredBox(
                        color: Theme.of(context).primaryColor.withOpacity(1.0),
                        child: SizedBox(
                          height: Get.width * 0.20,
                          width: Get.width * 0.20,
                          child: CachedNetworkImage(
                            imageUrl: model.image!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: Lottie.asset(
                                AppAssets.loadingwhite,
                              ),
                            ),
                            errorWidget:
                                (BuildContext context, String url, error) =>
                                    Center(
                              child: Lottie.asset(AppAssets.errorLoading),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title,
                              style: Theme.of(context).textTheme.titleSmall
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              model.description,
                           style:  Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AppIconAndText(
                              text_1: Text(
                                ' Вопросов ${model.questionCount} ',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              text_2: Text(
                                ' ${model.timeInMinits()}',
                                style:  Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: -10.0,
                  right: -10.0,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 119, 163, 201),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_orshrv.json',
                        height: 25,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
