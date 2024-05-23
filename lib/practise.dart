// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextAllFieldDemo extends StatefulWidget {
  const TextAllFieldDemo({super.key});

  @override
  State<TextAllFieldDemo> createState() => _TextAllFieldDemoState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _TextAllFieldDemoState extends State<TextAllFieldDemo> {
  String result = '';
  String result1 = '';
  final namenode = FocusNode();
  final numberNode = FocusNode();
  final passwordNode = FocusNode();
  final conPasswordNode = FocusNode();
  final dateNode = FocusNode();
  final timeNode = FocusNode();
  final textnode1 = FocusNode();
  final textnode2 = FocusNode();
  final textnode3 = FocusNode();
  final textnode4 = FocusNode();
  final datePickerNode = FocusNode();
  final datePickerNode1 = FocusNode();
  var _focusNodes = List.generate(6, (index) => FocusNode());
  String hrCounter = '00';
  String minCounter = '00';
  String secCounter = '00';
  String temp="";
  TextEditingController dateController = TextEditingController();
  TextEditingController datePickerCon = TextEditingController();
  TextEditingController datePickerCon1 = TextEditingController();
  TextEditingController datePickerCon2 = TextEditingController();
  TextEditingController _timecon = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future selectDate({TextEditingController? controller, String format = ""}) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null) {
      setState(() {
        //controller?.text = DateFormat(format).format(picked);
        selectedDate = picked;
        print(' vsalue in function:  ${selectedDate}');
      });
    }
  }


  //=======
/*  Future <Void>_selectDate(string form) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1998),
        lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        datePickerCon.text = DateFormat('dd/MMMM/yyyy').format(picked);
       // controoler = controoler1;
       // print(controoler1);
         //controoler = controoler;
         selectedDate = picked;
        // controoler = DateFormat(form).format(picked);
         print(' vsalue in function:  ${selectedDate}');
      });
    }
    //formate = form;
    //return "$controoler and $formate";
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    focusNode: namenode,
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Name', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
                        //r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$"
                        //r"^[a-zA-Z]+ [a-zA-Z]+$"
                      } else if (!RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$"
                      )
                          .hasMatch(value)) {
                        return 'Please Enter full Name';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(numberNode);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: numberNode,
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    autocorrect: true,
                    maxLength: 10,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    //te: FilteringTextInputFormatter.digitsOnly,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      counter: Text(''),
                      labelText: 'Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Number';
                      } else if (value.length < 10) {
                        return 'Please enter a valid Phone Number';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordNode);
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: passwordNode,
                    autocorrect: true,
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      counter: Text(''),
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      } else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#_\$&*~]).{8,10}$')
                          .hasMatch(value)) {
                        return 'Enter valid password like "Abc@123" ';
                      }
                      return null;
                    },
                    onChanged: (String str) {
                      setState(() {
                        result = str;
                        print(" pass is : $result");
                      });
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(conPasswordNode);
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: conPasswordNode,
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: true,
                    obscureText: true,
                    obscuringCharacter: '*',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      counter: Text(''),
                      labelText: 'Confirm Passowrd',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Confirm Passowrd';
                      } else if (value != result) {
                        return 'Password is not match';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(dateNode);
                    },
                  ),
                  TextFormField(
                    controller: dateController,
                    focusNode: dateNode,
                    maxLength: 10,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    //enableInteractiveSelection: false,
                    //  autofocus: true,
                    //autocorrect: true,
                    //selectionControls: TextSelectionControls.,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      counter: Text(''),
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                    ),
                    inputFormatters: [
                      _DateFormatter()
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Date';
                      } else if (!RegExp(
                          r'(([012][0-9])|(3[01]))\/([0]{0,1}[1-9]|1[012])\/\d{4}.{0,10}$')
                          .hasMatch(value)) {
                        return 'Date in  correct formate DD/MM/YYYY';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(timeNode);
                    },
                    //  && !value.contains("\\")
//                     onChanged: (newText) {
//                       if(newText.length==2 || newText.length==5){
//                           //result1 = '$newText\/';
//                         dateController.text = '$newText\/';
//                        // dateController.selection = TextSelection.collapsed(offset: dateController.text.length);
//                        // newText = dateController.text;
//                           print("if  $newText");
//                         //  TextSelection.collapsed(offset: newText.length);
//
//                         // dateController.selection = TextSelection(
//                           //   baseOffset: 0,
//                           //   extentOffset: newText.length,isDirectional: false
//                           // );
//                           //dateController.selection = TextSelection(baseOffset:0, extentOffset:dateController.text.length);
//                           // dateController.value = TextEditingValue(text:
//                           // result1,selection: TextSelection.collapsed(offset:
//                           // result1.length),);
//                           // print("if new value $result1");
//                           // print(newText);
//                        // print(" data picker value is ${newText}");
//                       }
// //                       if(){
// //
// // print(newText.lastIndexOf(newText));
// //                       }
//                    // else if(result1.length>2 && result1.contains("\/") ){
//                    //   //12 result1 = '$newText';
//                    //    // dateController.value = TextEditingValue(text:
//                    //    // result1,selection: TextSelection.collapsed(offset:
//                    //    // result1.length),);
//                    //    print("if new value $result1.");
//                    //
//                    //     // print(" elsr $newText");
//                    //    }
//
//                     // print(dateController.text.length == 3 );
//                     //   newText.length == 3 && newText.contains('/');
//                     //   if(newText.length == 3 && newText.contains('/')){
//                     //     print(newText);
//                     //     print(newText.length);
//                     //     List<String> c = newText.split(""); // ['a', 'a', 'a', 'b', 'c', 'd']
//                     //     c.removeLast(); // ['a', 'a', 'a', 'b', 'c']
//                     //     print(c.join());
//                     //     newText = c.join();
//                     //     print("object $newText");
//                     //   }
//
//                       // setState(() {
//                       //   result1 = newText;
//                       // });
//                   // print('First text field: $newText (${result1.characters.length})');
//                     },
                  ),
                  //SizedBox(height: 5),
                  TextFormField(
                    focusNode: timeNode,
                    controller: _timecon,
                    keyboardType: TextInputType.number,
                    // keyboardType:
                    //  const TextInputType.numberWithOptions(decimal: false),
                    inputFormatters: [
                      _TimeFormatter(),
                      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(8),
                    ],
                    autofocus: true,
                    textInputAction:  TextInputAction.next,
                    autocorrect: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(

                      //counter: Text(''),
                      labelText: 'Time',

                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please Enter time';
                    //   } else if (!RegExp(
                    //       r'^(1[0-2]|0?[1-9]):([0-5]?[0-9])(●?[AP]M)?$'
                    //      )
                    //       .hasMatch(value)) {
                    //     return 'Please Enter correct time like 10:10PM';
                    //   }
                    //   return null;
                    // },
                    // onChanged: (val) {
                    //   String y="";
                    //   switch (val.length) {
                    //     case 0:
                    //       setState(() {
                    //         hrCounter = "00";
                    //         minCounter = "00";
                    //         secCounter = "00";
                    //       });
                    //       break;
                    //     case 1:
                    //       setState(() {
                    //         secCounter = "0"+val;
                    //         temp=val;
                    //         _timecon.value = _timecon.value.copyWith(
                    //           text: hrCounter+":"+minCounter+":"+secCounter,
                    //           selection: const TextSelection.collapsed(offset: 8),
                    //         );
                    //       });
                    //       break;
                    //     default: setState((){
                    //       for(int i=1;i<=val.length-1;i++){
                    //         y=y+val.substring(i,i+1);
                    //       }
                    //       y=y.replaceAll(":", "");
                    //       val=y.substring(0,2)+":"+y.substring(2,4)+":"+y.substring(4,6);
                    //       temp=val;
                    //       _timecon.value = _timecon.value.copyWith(
                    //         text: val,
                    //         selection: const TextSelection.collapsed(offset: 8),
                    //       );
                    //     });
                    //     break;
                    //
                    //   }
                    // },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(textnode1);
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: datePickerCon,
                    focusNode: datePickerNode,
                    readOnly: true,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      hintText: 'dd/mm/yyyy',
                      border: OutlineInputBorder(),
                      suffixIcon:  Icon(Icons.calendar_month_sharp),
                    ),
                    onTap: () {
                      selectDate(controller: datePickerCon,format: 'dd/MM/yyyy');
                    },

                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: datePickerCon1,
                    focusNode: datePickerNode1,
                    readOnly: true,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'yyyy/mm/dd',
                      suffixIcon:  Icon(Icons.calendar_month_sharp),
                    ),
                    onTap: () {
                      selectDate(controller: datePickerCon1,format: 'yyyy/MM/dd');
                    },

                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: datePickerCon2,
                    focusNode: datePickerNode1,
                    readOnly: true,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'mm/yyyy/dd',
                      suffixIcon:  Icon(Icons.calendar_month_sharp),
                    ),
                    onTap: () {
                      selectDate(controller: datePickerCon2,format: 'MM/yyyy/dd');
                    },

                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 30,
                    width: 180,
                    alignment: Alignment.center,

                    //decoration: BoxDecoration(color: Colors.red),

                    child: Row(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                contentPadding: EdgeInsets.only(bottom: 10)

                            ),
                            focusNode: textnode1,
                            onChanged: (value) {
                              if(value.length >= 1){
                                FocusScope.of(context).requestFocus(textnode2);
                              }
                              else{
                                FocusScope.of(context).requestFocus(textnode1);
                              }

                            },
                            onFieldSubmitted: (value) {
                              if(value.length > 1){
                                FocusScope.of(context).requestFocus(textnode2);
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: TextFormField(
                            // autofocus: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(border:UnderlineInputBorder()
                                ,contentPadding: EdgeInsets.only(bottom: 10)

                            ),
                            focusNode: textnode2,
                            onChanged: (value) {
                              if(value.length >= 1){
                                FocusScope.of(context).requestFocus(textnode3);
                              }
                              else if(value.isEmpty){
                                FocusScope.of(context).requestFocus(textnode1);
                              }

                            },
                            onFieldSubmitted: (value) {
                              if(value.length > 1){
                                FocusScope.of(context).requestFocus(textnode3);
                              }
                              else if(value.isEmpty){
                                FocusScope.of(context).requestFocus(textnode1);
                              }
                            },

                          ),
                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: TextFormField(
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(border: UnderlineInputBorder(),
                                fillColor: Colors.lightBlueAccent,
                                contentPadding: EdgeInsets.only(bottom: 10)),
                            focusNode: textnode3,
                            onChanged: (value) {
                              if(value.length == 1){
                                FocusScope.of(context).requestFocus(textnode4);
                              }
                              else if(value.isEmpty){
                                FocusScope.of(context).requestFocus(textnode2);
                              }

                            },
                            onFieldSubmitted: (value) {
                              if(value.length > 1){
                                FocusScope.of(context).requestFocus(textnode4);
                              }
                              else if(value.isEmpty){
                                FocusScope.of(context).requestFocus(textnode2);
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: TextFormField(
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(border: UnderlineInputBorder(),
                                fillColor: Colors.lightBlueAccent,
                                contentPadding: EdgeInsets.only(bottom: 10)

                            ),
                            focusNode: textnode4,
                            onChanged: (value) {
                              if(value.length == 1){
                                FocusScope.of(context).unfocus();
                              }
                              else if(value.isEmpty){
                                FocusScope.of(context).requestFocus(textnode3);
                              }

                            },
                            onFieldSubmitted: (value) {
                              if(value.length > 1){
                                FocusScope.of(context).unfocus();
                              }
                              else if(value.isEmpty){
                                FocusScope.of(context).requestFocus(textnode4);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState?.validate();
                        print("resulr is : $result");
                      },
                      child: Text('Submit'))
                ],
              ),
            ),
          )),
    );
  }
}

class _DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;

    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    //Date

    if (cLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) > 1) {
        // Remove char
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) == 0 || int.parse(cText) > 12) {
        // Remove char
        cText = cText.substring(0, 1);
      } else {
        cText += '/';
      }
    } else if (cLen == 2 && pLen == 3) {
      cText = cText.substring(0, 1);
    } else if (cLen == 2 && pLen == 4) {
      cText += '/';
    } else if (cLen == 3 && pLen == 2) {
      cText = cText.substring(0, 2) + '/' + cText.substring(2, 3);
    }

    // Month
    else if (cLen == 4 && pLen == 2) {
      print('s');
      if (int.parse(cText.substring(3, 4)) > 3) {
        cText = cText;
      }
    } else if (cLen == 4 && pLen == 3) {
      if (int.parse(cText.substring(3, 4)) > 3) {
        cText = cText.substring(0, 3);
      }

      // // Can only be 0, 1, 2 or 3
      // if (int.parse(cText) > 3) {
      //   // Remove char
      //   cText = '
      // }
      // // Can only be 0 or 1
      // if (int.parse(cText.substring(3, 4)) > 1) {
      //   // Remove char
      //   cText = cText.substring(0, 3);
      // }
    } else if (cLen == 5 && pLen == 4) {
      // Month cannot be greater than 12
      int mm = int.parse(cText.substring(3, 5));
      if (mm == 0 || mm > 12) {
        // Remove char
        cText = cText.substring(0, 4);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      // Remove / char
      cText = cText.substring(0, cText.length - 1);
    } else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        // Replace char
        cText = cText.substring(0, 2) + '/';
      } else {
        // Insert / char
        cText =
            cText.substring(0, pLen) + '/' + cText.substring(pLen, pLen + 1);
      }
    }

    //Year

    else if (cLen == 6 && pLen == 5) {
      // Can only be 1 or 2 - if so insert a / char
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 1 || y1 > 2) {
        // Replace char
        cText = cText.substring(0, 5) + '/';
      } else {
        // Insert / char
        cText = cText.substring(0, 5) + '/' + cText.substring(5, 6);
      }
    } else if (cLen == 7) {
      // Can only be 1 or 2
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 1 || y1 > 2) {
        // Remove char
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      // Can only be 19 or 20
      int y2 = int.parse(cText.substring(7, 8));
      if (y2 < 0 || y2 > 9) {
        // Remove char
        cText = cText.substring(0, 7);
      }
    }
    selectionIndex = cText.length;
    print(selectionIndex);
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
class _TimeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;

    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    //Date

    if (cLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) > 1) {
        // Remove char
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) == 0 || int.parse(cText) > 12 ) {
        // Remove char
        cText = cText.substring(0, 1);
      } else {
        cText += ':';
      }
    } else if (cLen == 2 && pLen == 3) {
      cText = cText.substring(0, 1);
    } else if (cLen == 2 && pLen == 4) {
      cText += ':';
    } else if (cLen == 3 && pLen == 2) {
      cText = cText.substring(0, 2) + ':' + cText.substring(2, 3);
    }

    // Month
    else if (cLen == 4 && pLen == 2) {
      print('s');
      if (int.parse(cText.substring(3, 4)) > 59) {
        cText = cText;
      }
    }
    else if (cLen == 4 && pLen == 3) {
      if (int.parse(cText.substring(3, 4)) > 59) {
        cText = cText.substring(0, 3);
      }

      // // Can only be 0, 1, 2 or 3
      // if (int.parse(cText) > 3) {
      //   // Remove char
      //   cText = '
      // }
      // // Can only be 0 or 1
      // if (int.parse(cText.substring(3, 4)) > 1) {
      //   // Remove char
      //   cText = cText.substring(0, 3);
      // }
    } else if (cLen == 5 && pLen == 4) {
      // Month cannot be greater than 12
      int mm = int.parse(
          cText.substring(3, 5));
      if (mm < 0 || mm > 60) {
        // y1 < 0 || y1 > 5
        // Remove char
        cText = cText.substring(0, 4);
      } else {
        // Add a / char
        cText += ':';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      // Remove / char
      cText = cText.substring(0, cText.length - 1);
    }
    else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        // Replace char
        cText = cText.substring(0, 2) + ':';
      } else {
        // Insert / char
        cText =
            cText.substring(0, pLen) + ':' + cText.substring(pLen, pLen + 1);
      }
    }

    //second

    else if (cLen == 6 && pLen == 5) {
      // Can only be 1 or 2 - if so insert a / char
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 0 || y1 > 6) {
        // Replace char
        cText = cText.substring(0, 5) + ':';
      } else {
        // Insert / char
        cText = cText.substring(0, 5) + ':' + cText.substring(5, 6);
      }
    } else if (cLen == 7) {
      // Can only be 1 or 2
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 0 || y1 > 5) {
        // Remove char
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      // Can only be 19 or 20
      int y2 = int.parse(cText.substring(7, 8));
      if (y2 < 0 || y2 > 9) {
        // Remove char
        cText = cText.substring(0, 7);
      }
    }
    selectionIndex = cText.length;
    print(selectionIndex);
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

