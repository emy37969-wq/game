// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo2_application_1/core/widgets/custom_app_button.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  void opencamera() async {
    await picker.pickImage(source: ImageSource.camera);
  }

  void opengallery() async {
    await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: image == null,
                child: CircleAvatar(
                  radius: 100.r,
                  backgroundColor: Colors.blueAccent.shade100,
                  child: Icon(
                    Icons.person,
                    size: 150.r,
                    color: Colors.white,
                  ),
                ),
                replacement: Icon(Icons.add),
              ),
              CustomAppButton(
                title: "upload from camera",
                onpressed: () {
                  opencamera();
                },
              ),
              CustomAppButton(
                title: "upload from gallery",
                onpressed: () {
                  opengallery();
                },
              ),
              Divider(color: Colors.grey),
              TextFormField(
                onTapOutside: (v) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigoAccent),
                  ),
                ),
              ),
              CustomAppButton(
                title: "done",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
