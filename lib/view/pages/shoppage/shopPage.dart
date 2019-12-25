import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShopPageState();
  }
}

class ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserModel>(context);
    return Scaffold(
      body: FutureBuilder<User>(
        future: UserService().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            model.initBalance(snapshot.data.balance);
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Your balance: ${model.userBalance}"),
                  FlatButton(
                    child: Text("add money"),
                    onPressed: () {
                      model.addBalance(100);
                      UserService().addUserMoney(100);//todo different offers
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
