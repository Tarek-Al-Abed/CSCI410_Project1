import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String callType = 'Local';
  bool hasOffer = false;
  int callDuration = 0;
  double totalCost = 0.0;

  void calculateCost() {
    double rate = callType == 'Local' ? 0.5 : 1.5;
    double cost = rate * callDuration;
    if (hasOffer) cost *= 0.9; // Apply 10% discount if checked
    setState(() {
      totalCost = cost;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Cost Duration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              // Call Type Selection
            Row(
              children: [
                Radio(
                  value: 'Local',
                  groupValue: callType,
                  onChanged: (value) => setState(() => callType = value!),
                ),
                
                Text('Local'),
                Radio(
                  value: 'Global',
                  groupValue: callType,
                  onChanged: (value) => setState(() => callType = value!),
                ),
                Text('Global'),
              ],
            ),
            SizedBox(height: 10), 
             // Call Duration Input
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Call Duration (minutes)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) =>
                  setState(() => callDuration = int.tryParse(value) ?? 0),
            ),
            SizedBox(height: 10),
             // Discount Checkbox
            Row(
              children: [
                Checkbox(
                  value: hasOffer,
                  onChanged: (value) => setState(() => hasOffer = value!),
                ),
                Text('10% Discount Offer'),
              ],
            ),
            SizedBox(height: 10),
             // Calculate Button
            Center(
              child: ElevatedButton(
                onPressed: calculateCost,
                child: Text('Calculate'),
              ),
            ),
            SizedBox(height: 20),
            // Display Total Cost
            Text(
              'Total Cost: \$${totalCost.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
