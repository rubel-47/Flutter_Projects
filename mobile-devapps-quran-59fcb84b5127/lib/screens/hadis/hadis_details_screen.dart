import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qrf/controllers/hadis_details_controller.dart';
import 'package:qrf/routes/app_pages.dart';
import 'package:qrf/utils/color.dart';
import 'package:qrf/utils/widgets.dart';

class HadisDetailsScreen extends GetView<HadisDetailsController> {
  const HadisDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appBgColor,
      appBar: CustomAppBar(title: 'AL HADITH'.toUpperCase(), height: 80.0),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/app_bg.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            children: <Widget>[
              
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 40.0,
                                width: 140.0,
                                child: TextFormField(
                                    controller: controller.hadisNameController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: "Hadith Name",
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 5, 0),
                                      labelStyle: TextStyle(
                                          color: black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                      hintStyle: TextStyle(
                                          color: black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                      filled: true,
                                      fillColor: Colors.grey[400],
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: surahBgColor, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: surahBgColor, width: 0.0),
                                      ),
                                    )),
                              ),
                              Container(
                                height: 40.0,
                                width: 140.0,
                                child: TextFormField(
                                    controller:
                                        controller.hadisNumberController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    autofocus: false,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: "Hadith Number",
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 5, 0),
                                      labelStyle: TextStyle(
                                          color: black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                      hintStyle: TextStyle(
                                          color: black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                      filled: true,
                                      fillColor: Colors.grey[400],
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: surahBgColor, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: surahBgColor, width: 0.0),
                                      ),
                                    )),
                              ),
                              InkWell(
                                  onTap: () {
                                    var keyword =
                                        controller.hadisNameController.text;
                                    if (keyword.isEmptyOrNull) {
                                      toast('Please enter a keyword');
                                      return;
                                    }
                                    Get.toNamed(AppPages.getHadisSearchRoute(),
                                        arguments: [
                                          {"keyword": keyword}
                                        ]);
                                  },
                                  child: Image.asset(
                                      'assets/images/search_icon.png')),
                            ],
                          ),
                        ),
                        10.height,
                        Expanded(
                          child: Obx(() => controller.isLoading.value
                              ? Center(child: CircularProgressIndicator())
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '??????????????? ?????? - ${controller.hadisDetails.value.hadisNo}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        10.height,
                                        Text(
                                          '${controller.hadisDetails.value.hadisAr}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        10.height,
                                        Text(
                                          '???????????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        10.height,
                                        Text(
                                          '${controller.hadisDetails.value.meaningBn}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        10.height,
                                        Text(
                                          '${controller.hadisDetails.value.meaningEn}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        10.height,
                                        Text(
                                          '??????????????????????????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        10.height,
                                        Html(
                                          data:
                                              '${controller.hadisDetails.value.description}',
                                          shrinkWrap: true,
                                          style: {
                                            "p": Style(
                                                fontWeight: FontWeight.w600,
                                                fontSize: FontSize.rem(1.3),
                                                textAlign: TextAlign.center,
                                                direction: TextDirection.rtl,
                                                whiteSpace: WhiteSpace.NORMAL,
                                                display: Display.BLOCK)
                                          },
                                        ),
                                        /* Text(
                                          '${controller.hadisDetails.value.description}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ), */
                                      ],
                                    ),
                                  ),
                                )),
                        ),
                      ],
                    )
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
