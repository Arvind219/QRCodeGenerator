import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_generator/qr_code_scanner.dart';

class QRScannedPage extends StatefulWidget{
  const QRScannedPage({super.key, required this.info});

  final String? info;
  
  @override
  State<QRScannedPage> createState() => _QRScannedPageState(); 
}

class _QRScannedPageState extends State<QRScannedPage> {

  late String? scannedInfo = widget.info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Scanned QR"),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Copy"),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(
                      Icons.copy,
                    )
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(scannedInfo!, style: TextStyle(fontSize: 16,)),
              )
            )
          ],
      ),
      ),
    );
  }
  
}