
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:patterns_scoped/model/post_model.dart';
import 'package:patterns_scoped/pages/hom_page.dart';
import 'package:patterns_scoped/server/http_server.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateScoped extends Model{
  bool isLoading = false;
  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController bodyTextEditingController = TextEditingController();

  apiPostCreate(BuildContext context) async {
    isLoading = true;

    Post post = Post(
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: Random().nextInt(99999));

    var response =
    await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.id, (route) => false);
    }
    isLoading = false;
  }

}