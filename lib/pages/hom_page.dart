import 'package:flutter/material.dart';
import 'package:patterns_scoped/scoped/hom_scoped.dart';
import 'package:patterns_scoped/views/item_of_post.dart';
import 'package:scoped_model/scoped_model.dart';

import 'create_page.dart';


class HomePage extends StatefulWidget {
  static final String id="hom_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomScoped scoped= HomScoped();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoped.apiPostList();
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Scoped Model"),
          centerTitle:true,
        ),
        body: ScopedModel<HomScoped>(
          model:scoped,
          child:ScopedModelDescendant<HomScoped>(
              builder: (context, child, model){
                return Stack(
                  children: [
                    ListView.builder(
                      itemCount: scoped.items.length,
                      itemBuilder: (ctx, index) {
                        return itemOfPost(scoped,scoped.items[index],context);
                      },
                    ),
                    scoped.isLoading
                        ? const Center(
                          child: CircularProgressIndicator(),
                    )
                        : const SizedBox.shrink(),
                  ],
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context,AddPage.id);
          },
          child: const Icon(Icons.add),
        ));
  }

}

