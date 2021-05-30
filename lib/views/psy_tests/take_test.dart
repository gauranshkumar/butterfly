import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
      "What is the mood?",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.white,
        elevation: 1,
        title: Text(
          'Anxiety Test',
          style: BrandStyles.bodyRegular,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: BrandColors.black),
      ),
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 6),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return TextFormField(
                            //controller: _questionController,
                            maxLines: 6,
                            //validator: validator,
                            minLines: 2,
                            style: GoogleFonts.inter(
                              height: 1,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: BrandColors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: BrandColors.grey,
                              focusColor: BrandColors.black,
                              hintText: questions[index],
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                            ));
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12),
                      itemCount: questions.length),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: BrandColors.blue,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Post your question",
                      style: BrandStyles.subtitle
                          .copyWith(color: BrandColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
