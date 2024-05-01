import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:toy_shop_app/home_page.dart';
import 'app_state.dart';

void main() => runApp(MyApp());

typedef FetchTime = void Function();

class MyApp extends StatelessWidget {
  final store = Store(
    reducer,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware],
  );

// root widget
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Redux Demo',
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
