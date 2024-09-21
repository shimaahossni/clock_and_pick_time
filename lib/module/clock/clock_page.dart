import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:one_clock/one_clock.dart';

class ClockPage extends StatefulWidget {
  static const String routeName="clockPage";
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  String _selectedClock='analog';
  var current="";
  DateTime dateTime = DateTime.now();
  double sliderValue=0;
  double zoom=150;
  TimeOfDay _timeOfDay=TimeOfDay.now();

  void _setNewDateTime(DateTime dateTiime) {
    setState(() {
      dateTime = dateTiime;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1),(timer) {
      setState(() {
        current=DateFormat.jms().format(DateTime.now());
      });
    },);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    zoom=150;
  }


  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
        toolbarHeight: mediaquery.height*.1,
        title: Text("Clock",style: TextStyle(fontSize: 25),),
      ),
      drawer: Drawer(
        width: 265,
        backgroundColor: Colors.white,


        child: Column(
          children: [
            SizedBox(height: mediaquery.height*.08,),
            Image.asset("assets/logo.png",width: mediaquery.width*.35,),
            SizedBox(height: mediaquery.height*.01,),
            //clock type text
            Row(
              children: [
                SizedBox(width: mediaquery.width*.02,),
                 Text("Clock Type",style: TextStyle(
                  fontSize: 30,
                  color: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
            ListTile(
              leading: Radio(
                value: 'analog',
                groupValue: _selectedClock,
                onChanged: (value) {
                  setState(() {
                    _selectedClock=value!;
                  });
                },
              ),
              title: Text('Analog Clock',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            ListTile(
              leading: Radio(
                value: 'digital',
                groupValue: _selectedClock,
                onChanged: (value) {
                  setState(() {
                    _selectedClock=value!;
                  });
                },
              ),
              title: Text('digital Clock',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            ListTile(
              leading: Radio(
                value: 'text',
                groupValue: _selectedClock,
                onChanged: (value) {
                  setState(() {
                    _selectedClock=value!;
                  });
                },
              ),
              title: Text('Text Clock',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),

           // Text(_selectedClock == 'analog' ? 'Hello gentlement!' : 'Hi lady!'),

            //clock size text
            SizedBox(height: mediaquery.height*.06,),
            Row(
              children: [
                SizedBox(width: 7,),
                Icon(Icons.text_fields_outlined,color: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,size: 25,),
                SizedBox(width: 7,),
                Text("Clock Size",style: TextStyle(color: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,fontSize: 28,fontWeight: FontWeight.bold),),

              ],
            ),

            //zoom bar

            Slider(
                value: sliderValue,
                min: 0,
                max: 50,
               // divisions: 5,
                label: sliderValue.round().toString(),
                onChanged: (value) {
                  setState(() {
                    sliderValue=value;
                    zoom==500?zoom=150:zoom++;
                  });
                },),

            //color button
           Row(
           //  mainAxisAlignment: MainAxisAlignment.center,
             children: [
               MaterialButton(onPressed: () {
                 _selectedClock='analog';
               },child: Container(
                 height: 30,
                 width: 30,
                 decoration: BoxDecoration(
                   color: Colors.blue,
                   border: Border.all(),
                 ),
               ),
               ),
               MaterialButton(onPressed: () {
                 _selectedClock='digital';
               },child: Container(
                 height: 30,
                 width: 30,
                 decoration: BoxDecoration(
                   color: Colors.green,
                   border: Border.all(),
                 ),
               ),
               ),
               MaterialButton(onPressed: () {
                 _selectedClock='text';
               },child: Container(
                 height: 30,
                 width: 30,
                 decoration: BoxDecoration(
                   color: Colors.orange,
                   border: Border.all(),
                 ),
               ),
               ),
             ],
           ),
            SizedBox(height: mediaquery.height*.05,),

            //time picker
            MaterialButton(
               color:  _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                onPressed: () {
                 Navigator.pop(context);
            },
              child:Text("Pick Time",style: TextStyle(
                fontSize: 20,
              ),)
            ),

          ],
        ),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: mediaquery.height*.05,),
            Text(DateTime.now().toString().substring(0,11),style: TextStyle(fontSize: 50,color: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,),),
            SizedBox(height: mediaquery.height*.09,),
            Container(
              //height: mediaquery.height*.1,
              //color: Colors.orange,
              child:Column(
                children: [
                  _selectedClock == 'analog'?
                      SizedBox(
              height: 200,
                child: AnalogClock(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.0,
                        color: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                      ),
                      color: Colors.transparent,
                      shape: BoxShape.circle
                  ),
                  width: zoom,
                  isLive: true,
                  hourHandColor: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                  minuteHandColor: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                  showSecondHand: true,
                  digitalClockColor: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                  secondHandColor: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                  tickColor: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                  numberColor: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                  showNumbers: true,
                  showAllNumbers: false,
                  textScaleFactor: 1.4,
                  showTicks: true,
                  showDigitalClock: true,
                  datetime: DateTime(2019, 1, 1, 9, 12, 15),
                ),
              )
                      :_selectedClock=='digital'
                      ? Text(current.toString(),style: TextStyle(color: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,fontSize: zoom/5),)
                      :Text(DateTime.now().toString().substring(11,26),style: TextStyle(color: _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,fontSize: zoom/5),),
                ],
              )


            ),

            SizedBox(height: mediaquery.height*.1,),
            //pick time here
            MaterialButton(
                color:  _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,
                onPressed: () async{
                  final TimeOfDay? timeOfDay=await showTimePicker(
                      context: context,
                      initialTime: _timeOfDay,
                    initialEntryMode: TimePickerEntryMode.dial
                  );
                  if(timeOfDay!=null){
                    setState(() {
                      _timeOfDay=timeOfDay;
                    });
                  }
                },
                child:Text("Pick Time",style: TextStyle(
                  fontSize: 20,
                ),)
            ),
            SizedBox(height: mediaquery.height*.03,),
            Text('You Select :${_timeOfDay.format(context).toString()}',style: TextStyle(fontSize: 40, color:  _selectedClock=='analog'?Colors.blue : _selectedClock=='digital'?Colors.green:Colors.orange,),),


          ],
        ),
      ),
    );
  }
}
