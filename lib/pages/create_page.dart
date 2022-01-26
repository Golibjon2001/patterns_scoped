
import 'package:flutter/material.dart';
import 'package:patterns_scoped/scoped/create_scoped.dart';
import 'package:scoped_model/scoped_model.dart';

class AddPage extends StatefulWidget {
  static final String id = 'create_page';
  const AddPage({Key? key}) : super(key: key);
  @override
  AddPageState createState() => AddPageState();
}


class AddPageState extends State<AddPage> {
  CreateScoped createScoped=CreateScoped();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body:ScopedModel<CreateScoped>(
        model:createScoped,
        child:ScopedModelDescendant<CreateScoped>(
          builder:(context,child,model){
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Title
                      Container(
                        height: 50,

                        child: Center(
                          child: TextField(
                            controller: createScoped.titleTextEditingController,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              labelText: 'Title',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // Body
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: createScoped.bodyTextEditingController,
                          style: const TextStyle(fontSize: 18),
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
                createScoped.isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          createScoped.apiPostCreate(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}