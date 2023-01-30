import 'package:event_mandela/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {

  final String code;
  final Function() closeScreen;
  

  const ResultScreen({super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {

    String lienDeValidation = "https://eventmandela.com/?check_qrcode=$code&post_type=event";
    final uri = Uri.parse(lienDeValidation);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
        onPressed: (){
          closeScreen();
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87,)),
        centerTitle: true,
        title: const Text("Event Mandela Ticket Scan"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //show QR Code here
            QrImage(
              data: code, 
              size: 150, 
              version: QrVersions.auto,
              ),

            const Text("QR code du ticket"),
            Text(code),
            ElevatedButton(
              onPressed: () {
                _launchInApp(uri);
            },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
                ), 
            child: const Text("Vérifier")),
          ],
        ),
        ),
    );
  }

  Future<void> _launchInApp(Uri url) async {
    if (await canLaunchUrl(url)) {
      // ignore: deprecated_member_use
      await launch(
        url.toString(),
        forceSafariVC: false,
        forceWebView: false
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
