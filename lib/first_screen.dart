import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      final text = textEditingController.text;
      try {
        final double value = double.parse(text);
        result = value * 280;
      } catch (e) {
        result = 0; // Handle invalid input
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid number'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 0, 33, 74),
        width: 2.0,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(40),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 242, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 33, 74),
        centerTitle: true,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    helperText: 'Standard Conversion rate is Rs. 280',
                    hintText: 'Enter Amount in USD',
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(255, 0, 33, 74)),
                    prefixIcon: const Icon(Icons.monetization_on),
                    prefixIconColor: const Color.fromARGB(255, 0, 33, 74),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: convert,
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    backgroundColor: const Color.fromARGB(255, 0, 33, 74),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text("Convert"),
                ),
              ),
              if (result > 0) ...[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset:
                            const Offset(0, 3), // changes position of shadow
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
                          color: const Color.fromARGB(255, 0, 33, 74)
                              .withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "PKR ${result.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 33, 74),
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
    );
  }
}
