import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(
                '${_controller.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Observer(
              builder: (_) {
                return Text(
                  _controller.fullName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Primeiro Nome'),
              onChanged: _controller.setFirstName,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Ultimo Nome'),
              onChanged: _controller.setLastName,
            ),
            IconButton(
              icon: Icon(Icons.person_add),
              onPressed: _controller.addName,
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  var listNames = _controller.listNames;
                  if (listNames.isEmpty) return CircularProgressIndicator();
                  return ListView.builder(
                    itemCount: listNames.length,
                    itemBuilder: (_, index) {
                      var name = listNames[index];

                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(name),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
