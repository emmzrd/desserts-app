import 'package:flutter/material.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String dropdownValue = 'Cash on Delivery';


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [
          Icon(Icons.payment,color: Colors.blue,size: 30,),
          SizedBox(
            width: 10,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            elevation: 16,
            style: const TextStyle(color: Colors.blue,fontSize: 15),
            underline: Container(
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Cash on Delivery', 'Credit Card', 'Debit Card']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],),
      ],
    );
  }
}
