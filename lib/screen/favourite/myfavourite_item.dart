import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/favourite_provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItem>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("provider learning"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MyFavouriteItem()));
              },
              icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItem>(
                      builder: (context, value, child) {
                        return ListTile(
                          onTap: () {
                            if (value.selectedItem.contains(index)) {
                              value.removeItem(index);
                            } else {
                              value.addItem(index);
                            }
                          },
                          title: Text("Item" + index.toString()),
                          trailing: Icon(value.selectedItem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
