import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_setup_app/cubit/second/second_cubit.dart';
import 'package:flutter_setup_app/presentation/model/user.dart';

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<SecondCubit, SecondState>(
                builder: (BuildContext context, state) {
                  if (state is InitialSecondState) {
                    return _buildInitState();
                  } else if (state is LoadingSecondState) {
                    return _buildLoadingState();
                  } else if (state is LoadedSecondState) {
                    return _buildLoadedState(context, state.users);
                  } else {
                    return Center(
                      child: Text("else"),
                    );
                  }
                },
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
    return Expanded(
      child: Center(
        child: Text("Initial"),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, List<User> users) {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].username),
            leading: Icon(Icons.account_circle),
          );
        },
      ),
    );
  }
}
