import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'apibindingwithmodelclass.dart';

class ModelEmployee extends StatefulWidget {
  const ModelEmployee({super.key});
  @override
  State<ModelEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ModelEmployee> {
  List<Data> empData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: empData.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(empData[index].empName!),
                const SizedBox(width: 20),
                Text("${empData[index].empSal}"),
              
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: getEmployeeData,
        child: const Icon(Icons.add),
      ),
    );
  }

  void getEmployeeData() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    http.Response response = await http.get(url);
    log(response.body);
    var responseData = json.decode(response.body);
    EmployeeModel empModel = EmployeeModel(responseData);
    setState(() {
      empData = empModel.data!;
    });
  }
}
