import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_demo/models/food_model.dart';
import '../data_provider.dart';
import '../services/service.dart';
import '../theme/app_color.dart';

class MenuItems extends ConsumerWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final AsyncValue<List<FoodPayload>> data = ref.watch(foodDataProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('RiverPod Menu Items'),
        centerTitle: true,
      ),
      body: data.when(
        error: (err, stack) => Center(
          child: Text(err.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) {
          return data.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final currentItem = data[index];
                    return currentItem.itemList.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentItem.catTitle!.en!,
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5.5.h),
                              currentItem.itemList.isNotEmpty
                                  ? ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: currentItem.itemList.length,
                                      itemBuilder: (context, index) {
                                        final cardItem =
                                            currentItem.itemList[index];
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5.5.h),
                                          padding: EdgeInsets.all(12.w),
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: AppColor
                                                        .foodCardBorderShadow,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 4))
                                              ]),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 75.w,
                                                width: 75.w,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    child: cardItem
                                                            .image!.isNotEmpty
                                                        ? Image.network(
                                                            ApiServices
                                                                    .baseUrl +
                                                                cardItem.image!,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Image.asset(
                                                            'assets/image.jpg',
                                                            fit: BoxFit.cover,
                                                          )),
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cardItem.title!.en!,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColor
                                                            .neutralBlack),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    cardItem.description!.en!,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color:
                                                          AppColor.neutralGray,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 7.h,
                                                  ),
                                                  Text(
                                                    "£${cardItem.price.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: AppColor.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : const Text(
                                      "No item available for this categories")
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                )
              : const Text('No categories available');
        },
      ),
    );
  }
}
