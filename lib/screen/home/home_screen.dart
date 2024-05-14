import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_data_app/model/student_model.dart';
import 'package:student_data_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtGrid2 = TextEditingController();
  TextEditingController txtName2 = TextEditingController();
  TextEditingController txtStd2 = TextEditingController();
  ImagePicker picker = ImagePicker();
  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student data app"),
        backgroundColor: Colors.amber.shade200,
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Text(
                  // studentList[index].no,
                  '${studentList[index].no}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      FileImage(File('${studentList[index].path}')),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      '${studentList[index].name}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('${studentList[index].std}')
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(
                        () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Update Dialog"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FileImage(File('$path')),
                                      child: Align(
                                        alignment: const Alignment(1.2,1),
                                        child: IconButton.filledTonal(
                                            onPressed: () async {
                                              XFile? image =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              setState(() {
                                                path = image!.path;
                                              });
                                            },
                                            icon: const Icon(Icons.add)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        controller: txtGrid2,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            label: Text(
                                                '${studentList[index].no}')),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        controller: txtName2,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            label: Text(
                                                '${studentList[index].name}')),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        controller: txtStd2,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            label: Text(
                                                '${studentList[index].std}')),
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //   onPressed: () {
                                    //     setState(() {
                                    //       Map rename = {
                                    //         "name": txtName2.text,
                                    //         "std": txtStd2.text,
                                    //       };
                                    //
                                    //       // studentList.insert(index, rename);
                                    //     });
                                    //   },
                                    //   child: const Text("Submit"),
                                    // ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          // Map rename = {
                                          //   "name":txtName2.text,
                                          //   "std":txtStd2.text,
                                          // };
                                          String? name = txtName2.text;
                                          String? no = txtGrid2.text;
                                          String? std = txtStd2.text;
                                          String? kpath = path;
                                          Student s2 =
                                              Student(name, no, std, kpath);
                                          // studentList.insert(index, rename);
                                          // studentList.insert(index, s1);
                                          // studentList.add(s1);

                                          studentList[index] = s2;
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: const Text("Submit"),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                          // Navigator.pop(context)
                        },
                      );

                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       title: const Text("Update Dialog"),
                      //       content: Column(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           SizedBox(
                      //             height: 50,
                      //             child: TextFormField(
                      //               controller: txtGrid2,
                      //               decoration: InputDecoration(
                      //                   border: const OutlineInputBorder(),
                      //                   label: Text('${studentList[index].no}')),
                      //             ),
                      //           ),
                      //           const SizedBox(height: 5,),
                      //           SizedBox(
                      //             height: 50,
                      //             child: TextFormField(
                      //             controller: txtName2,
                      //               decoration: InputDecoration(
                      //                   border: const OutlineInputBorder(),
                      //                   label:
                      //                       Text('${studentList[index].name}')),
                      //             ),
                      //           ),
                      //           const SizedBox(height: 5,),
                      //           SizedBox(
                      //             height: 50,
                      //             child: TextFormField(
                      //             controller: txtStd2,
                      //               decoration: InputDecoration(
                      //                   border: const OutlineInputBorder(),
                      //                   label:
                      //                   Text('${studentList[index].std}')),
                      //             ),
                      //           ),
                      //           ElevatedButton(onPressed: () {
                      //             setState(() {
                      //               // Map rename = {
                      //               //   "name":txtName2.text,
                      //               //   "std":txtStd2.text,
                      //               // };
                      //               String? name = txtName2.text;
                      //               String? no = txtName2.text;
                      //               String? std = txtName2.text;
                      //               String? path = txtName2.text;
                      //           Student s1 = Student(name, no, std, path);
                      //               // studentList.insert(index, rename);
                      //             });
                      //           }, child: const Text("Submit"),)
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        studentList.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'product')
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
