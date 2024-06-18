import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/search_field.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  _CreateRecipeScreenState createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _title;
  String? _description;
  String? _cookingTime;
  String? _ingredients;
  String? _steps;
  String? _imageUrl;
  int stepsCount = 1;
  int ingredientsCount = 1;

  Map steps = {};
  Map ingredients = {};
  List<XFile?> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4.0,
        shadowColor: Colors.grey.shade50,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Recipe Title',
                        border: customBorder,
                        focusedBorder: customBorder,
                        enabledBorder: customBorder,
                        disabledBorder: customBorder,
                      ),
                      onSaved: (value) => _title = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();

                          List<XFile?> images = await picker.pickMultiImage();
                          setState(() {
                            selectedImages = images;
                          });
                        },
                        padding: const EdgeInsets.all(16),
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.orange.shade100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        icon: const Icon(
                          Icons.image_outlined,
                          color: Colors.orange,
                        ),
                      ),
                      Positioned(
                          right: -5,
                          top: -5,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10,
                            child: Center(
                              child: Text(
                                selectedImages.length.toString(),
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
              if (selectedImages.isNotEmpty) const SizedBox(height: 12),
              if (selectedImages.isNotEmpty)
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                    ),
                    height: 82,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.file(
                              File(selectedImages[index]!.path),
                              fit: BoxFit.cover,
                            )),
                      ),
                      itemCount: selectedImages.length,
                      scrollDirection: Axis.horizontal,
                    )),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: customBorder,
                  focusedBorder: customBorder,
                  enabledBorder: customBorder,
                  disabledBorder: customBorder,
                ),
                maxLines: 3,
                onSaved: (value) => _description = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cooking Time',
                  border: customBorder,
                  focusedBorder: customBorder,
                  enabledBorder: customBorder,
                  disabledBorder: customBorder,
                ),
                onSaved: (value) => _cookingTime = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cooking time';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 6,
                      ),
                  shrinkWrap: true,
                  itemCount: ingredientsCount,
                  itemBuilder: (context, index) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ingredient ${index + 1}',
                        border: customBorder,
                        focusedBorder: customBorder,
                        enabledBorder: customBorder,
                        disabledBorder: customBorder,
                      ),
                      onChanged: (val) {
                        ingredients[index.toString()] = val;
                      },
                      maxLines: 1,
                      onSaved: (value) => _steps = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter steps';
                        }
                        return null;
                      },
                    );
                  }),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (ingredientsCount > 1)
                    TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.red.shade100),
                        onPressed: () {
                          setState(() {
                            ingredientsCount--;
                            ingredients.remove(ingredientsCount);
                          });
                        },
                        child: Text(
                          'Remove',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.orange.shade100),
                        onPressed: () {
                          setState(() {
                            ingredientsCount++;
                          });
                        },
                        child: Text(
                          'Add Step',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 6,
                      ),
                  shrinkWrap: true,
                  itemCount: stepsCount,
                  itemBuilder: (context, index) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Steps ${index + 1}',
                        border: customBorder,
                        focusedBorder: customBorder,
                        enabledBorder: customBorder,
                        disabledBorder: customBorder,
                      ),
                      onChanged: (val) {
                        log({index: val}.toString());
                        steps[index.toString()] = val;

                        log(steps.toString());
                      },
                      maxLines: 1,
                      onSaved: (value) => _steps = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter steps';
                        }
                        return null;
                      },
                    );
                  }),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (stepsCount > 1)
                    TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.red.shade100),
                        onPressed: () {
                          setState(() {
                            stepsCount--;
                            steps.remove(stepsCount);
                          });
                        },
                        child: Text(
                          'Remove',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )),
                  const Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.orange.shade100),
                      onPressed: () {
                        setState(() {
                          stepsCount++;
                        });
                      },
                      child: Text(
                        'Add Step',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width * 0.45, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: const Text('Preview')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width * 0.45, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: const Text('Save')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle the form submission
      // For example, you could send the data to a server or save it in a database
      print('Title: $_title');
      print('Description: $_description');
      print('Cooking Time: $_cookingTime');
      print('Ingredients: $_ingredients');
      print('Steps: $_steps');
      print('Image URL: $_imageUrl');
      // Show a success message or navigate to another screen
    }
  }
}
