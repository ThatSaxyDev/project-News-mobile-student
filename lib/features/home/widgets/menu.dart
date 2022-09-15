import 'package:flutter/material.dart';
import 'package:project_news_student/shared/app_elements/app_colors.dart';
import 'package:project_news_student/shared/app_elements/app_texts.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Material(
          color: AppColors.neutralWhite,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'New todo',
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.white,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.2,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a note',
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.white,
                    maxLines: 6,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.2,
                  ),
                  // FlatButton(
                  //   onPressed: () {},
                  //   child: const Text('Add'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
