import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final Stream<String> _stream;

  @override
  void initState() {
    super.initState();
    Stream<String> _stream1 = Stream.periodic(
      const Duration(seconds: 3),
      (i) => 'first stream $i',
    );
    Stream<String> _stream2 = Stream.periodic(
      const Duration(seconds: 5),
      (i) => 'second stream $i',
    );
    _stream = CombineLatestStream(
      [_stream1, _stream2],
      (value) => value.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _items = <String>[];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder<String>(
          stream: _stream,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasError) return Text(snapshot.error.toString());

            if (data == null) {
              return const Center(child: CircularProgressIndicator());
            }

            _items.add(data);
            return ListView(
              children: _items
                  .map((e) => Text(e, style: const TextStyle(fontSize: 24)))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
