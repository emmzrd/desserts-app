import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:day18_desserts/models/models.dart';
import 'package:day18_desserts/components/grocery_tile.dart';


class GroceryItemScreen extends StatefulWidget {

  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {

  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.LOW;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.blue;
  int _currentSliderValue = 0;
  String _payment = 'Cash on Delivery';

  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      _payment = originalItem.payment;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(
        hour: date.hour,
        minute: date.minute,
      );
      _dueDate = date;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFF0A0E21),
      appBar: AppBar(
        title: const Text('Grocery Item'),
        centerTitle: true,
      ),
      body: Container(

        padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
        child: ListView(children: [
          buildNameField(),
          buildQuantityField(),
          buildImportanceField(),
          Row(
            children: [
              Expanded(child: buildDateField(context)),
              Expanded(child: buildTimeField(context)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            Expanded(child: buildColorPicker(context)),
            // Expanded(child: Payment()),
            Expanded(child: buildPayment(),),
          ],),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Orders',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          GroceryTile(
            item: GroceryItem(
              id: 'preview',
              name: _name,
              importance: _importance,
              color: _currentColor,
              quantity: _currentSliderValue,
              date: DateTime(
                _dueDate.year,
                _dueDate.month,
                _dueDate.day,
                _timeOfDay.hour,
                _timeOfDay.minute,
              ),
              payment: _payment,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildAddButton(),
        ]),
      ),
    );
  }


  Widget buildNameField() {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Product Name',
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
              Text('My Cart: $_currentSliderValue',style: TextStyle(color: Colors.blue),),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _nameController,
            cursorColor: _currentColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              filled: true,
              fillColor: Color(0XFF1D1E33),
              hintText: 'E.g. Mango, Orange, Sugar',
              hintStyle: TextStyle(color: Color(0XFF4C4F5E)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF1D1E33)),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF1D1E33)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }


  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.priority_high,
              color: Colors.blue.shade800,
              size: 30,
            ),
            Text('Priority',
                style: TextStyle(fontSize: 15, color: Colors.blue)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              selectedColor: Colors.blue,
              label: const Text('low'),
              selected: _importance == Importance.LOW,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.LOW;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.blue,
              label: const Text('medium'),
              selected: _importance == Importance.MEDIUM,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.MEDIUM;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.blue,
              label: const Text('high'),
              selected: _importance == Importance.HIGH,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.HIGH;
                });
              },
            ),
          ],
        )
      ],
    );
  }


  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.blue.shade800,
              size: 30,
            ),
            TextButton(
              onPressed: () async {

                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
              child: Text(
                'Select Delivery Date',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        Text(
          '${DateFormat('yyyy-MM-dd').format(_dueDate)}',
          style: TextStyle(fontSize: 15, color: Colors.white,),
        ),
      ],
    );
  }


  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time_filled,
              size: 30,
              color: Colors.blue.shade800,
            ),
            TextButton(
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
              child: Text(
                'Select Time',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        Text(
          '${_timeOfDay.format(context)}',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }


  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.shopping_bag,
              color: _currentColor,
              size: 30,
            ),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: BlockPicker(
                          pickerColor: Colors.white,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Save'),
                          )
                        ],
                      );
                    });
              },
              child: const Text(
                'Package Color',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const Text(
              'Quantity',
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              _currentSliderValue.toInt().toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            inactiveTrackColor: Color(0XFF8D8E98),
            activeTrackColor: Colors.white,
            thumbColor: Color(0XFFEB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            overlayColor: Color(0X29EB1555),
          ),
          child: Slider(
            value: _currentSliderValue.toDouble(),
            min: 0.0,
            max: 100.0,
            onChanged: (double newValue) {
              setState(() {
                _currentSliderValue = newValue.round();
              });
            },
          ),
        )
      ],
    );
  }


  Widget buildPayment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [
          Icon(Icons.payment, color: Colors.blue, size: 30,),
          SizedBox(
            width: 10,
          ),
          DropdownButton<String>(
            value: _payment,
            elevation: 16,
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.blue, fontSize: 15),
            underline: Container(
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _payment = newValue!;
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

  Widget buildAddButton(){
    return Container(
      decoration: BoxDecoration(color: Color(0xFFEB1555), borderRadius: BorderRadius.circular(30)),
      height: 50,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0XFFEB1555)),
              onPressed: () {
                final groceryItem = GroceryItem(
                  id: widget.originalItem?.id ?? const Uuid().v1(),
                  name: _nameController.text,
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSliderValue,
                  payment: _payment,
                  date: DateTime(
                    _dueDate.year,
                    _dueDate.month,
                    _dueDate.day,
                    _timeOfDay.hour,
                    _timeOfDay.minute,
                  ),
                );
                if (widget.isUpdating) {
                  widget.onUpdate(groceryItem);
                } else {
                  widget.onCreate(groceryItem);
                }
              },
              child: Text(
                'ADD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


