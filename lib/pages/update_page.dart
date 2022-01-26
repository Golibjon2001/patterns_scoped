
import 'package:flutter/material.dart';
import 'package:patterns_scoped/scoped/update_scoped.dart';
import 'package:scoped_model/scoped_model.dart';



class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String? title, body;
  UpdatePage({this.title, this.body, Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  UpdateScoped updateScoped=UpdateScoped();

  @override
  void initState() {
    super.initState();
    updateScoped.titleTextEditingController.text = widget.title!;
    updateScoped.bodyTextEditingController.text = widget.body!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body:ScopedModel<UpdateScoped>(
        model:updateScoped,
        child:ScopedModelDescendant<UpdateScoped>(
          builder:(context,child,model){
            return SingleChildScrollView(
              child:Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // Title
                        Container(
                          height: 100,
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: TextField(maxLines: 2,
                              controller: updateScoped.titleTextEditingController,
                              style: const TextStyle(fontWeight: FontWeight.bold,
                              ),
                              decoration: const InputDecoration(
                                labelText: 'Title',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),

                        // Body
                        Container(
                          height: 500,
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            controller: updateScoped.bodyTextEditingController,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 10,
                            decoration: const InputDecoration(
                              labelText: 'Body',
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  updateScoped.isLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  ) : const SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          updateScoped.apiPostUpdate(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}