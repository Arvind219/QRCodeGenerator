import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'QR Code Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // A key for managing the form

  TextEditingController elevenDigitNumberController = TextEditingController();
  TextEditingController MRPController = TextEditingController();

  int? elevenDigitNo;
  double? MRP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "11 Digit Number:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            controller: elevenDigitNumberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter 11 digit number",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              )
                            ),
                            onSaved: (value){
                              elevenDigitNo = int.tryParse(elevenDigitNumberController.text);
                            },
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "MRP:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            controller: MRPController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter MRP",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                )
                            ),
                            onSaved: (value){
                              MRP = double.parse(MRPController.text);
                            },
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Manufacturer Date:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter Manufacturer Date",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Batch Number:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter Batch Number",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                              onPressed: (){
                                // Check if the form is valid
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save(); // Save the form data
                                  // You can perform actions with the form data here and extract the details
                                  print('11 digit number: $elevenDigitNo');
                                  print('MRP: $MRP');
                                }
                              },
                              child: Text("Submit"))
                        ],
                      )
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
