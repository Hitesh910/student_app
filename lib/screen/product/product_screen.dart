import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_data_app/model/student_model.dart';
import 'package:student_data_app/utils/global.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController txtGrid = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtStd = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          backgroundColor: Colors.amber.shade200,
        ),
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [BoxShadow(blurRadius: 5,spreadRadius: -2)]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Student Data",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 10,),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                           CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(File("$path"))
                            // child: Image.file(File("$path"),fit: BoxFit.fill,),
                          ),
                          SizedBox(
                            height: 120,
                            child: Align(
                              alignment: const Alignment(0.3,0.9),
                              child: IconButton.filledTonal(
                                  onPressed: () async {
                                    XFile? image = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    setState(() {
                                      path = image!.path;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.grey),
                                  )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: txtGrid,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter grid"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Grid is required";
                            }
                            return null;
                          }
                        )),
                      const SizedBox(height: 5,),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: txtName,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter name"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(height: 50,
                        child: TextFormField(
                          controller: txtStd,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter std"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Stdanderd is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5,),
                      ElevatedButton(
                          onPressed: () {
                            if (fromKey.currentState!.validate())
                              {
                               // String? path = path;
                              String? no = txtGrid.text;
                               String? name = txtName.text;
                              String? std = txtStd.text;
                              String? kpath = path;
            
                              Student s1 = Student(name, no, std, kpath);
            
                              studentList.add(s1);
                              print('$name $name');
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Submit"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
