import "package:api_binding/modelview.dart";
import "package:flutter/material.dart";
//import "apibindingwithmodelclass.dart";
//import "view_employee.dart";
void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return const MaterialApp(
debugShowCheckedModeBanner: false,
//home: ViewEmployee(),
home: ModelEmployee(),
);
}
}
