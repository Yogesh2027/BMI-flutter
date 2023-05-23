import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result="";
  var bgcolor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Center(
            child: Text('yourBMI', style: TextStyle(
              fontSize: 40,)
            ),
          ),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),),
                  SizedBox(height: 31,),
                  TextField(
                    controller:wtController,
                    decoration: InputDecoration(
                        label: Text('enter your weight in kg'),
                        prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller:ftController,
                    decoration: InputDecoration(
                        label: Text('enter your height in feet'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller:inController,
                    decoration: InputDecoration(
                        label: Text('enter your height in inch'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  ElevatedButton(onPressed:(){
                    var wt= wtController.text.toString();
                    var ft= ftController.text.toString();
                    var inch= inController.text.toString();

                    if(wt!="" && ft!="" && inch!=""){
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift*12)+ iInch;
                      var tM=(tInch*2.54)/100;
                      var bmi=iwt/(tM*tM);
                      var msg = "";
                      if(bmi>25){
                        msg= "you are over weight";
                        bgcolor =Colors.red.shade500;
                      }else if(bmi<18){
                        msg= "you are under weight";
                        bgcolor =Colors.yellow.shade500;
                      }else{
                        msg= "you are good shape congratulations";
                        bgcolor =Colors.green.shade500;
                      }

                      setState(() {
                        result="$msg \n  your BMi is: ${bmi.toStringAsFixed(2)}";
                      });

                    }else{
                      setState(() {
                        result="please fill all the required blanks";
                      });
                    }

                  }, child: Text('calculate')),
                  SizedBox(height: 21,),
                  Text(result,style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
          ),
        )

    );
  }
}
