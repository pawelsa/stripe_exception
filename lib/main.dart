import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = "<>";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Open sheet"),
          onPressed: () async {
            await _preparePaymentSheet();
            await Stripe.instance.presentPaymentSheet();
          },
        ),
      ),
    );
  }


  Future<void> _preparePaymentSheet() async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: "<>",
        applePay: false,
        googlePay: false,
        currencyCode: 'PLN',
        merchantCountryCode: 'PL',
        testEnv: true,
        style: ThemeMode.light,
      ),
    );
  }


}
