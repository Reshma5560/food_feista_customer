import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_style.dart';
import '../../../utils/simmer_utils.dart';

class WishListSimmerTile extends StatelessWidget {
  final bool showHalf;

  const WishListSimmerTile({super.key, this.showHalf = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: showHalf == false ? BorderRadius.circular(10) : const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      margin: EdgeInsets.only(bottom: showHalf == false ? defaultPadding : 0),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding).copyWith(bottom: showHalf == true ? 5 : null),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      simmer(
                        child: AppStyle.simmerContainer(height: 15, width: Get.width * 0.5),
                      ),
                      const SizedBox(height: 4),
                      simmer(
                        child: AppStyle.simmerContainer(height: 15, width: Get.width * 0.35),
                      ),
                    ],
                  ),
                ),
                simmer(
                  child: AppStyle.simmerContainer(
                    height: 18,
                    width: Get.width * 0.23,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            simmer(
              child: AppStyle.simmerContainer(
                height: 15,
                width: Get.width * 0.8,
              ),
            ),
            if (showHalf == false) ...[
              const SizedBox(height: 4),
              simmer(
                child: AppStyle.simmerContainer(
                  height: 15,
                  width: Get.width * 0.7,
                ),
              ),
              const SizedBox(height: 4),
              simmer(
                child: AppStyle.simmerContainer(
                  height: 15,
                  width: Get.width * 0.6,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
