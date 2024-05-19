import 'package:JoDija_view/util/functions/launchers.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/dateTime_text_form_field_validation.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/drobdaown_validation.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:JoDija_view/util/widgits/input_text/dropDown_text_feild.dart';
import 'package:car_peache_searcher/consts/app_decoration.dart';
import 'package:car_peache_searcher/consts/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  ValidationsForm form = ValidationsForm();
  TextEditingController paeceController = TextEditingController();
  // contraller
  TextEditingController carTypeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();
  TextEditingController partNumberController = TextEditingController();

  List<String> paeaches = [];
  int index = 0;
  int price = 5;
  int count = 0;
  int total = 0;
  String country = "+966";
  String phone = "0550197248";
  @override
  Widget build(BuildContext context) {
    // add scaffold here and return edit text to shearch of car type  , the model ,  رقم الشاسيه رقم قطعة الغيار للسيارة
    int year = DateTime.now().year;
    count = paeaches.length;
    total = count * price;
    List<String> years = [];
    for (int i = 0; i < 70; i++) {
      years.add((year - i).toString());
    }

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'بحث عن قطعة غيار للسيارة',
              style: AppTextStyle.title,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (!form.form.currentState!.validate()) {
                return;
              }
              var data = form.getInputData();
              print(data);
              var c = Color(0xfff8a204);

              String massage = getSearchMassage(data);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("تاكيد البحث" , textAlign: TextAlign.right
                        , style: AppTextStyle.title
                        ),
                        content: Text(

                            "   هل تريد تاكيد البحث مع التعهد وتقسم بلله على  دفع قيمة البحث وهي  $price ريالات " +
                                "      وسيتم ارسال البعثة عبر الواتساب" +"  "+
                                "اجمالي القطع $count  بقيمة $total ريال"
                        ,
                          textAlign: TextAlign.right,
                          style: AppTextStyle.subtitle3,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("الغاء")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Loauncherurl.sendWhatsapp(
                                    "$country", "$phone", massage);
                              },
                              child: Text("اتعهد و اقسم بالله ")),
                        ],
                      ));
            },
            child: const Icon(Icons.search),
          ),
          body: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SingleChildScrollView(
                  child:
                      form.buildChildrenWithColumn(context: context, children: [
                Text(
                  "خدمة الاستعلام  ${price} ريال للبحث الواحد",
                  style: AppTextStyle.subtitle2,
                ),
                SizedBox(height: 20.h),
                TextFomrFildValidtion(
                  textStyle: AppTextStyle.input,
                  decoration: AppDecoration.textfield3,
                  keyData: "نوع السيارة",
                  baseValidation: [RequiredValidator()],
                  hintText: "نوع السيارة",
                  padding: EdgeInsets.only(bottom: 30.h),
                  form: form,
                ),
                SizedBox(height: 20.h),
                // add text field for model
                TextFomrFildValidtion(
                  controller: modelController,
                  textStyle: AppTextStyle.input,
                  decoration: AppDecoration.textfield3,
                  keyData: "موديل السيارة",
                  baseValidation: [RequiredValidator()],
                  hintText: "موديل السيارة",
                  padding: EdgeInsets.only(bottom: 30.h),
                  form: form,
                ),
                SizedBox(height: 20.h),
                // add text field for chassis number
                DrobDaownValidation(
                  onChange: (v) {
                    print(v);
                    setState(() {
                      index = years.indexOf(v);
                    });
                  },
                  index: index,
                  itemslsit: years,
                  hintText: "سنة التصنيع ",
                  textStyle: AppTextStyle.input,
                  keyData: "سنة التصنيع",
                  decoration: AppDecoration.textfield3,
                  baseValidation: [RequiredValidator()],
                  form: form,
                ),
                SizedBox(height: 20.h),
                TextFomrFildValidtion(
                  controller: chassisNumberController,
                  textStyle: AppTextStyle.input,
                  textInputType: TextInputType.number,
                  decoration: AppDecoration.textfield3,
                  keyData: "رقم الشاسيه",
                  baseValidation: [RequiredValidator()],
                  hintText: " رقم الشاسيه",
                  padding: EdgeInsets.only(bottom: 30.h),
                  form: form,
                ),
                SizedBox(height: 20.h),
                // add text field for part number
                Container(
                  height: 100.h,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFomrFildValidtion(
                          controller: paeceController,
                          textStyle: AppTextStyle.input,
                          decoration: AppDecoration.textfield3,
                          keyData: "اسم قطعة الغيار للسيارة",
                          baseValidation: [RequiredValidator()],
                          hintText: "  اسم قطعة الغيار للسيارة",
                          padding: EdgeInsets.only(bottom: 30.h),
                          form: form,
                        ),
                      ),
                      // button to add the part number
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                paeaches.add(paeceController.text);
                              });
                            },
                            child: Text("+")),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                // add button to search

                Container(
                  height: paeaches.length * 100.h.toDouble(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (c, i) {
                      // add to card show the array and the user can delete the part number
                      return Card(
                        child: ListTile(
                          title: Text(paeaches[i]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                paeaches.removeAt(i);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: paeaches.length,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "عدد القطع : $count",
                  style: AppTextStyle.subtitle2,
                ),
                SizedBox(height: 20.h),
                Text(
                  "المجموع : $total ريال",
                  style: AppTextStyle.subtitle2,
                ),
              ])),
            ),
          ),
        ),
      ),
    );
  }

  String getSearchMassage(Map<String, dynamic> data) {
    String massage = "السلام عليكم كنت اريد ان اسال عن  \n";
    data.forEach((key, value) {
      if (key == "رقم الشاسيه") {
        massage += "رقم الشاسيه : $value \n";
      } else if (key == "اسم قطعة الغيار للسيارة") {
        if (paeaches.isNotEmpty) {
          massage += "اسم قطعة الغيار للسيارة : \n";
          for (int i = 0; i < paeaches.length; i++) {
            massage += "${i + 1} -  ${paeaches[i]} \n";
          }
        }
      } else {
        massage += "$key : $value \n";
      }
    });
    return massage;
  }
}
