import 'package:add_expense/models/expense_datastr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModalScreenContent extends StatefulWidget {
  const ModalScreenContent(this.elements, {Key? key}) : super(key: key);
  final Function(Expensestruct) elements;

  @override
  State<ModalScreenContent> createState() {
    return _ModalScreenContentState();
  }
}

class _ModalScreenContentState extends State<ModalScreenContent> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.Work;
  DateTime? pickedDate;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _datePicker() async {
    final now = DateTime.now();
    final pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1997, 01, 01),
      lastDate: now,
    );

    setState(() {
      pickedDate = pickDate;
    });
  }

  void onclickthrerror() async {
    final amountset = double.tryParse(_amountController.text);
    final invalidamount = amountset == null || amountset <= 0;
    if (invalidamount ||
        _textController.text.trim().isEmpty ||
        pickedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text(
              'Please make sure the entered title, date, and amount are valid.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    Expensestruct instancevalue = Expensestruct(
      title: _textController.text,
      amount: double.tryParse(_amountController.text)!,
      category: _selectedCategory,
      date: pickedDate!,
    );

    // Save data to Firestore
    try {
      await _firestore.collection('Expenses').add({
        'amount': double.tryParse(_amountController.text)!,
        'category': _selectedCategory.name,
        'date': pickedDate,
        'uid': '5vYYUYHZWPXw0sywfnBJIe9dTI93'
      });

      widget.elements(instancevalue);
      Navigator.pop(context); // Close the modal after saving to Firestore
    } catch (e) {
      print('Error saving to Firestore: $e');
      // Handle error, show a snackbar, or display an alert
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
            controller: _textController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: 'Rs ',
                    labelText: 'Amount',
                  ),
                ),
              ),
              const SizedBox(width: 80),
              Expanded(
                child: Row(
                  children: [
                    Text(pickedDate == null
                        ? 'No Date Selected'
                        : formatter.format(pickedDate!)),
                    IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              ElevatedButton(
                onPressed: onclickthrerror,
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
