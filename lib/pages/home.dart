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
           Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _userName,  
              decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:const   BorderSide(color: Colors.grey),
                    ),
                    hintText: 'User Name',
                  ), 
            )),
            const SizedBox(height: 8),
          Container(        
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  controller: _channelName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Channel Name',
                  ),
                ),
              ),
          TextButton(               
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  Participant(channelName: _channelName.text,  userName: _userName.text,)));
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
                    MaterialPageRoute(builder: (context) =>  Director(channelName: _channelName.text,)));
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
