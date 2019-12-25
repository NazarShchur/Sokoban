import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/pages/levelspage/floatingActionNavigatorPop.dart';
import 'package:game/view/pages/shoppage/buyCoinsTab.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.brown,
        floatingActionButton: FloatingActionNavigatorPop(),
        body: FutureBuilder<User>(
          future: UserService().getCurrentUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              model.initBalance(snapshot.data.balance);
              return Scaffold(
                backgroundColor: Colors.brown,
                appBar: AppBar(
                  leading: Container(),
                  backgroundColor: Constants.buttonBackColor,
                  title: Row(children: [Text("You have: ${model.userBalance}  "), Icon(FontAwesomeIcons.bitcoin, size: 30,)]),
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.format_paint)),
                      Tab(icon: Icon(FontAwesomeIcons.bitcoin)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Icon(Icons.directions_transit),
                    BuyCoinsTab(),
                  ],
                )
                );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
