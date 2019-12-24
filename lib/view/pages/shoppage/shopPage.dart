import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/User.dart';

class ShopPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ShopPageState();
  }

}

class ShopPageState extends State<ShopPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: UserService().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Your balance: ${snapshot.data.balance}"),
                  FlatButton(
                    child: Text("add money"),
                    onPressed: () async{
                      await UserService().addUserMoney(100);
                    setState((){});
                  },

                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },

      ),
    );
  }

}