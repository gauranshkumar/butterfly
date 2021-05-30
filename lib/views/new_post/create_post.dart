import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/models/post.dart';
import 'package:butterfly/models/tag.dart';
import 'package:butterfly/view_models/new_post/create_post_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatelessWidget {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.white,
        iconTheme: IconThemeData(color: BrandColors.black),
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Ask Question',
          style: BrandStyles.bodyRegular.copyWith(color: BrandColors.black),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<CreatePostViewModel>(
      builder: (context, createPostViewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Add a Tag',
                  style: BrandStyles.bodyBold,
                ),
                SizedBox(height: 8),
                _buildTagPills(createPostViewModel),
                SizedBox(height: 8),
                Text(
                  'Question',
                  style: BrandStyles.bodyBold,
                ),
                TextFormField(
                  controller: _questionController,
                  maxLines: 6,
                  validator: validator,
                  minLines: 3,
                  style: GoogleFonts.inter(
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: BrandColors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: BrandColors.grey,
                    focusColor: BrandColors.black,
                    hintText: 'Write your question',
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Describe',
                  style: BrandStyles.bodyBold,
                ),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 8,
                  minLines: 5,
                  validator: validator,
                  style: GoogleFonts.inter(
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: BrandColors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: BrandColors.grey,
                    focusColor: BrandColors.black,
                    hintText: 'Describe your problem',
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
                SizedBox(height: 16),
                Center(child: _postButton(context, createPostViewModel))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _postButton(context, CreatePostViewModel createPostViewModel) {
    return OutlinedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: BrandColors.blue),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              ContinuousRectangleBorder(side: BorderSide.none))),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          final tag = createPostViewModel.currentTagTitle;
          final question = _questionController.text;
          final description = _descriptionController.text;
          final post = Post(
            authorId: FirebaseAuth.instance.currentUser.uid,
            title: question,
            description: description,
            category: tag,
            appreciateIdArray: [],
            supportIdArray: [],
            comments: [],
          );
          final isPostSuccess = createPostViewModel.postQuestion(post);
          if (isPostSuccess) {
            Fluttertoast.showToast(msg: "Succesfully posted 😄");
            Navigator.pop(context);
          }
        }
      },
      child: Text(
        "Post",
        style: BrandStyles.headingBold.copyWith(
          fontSize: 20,
          color: BrandColors.blue,
        ),
      ),
    );
  }

  String validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  Widget _buildTagPills(CreatePostViewModel createPostViewModel) {
    return Wrap(
      children: [
        ...kQuestionTags.map(
          (element) => GestureDetector(
            onTap: () => createPostViewModel.updateTag(element),
            child: getPill(element),
          ),
        ),
      ],
    );
  }

  Widget getPill(Tag tag) {
    final backgroundColor =
        tag.isSelected ? BrandColors.blue : BrandColors.violet;
    final textColor = tag.isSelected ? BrandColors.violet : BrandColors.blue;
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        tag.title,
        style: BrandStyles.bodyBold.copyWith(
          color: textColor,
          fontSize: 14,
        ),
      ),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(32)),
    );
  }
}
