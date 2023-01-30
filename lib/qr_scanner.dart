import 'package:event_mandela/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  bool isScanCompleted = false;

  void closeScreen(){
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Event Mandela Ticket Scan"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Scanner le QR Code"),
                    Text("Le scan commencera automatiquement"),
                  ],
                  ),
          ),
            Expanded(
              flex: 4,
              child: MobileScanner(
                allowDuplicates: true,
                onDetect: ((barcode, args) {

                  if(!isScanCompleted){
                    String code = barcode.rawValue ?? '---';
                    isScanCompleted = true;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(closeScreen: closeScreen,code: code,)));
                  }

                }
              )),
              ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text("Copyright Event Mandela"),
                )),
          ],
          ),
      ),
    );
  }
}