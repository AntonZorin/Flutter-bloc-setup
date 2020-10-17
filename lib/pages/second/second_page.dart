import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_setup_app/cubit/second/second_cubit.dart';

import '../../locale/app_localization.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.getString("second_page_title"),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: BlocBuilder<SecondCubit, SecondState>(
                  builder: (BuildContext context, state) {
                    if (state is InitialSecondState) {
                      return _buildInitState();
                    } else if (state is LoadingSecondState) {
                      return _buildLoadingState();
                    } else if (state is LoadedSecondState) {
                      return _buildLoadedState();
                    } else {
                      return Center(
                        child: Text("else"),
                      );
                    }
                  },
                ),
              ),
              RaisedButton(
                child: Text(context.getString("second_page_get_users")),
                onPressed: () =>
                    BlocProvider.of<SecondCubit>(context).getUsers(),
              )
            ],
          )),
    );
  }

  Widget _buildInitState() {
    return Center(
      child: Text("Initial"),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Text("Loading"),
    );
  }

  Widget _buildLoadedState() {
    return Center(
      child: Text("Loaded"),
    );
  }
}
