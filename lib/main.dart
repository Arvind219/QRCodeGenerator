import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_generator/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          )
        )
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

  TextEditingController dataController = TextEditingController();

  String? data;

  void _submitForm(){
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      // You can perform actions with the form data here and extract the details
      print('Data: $data');

      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => QrCodeScannerPage()),
                );
              },
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 35,
              )
          ),
          SizedBox(width: 15,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                              "Information Field:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              controller: dataController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Input Information",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  )
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(900), // using this instead of 'maxLength: 900' to hide the counter of text field.
                              ],
                              // maxLength: 900, // If I us this, there isn't any option to hide the counter of the text field.
                              minLines: 1,
                              maxLines: 15,
                              validator: (value){
                                if(value!.isEmpty || value.length < 15){
                                  return "The character count must be greater than 15.";
                                }
                                return null;
                              },
                              onSaved: (value){
                                data = dataController.text;
                              },
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: ElevatedButton(
                                  onPressed: _submitForm,
                                  child: Text("Generate QR")
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                if(data != null)
                  QrImageView(
                    data: '$data',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                SizedBox(height: 20,),

              ],
            ),
        
          ),
      ),
    );
  }
}
