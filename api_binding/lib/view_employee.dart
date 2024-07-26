import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({super.key});
  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  // List<dynamic> empData = [];
  Map<String, dynamic> empData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          //itemCount: empData.length,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  Text(empData[index]['employee_name']),
                  Text(empData['employee_name']),
                  const SizedBox(width: 30),
                  //Text("${empData[index]['employee_salary']}"),
                  Text("${empData['employee_salary']}"),
                  const SizedBox(width: 30),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: getEmployeeData,
        child: const Icon(Icons.accessibility_sharp),
      ),
    );
  }

  void getEmployeeData() async {
    // Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employee/1");
    http.Response response = await http.get(url);
    log(response.body);
    var responseData = json.decode(response.body);
    setState(() {
      empData = responseData['data'];
    });
  }
}
