import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:hearable_device_sdk_sample/widget_config.dart';
import 'package:hearable_device_sdk_sample/size_config.dart';

class Widgets {
  static Widget barBackButton(BuildContext context) {
    return TextButton.icon(
      label: const FittedBox(
        fit: BoxFit.fitWidth,
        child: Text('戻る'),
      ),
      icon: const Icon(Icons.arrow_back_ios_outlined),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  static Widget iosDeviceIdText(String deviceId) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(deviceId),
    );
  }

  static Widget androidDeviceIdText(String deviceId) {
    return Text(deviceId);
  }

  static Widget uuidText(String uuid) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(uuid),
    );
  }

  static Widget inputNumberContainer(
      {required String title,
      required String unit,
      required int horizontalRatio,
      required TextEditingController controller,
      required Function(String?) function}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: WidgetConfig.boldTextStyle,
          )),
      Row(children: [
        // 入力TextField
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
                decoration: WidgetConfig.inputDecoration,
                width: SizeConfig.blockSizeHorizontal * horizontalRatio,
                height: 30,
                child: Column(children: [
                  Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              WidgetConfig.featureRequiredNumberInputDecoration,
                          controller: controller,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          onFieldSubmitted: (String? value) {
                            function(value);
                          },
                          onSaved: (String? value) {
                            function(value);
                          }))
                ]))),
        Text(unit),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 5,
        )
      ])
    ]);
  }

  static Widget switchContainer(
      {required String title,
      required bool enable,
      required Function(bool) function}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: WidgetConfig.boldTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CupertinoSwitch(
              value: enable,
              onChanged: (value) {
                function(value);
              }),
        )
      ],
    );
  }

  static Widget resultContainer(
      {required int verticalRatio,
      required TextEditingController controller,
      required String text}) {
    controller.text = text;
    return Container(
        width: SizeConfig.blockSizeHorizontal * 85,
        //height: SizeConfig.blockSizeVertical * verticalRatio,
        height: 180,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Column(
            children: [Expanded(child: Widgets.resultTextField(controller))]));
  }

  static Widget resultContainer2(
      {required int verticalRatio,
      required TextEditingController controller,
      required String text}) {
    controller.text = text;
    return Container(
        width: SizeConfig.blockSizeHorizontal * 85,
        //height: SizeConfig.blockSizeVertical * verticalRatio,
        height: 80,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Column(
            children: [Expanded(child: Widgets.resultTextField(controller))]));
  }

  static Widget resultContainer3(
      {required int verticalRatio,
      required TextEditingController controller,
      required String text}) {
    controller.text = text;
    return Container(
        width: SizeConfig.blockSizeHorizontal * 85,
        //height: SizeConfig.blockSizeVertical * verticalRatio,
        height: 100,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Column(
            children: [Expanded(child: Widgets.resultTextField(controller))]));
  }

  static Widget resultTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      enabled: false,
      decoration: WidgetConfig.resultInputDecoration,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.top,
      maxLines: null,
    );
  }
}
