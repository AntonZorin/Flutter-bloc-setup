import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_setup_app/common/navigator.dart';
import 'package:flutter_setup_app/cubit/home/home_cubit.dart';
import 'package:flutter_setup_app/locale/app_localization.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.bloc<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString("home_page_title")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (BuildContext context, state) {
                if (state is InitialHomeState) {
                  return _buildColorBox(Colors.grey);
                } else if (state is LoadingHomeState) {
                  return _buildColorBox(Colors.yellow);
                } else if (state is LoadingFinishedHomeState) {
                  return _buildColorBox(
                      (state as LoadingFinishedHomeState).color);
                } else
                  return _buildColorBox(Colors.grey);
              },
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  cubit.paintGreen();
                },
              ),
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  cubit.paintRed();
                },
              ),
              RaisedButton(
                child: Text(context.getString("home_page_navigate")),
                onPressed: () {
                  AppRouter.instance(Screens.SECOND_PAGE);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildColorBox(MaterialColor color) {
  return Container(
    width: 200,
    height: 200,
    color: color,
    child: Text(""),
  );
}
