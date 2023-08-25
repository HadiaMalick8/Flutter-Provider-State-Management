import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_practice/screens/favourite/my_favourite_screen.dart';

import '../../provider/favourite_item_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite App'),
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavouriteItemScreen()));
              },
              child: const Icon(Icons.favorite),
            ),
            const SizedBox(height: 20.0,),
          ],
        ),
        body: Row(
          children: [Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,index){
                return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                  return ListTile(
                    onTap: (){
                      if(value.selectedItem.contains(index)){
                        value.removeItem(index);
                      }
                      else {
                        value.addItem(index);
                      }
                    },
                    title: Text('Item : $index'),
                    trailing: Icon(
                        value.selectedItem.contains(index)? Icons.favorite :Icons.favorite_border_outlined
                    ),
                  );
                });
              }
            ),
          ),]
        ),
      );
  }
}
