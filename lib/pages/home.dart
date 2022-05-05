import 'package:flutter/material.dart';
import 'package:streamer/pages/director.dart';
import 'package:streamer/pages/participant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _channelName = TextEditingController();
  final _userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/streamer.png'),
          const SizedBox(height: 8,),
          const Text('Multi Streaming with Friends'),
          const SizedBox(height: 40,),
           SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const  TextField()),
          const TextField(),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Participant()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Participant', style: TextStyle(fontSize: 20)),
                    Icon(Icons.live_tv),
                  ])),
          TextButton(
              onPressed: () {
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Director()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Director', style: TextStyle(fontSize: 20)),
                    Icon(Icons.cut),
                  ])),
        ],
      )),
    );
  }
}
