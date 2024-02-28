import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/service/database.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodSate();
}

class _AddFoodSate extends State<AddFood> {
  final List<String> fooditems = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];
  String? categoryValue;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  bool adding = false;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) selectedImage = File(image.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        nameController.text.trim() != "" &&
        priceController.text.trim() != "" &&
        detailController.text.trim() != "" &&
        categoryValue != null) {
      setState(() {
        adding = true;
      });

      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": nameController.text.trim(),
        "Price": priceController.text.trim(),
        "Detail": detailController.text.trim()
      };

      DataBaseMethods().addFoodItem(addItem, categoryValue!).then((value) {
        adding = false;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            closeIconColor: Colors.black54,
            showCloseIcon: true,
            backgroundColor: Colors.redAccent,
            content: Column(
              children: [
                Text("Food Item Added Successfully"),
                SizedBox(
                  height: 1.0,
                )
              ],
            )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Add Item',
            style: AppWidget.lightTextFieldStyle(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload the Item Picture',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                selectedImage == null
                    ? GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Center(
                          child: Material(
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Icon(Icons.image_rounded),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Center(
                          child: Material(
                            elevation: 7.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Item Name',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Item Name",
                        hintStyle: AppWidget.lightTextFieldStyle()),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Item Price",
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Item Price",
                        hintStyle: AppWidget.lightTextFieldStyle()),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Item Detail",
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: detailController,
                    maxLines: 6,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Item Detail",
                        hintStyle: AppWidget.lightTextFieldStyle()),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Select Category",
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: fooditems
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              )))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          categoryValue = value;
                        });
                      },
                      dropdownColor: Colors.white,
                      hint: const Text("Select Category"),
                      iconSize: 36,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: categoryValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (!adding) uploadItem();
                  },
                  child: Center(
                      child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: adding
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Adding...",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: const LinearProgressIndicator(
                                      minHeight: 5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : const Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
