import 'package:flutter/cupertino.dart';

class ConverterIos extends StatefulWidget {
  const ConverterIos({super.key});

  @override
  State<ConverterIos> createState() => _ConverterIosState();
}

class _ConverterIosState extends State<ConverterIos> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0.0;

  void convert() {
    // Perform conversion logic here
    setState(() {
      result = double.tryParse(textEditingController.text) ??
          0 * 280; // Example conversion
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color(0xFF00214A),
        middle: Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                  controller: textEditingController,
                  padding: const EdgeInsets.all(16.0),
                  placeholder: 'Enter Amount in USD',
                  placeholderStyle:
                      const TextStyle(color: CupertinoColors.inactiveGray),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(CupertinoIcons.money_dollar,
                        color: CupertinoColors.activeBlue),
                  ),
                  clearButtonMode: OverlayVisibilityMode.editing,
                  textInputAction: TextInputAction.done,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF00214A), width: 2.0),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                const SizedBox(height: 20.0),
                CupertinoButton.filled(
                  onPressed: convert,
                  child: const Text("Convert"),
                ),
                const SizedBox(height: 20.0),
                if (result > 0) ...[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Converted Amount",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00214A).withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "PKR ${result.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00214A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
