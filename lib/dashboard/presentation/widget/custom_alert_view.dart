import 'package:flutter/material.dart';
import 'package:product/core/service/navigation_service.dart';
import 'package:product/core/service/service_locator.dart';

class WithdrawAmountDialog extends StatelessWidget {
  final Function(String) onTap;
  const WithdrawAmountDialog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final amountController = TextEditingController();

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // Set border radius
      ),
      title: const Text(
        'Withdraw Amount',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter Amount',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an amount';
            }
            if (double.tryParse(value) == null || double.parse(value) <= 0) {
              return 'Please enter a valid amount';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            getIt<NavigationService>().goBack();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onTap(amountController.text.trim());

              amountController.clear();
              getIt<NavigationService>().goBack();
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
