import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/ui/shared/ui_helper.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../core/data_sources/activity/activity_post.dart';
import '../../../core/data_sources/material/materials_post.dart';
import '../../../core/data_sources/user/user.dart';

class AddMaterialPage extends StatefulWidget {
  const AddMaterialPage({super.key});

  @override
  State<AddMaterialPage> createState() => _AddMaterialPageState();
}

class _AddMaterialPageState extends State<AddMaterialPage> {
  File? image;
  UploadTask? uploadTask1;
  var imageUrl;
  final ImagePicker _picker = ImagePicker();
  final materialController = TextEditingController();
  final quantityController = TextEditingController();
  final descriptionController = TextEditingController();
  final stateController = TextEditingController();
  Future pickImageGallery(materialControllerpass, quantityControllerpass,
      descriptionControllerpass, stateControllerpass) async {
    final pickedFile1 = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile1 != null) {
        image = File(pickedFile1.path);
        uploadFile(materialControllerpass, quantityControllerpass,
            descriptionControllerpass, stateControllerpass);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickImageCamera(materialControllerpass, quantityControllerpass,
      descriptionControllerpass, stateControllerpass) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        uploadFile(materialControllerpass, quantityControllerpass,
            descriptionControllerpass, stateControllerpass);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile(materialControllerpass, quantityControllerpass,
      descriptionControllerpass, stateControllerpass) async {
    if (image == null) return;
    final fileName = File(image!.path);
    //final destination = 'files/$fileName';

    final ref = FirebaseStorage.instance.ref().child('file/$fileName');

    uploadTask1 = ref.putFile(fileName);
    materialController.text = materialControllerpass;
    imageUrl = await (await uploadTask1)?.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 73, 101, 58),
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
          ),
          title: const Center(
              child: Text(
            "إضافة مواد",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Karla'),
          ))),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
              Widget>[
            UIHelper.verticalSpaceLarge(),
            const Text(
              'المادة',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Karla'),
            ),
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                items: <String>['انابيب', 'حديد'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: 'حديد',
                onChanged: (value) {
                  materialController.text = value.toString();
                }),
            UIHelper.verticalSpaceLarge(),
            const Text(
              'الكمية',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Karla'),
            ),
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                items: <String>['1', '2'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: '1',
                onChanged: (value) {
                  quantityController.text = value.toString();
                }),
            UIHelper.verticalSpaceLarge(),
            const Text(
              'الوصف',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Karla'),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 233, 233, 233),
                ),
                color: const Color.fromARGB(255, 233, 233, 233),
              ),
              child: TextField(
                controller: descriptionController,
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.multiline,
                minLines: 1, // <-- SEE HERE
                maxLines: 25, // <-
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'اضف وصف للعمل من فضلك',
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            UIHelper.verticalSpaceLarge(),
            const Text(
              'الحالة',
              style: TextStyle(fontSize: 16, fontFamily: 'Karla'),
            ),
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                items: <String>[
                  'مستمرة',
                  'مكتملة',
                  'محذوفة',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: 'مستمرة',
                onChanged: (value) {
                  stateController.text = value.toString();
                }),
            UIHelper.verticalSpaceLarge(),
            const Text(
              'اضف صورة او تقرير للعمل',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Karla'),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              InkWell(
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset('assets/fetch_photo.png')),
                onTap: () {
                  pickImageGallery(
                      materialController.text,
                      quantityController.text,
                      descriptionController.text,
                      stateController.text);
                },
              ),
              UIHelper.horizontalSpaceLarge(),
              InkWell(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/take_photo.png')),
                onTap: () {
                  pickImageCamera(
                      materialController.text,
                      quantityController.text,
                      descriptionController.text,
                      stateController.text);
                },
              ),
              InkWell(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/paper.png')),
                onTap: () {
                  pickImageGallery(
                      materialController.text,
                      quantityController.text,
                      descriptionController.text,
                      stateController.text);
                },
              ),
            ]),
            UIHelper.verticalSpaceLarge(),
            image != null
                ? Center(
                    child: SizedBox(
                        width: 150, height: 150, child: Image.file(image!)))
                : const Center(
                    child: Text(
                    "لم يتم إضافة صورة بعد",
                    style: TextStyle(fontSize: 16, fontFamily: 'Karla'),
                  )),
            UIHelper.verticalSpaceExtraLarge(),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<MaterialsPost>(context, listen: false)
                          .addMaterialsPost(
                              Provider.of<Users>(context, listen: false)
                                  .usersNow[0]
                                  .idUser,
                              Provider.of<Users>(context, listen: false)
                                  .usersNow[0]
                                  .department,
                              Provider.of<Users>(context, listen: false)
                                  .usersNow[0]
                                  .userName,
                              descriptionController.text,
                              imageUrl.toString(),
                              stateController.text,
                              materialController.text,
                              quantityController.text);
                      //add activity
                      Provider.of<ActivityPost>(context, listen: false)
                          .addactivityPost(
                              'idUser',
                              'Material',
                              'الأي تي',
                              'وليد',
                              descriptionController.text,
                              imageUrl.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 73, 101, 58),
                    ),
                    child: const Text(
                      "تأكيد",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla'),
                    ),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
