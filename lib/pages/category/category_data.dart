import 'package:dashboard/pages/category/edit.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../function.dart';

List<CategoryData> categoryList = null;

class CategoryData {
  String cat_id;
  String cat_name;
  String cat_name_en;
  String cat_regdate;

  CategoryData({
    this.cat_id,
    this.cat_name,
    this.cat_name_en,
    this.cat_regdate,
  });
}

class SingleCategory extends StatelessWidget {
  int cat_index;
  CategoryData category;
  SingleCategory({this.cat_index, this.category});
  @override
  Widget build(BuildContext context) {
    var providerCategory = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              categoryList.removeAt(cat_index);
              deleteData(
                  "cat_id", category.cat_id, "category/delete_category.php");
              providerCategory.add_loading();
            },
            child: Container(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                category.cat_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(category.cat_regdate)]),
              trailing: Container(
                width: 30.0,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new EditCategory(
                                    cat_index: cat_index,
                                    mycategory: category)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: FaIcon(
                          FontAwesomeIcons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}