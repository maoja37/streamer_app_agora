import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:flutter/material.dart';

import '../utils/appId.dart';

class Participant extends StatefulWidget {
  final String channelName;
  final String userName;
  const Participant(
      {Key? key, required this.channelName, required this.userName})
      : super(key: key);

  @override
  State<Participant> createState() => _ParticipantState();
}

class _ParticipantState extends State<Participant> {
  List<int> _users = [];
  late RtcEngine _engine;
  AgoraRtmClient? _client;
  AgoraRtmChannel? _channel;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initializeAgora() async {
    _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    _client = await AgoraRtmClient.createInstance(appId);

    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);

    //Callbacks for the RTC Engine
    _engine.setEventHandler(
        RtcEngineEventHandler(joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        _users.add(uid);
      });
    }));

    //Callbacks for the RTM Client
    _client?.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      print('Private Message from ' + peerId + ": " + message.text);
    };

    _client?.onConnectionStateChanged = (int state, int reason) {
      print('Connection State Changed: ' + state.toString()+ ', reason: ' + reason.toString());
      if(state == 5){
        _channel?.leave();
        _client?.logout();
        _client?.destroy();
        print('Logged out');
         
      }
    };


    //Callbacks for the RTM Channel
    _channel?.onMemberJoined = (AgoraRtmMember member) {
      print("Member joined: " + member.userId + ', channel: ' + member.channelId);
    };
    _channel?.onMemberLeft = (AgoraRtmMember member) {
      print("Member left: " + member.userId + ', channel: ' + member.channelId);
    };
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Participant')),
    );
  }
}
