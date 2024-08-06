import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  String text="Stop service";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Background services"),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              FlutterBackgroundService().invoke('setAsForeground');
            }, child: Text("Forground service")),
            ElevatedButton(onPressed: (){
              FlutterBackgroundService().invoke('setAsBackground');
            }, child: Text("background service")),
            ElevatedButton(onPressed: ()async{
              final service=FlutterBackgroundService();
              bool isRunning=await service.isRunning();
              if(isRunning){
                service.invoke("startService");
              }else{
                service.startService();
              }
              if(! isRunning){
                text="Stop service";
              }else{
                text="Start service";
              }
              setState(() {

              });
            }, child: Text("$text"))
          ],
        ),
      ),
    );
  }
}
