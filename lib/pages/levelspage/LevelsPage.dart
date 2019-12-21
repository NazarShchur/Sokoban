import 'package:flutter/cupertino.dart';
import 'package:game/state/NavigationModel.dart';
import 'package:game/state/pagesEnum.dart';
import 'package:provider/provider.dart';

class LevelsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    return GestureDetector(
      onTap: (){
        model.setCurrentPage(Pages.LEVEL);
      },
      child: Container(
        child: Center(
          child: Text(
            "level1"
          ),
        ),
      ),
    );
      

  }
  
}