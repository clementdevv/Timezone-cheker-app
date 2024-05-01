import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:toy_shop_app/app_state.dart';
import 'package:toy_shop_app/main.dart';
import 'package:toy_shop_app/middleware.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Flutter Redux demo")),
      ),
      body: Center(
        child: Container(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // display time and location
              StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (_, state) {
                  return Column(
                    children: [
                      Text(
                        (state.location == false && state.time == false)
                            ? 'timezone display'
                            : 'The Time in ${state.location} is ${state.time}',
                        textAlign: TextAlign.center, // Conditional statement
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.green,
                        ),
                      ),
                      // Text(

                      // ),
                    ],
                  );
                },
              ),

              // fetch time button
              StoreConnector<AppState, FetchTime>(
                converter: (store) => () => store.dispatch(fetchTime),
                builder: (_, fetchTimeCallback) {
                  return SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(
                                color: Colors.brown,
                              ),
                            )),
                        onPressed: fetchTimeCallback,
                        child: const Center(
                          child: Text(
                            "Click to fetch time",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 19),
                          ),
                        )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
