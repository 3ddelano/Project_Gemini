import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isRegister = false;
  DateTime now = DateTime.now().toUtc();
  DateTime selectedDate = DateTime.now().toUtc();
  late DateTime lastDate = DateTime(now.year + 1, now.month, now.day);
  late String formattedMonth = DateFormat('MMMM dd').format(selectedDate);
  final TextEditingController nameController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: now,
        lastDate: lastDate,
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.red,
                ),
              ),
              child: child!);
        });
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedMonth = DateFormat('MMMM dd, yyyy').format(selectedDate);
      });
    }
  }
  void alwayschange()
  {
    setState(() {
      isRegister = !isRegister;
    });
  }

  void Register()
  {

  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/logo.png',height: 60,
                ),
                SizedBox(width: 10,),
                Text(
                  "Create Your Account",
                  style: TextStyle(
                      fontSize: 34,
                      fontFamily: "Bebas Neue",
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Fill in your details to create a new user account.",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                color: Colors.black
              ),
            ),
            const SizedBox(height: 30), // Add space between elements
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Your Name",
                  style: TextStyle(fontFamily: "Inter"),
                ),
                const SizedBox(height: 10), // Add space between elements
                TextField(

                  controller: nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    hintText: 'Enter your name',
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 20), // Add space between elements
                const Text("Enter Your Birthday (Month,Date)"),
                const SizedBox(height: 10), // Add space between elements
                TextField(
                  onTap: () => _selectDate(context),
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    hintText: formattedMonth,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  alwayschange();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: !isRegister ? const Text(
                  "Register",
                  style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 24,
                      color: Colors.white),
                ): CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}