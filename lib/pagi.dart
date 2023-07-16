import 'package:flutter/material.dart';
import 'package:proyectofinal2/photoUpload.dart';


class pagi extends StatefulWidget{
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<pagi>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos"),),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_a_photo),
                iconSize:40,
                color: Colors.white,
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return photoUpload();
                  }));

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
