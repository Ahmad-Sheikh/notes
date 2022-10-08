import 'package:flutter/material.dart';
import 'auth.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? selectedValue;
  var createformKey = GlobalKey<FormState>();
  TextEditingController nameControllers = TextEditingController();
  TextEditingController emailControllers = TextEditingController();
  TextEditingController numberControllers = TextEditingController();
  TextEditingController cityControllers = TextEditingController();
  TextEditingController passwordControllers = TextEditingController();
  TextEditingController confirmpasswordControllers = TextEditingController();

  bool isVisibles = false;
  bool isVisibless = false;

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Id8.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      'Create Your Account',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffEF873D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Form(
                      key: createformKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameControllers,
                            validator: (val) {
                              if (val == null ||
                                  val.isEmpty ||
                                  val.length <= 5) {
                                return "required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              labelText: "Full Name*",
                              hintText: "Full Name",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.account_circle_outlined,
                                color: Color(0xffEF873D),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color(0xffEF873D),
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailControllers,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              labelText: "E-mail*",
                              hintText: "example@gmail.com",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.email_rounded,
                                color: Color(0xffEF873D),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color(0xffEF873D),
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: numberControllers,
                            validator: (val) {
                              if (val == null ||
                                  val.isEmpty ||
                                  val.length < 6) {
                                return "required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              labelText: "Mobile Number*",
                              hintText: "030XXXXXXXX",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Color(0xffEF873D),
                              ),
                              // focusColor: Colors.orange,
                              // iconColor: Colors.orange,
                              // prefixIconColor: Colors.orange,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color(0xffEF873D),
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Test
                          // DropdownButtonFormField2(
                          //   decoration: InputDecoration(
                          //     //Add isDense true and zero Padding.
                          //     fillColor: Colors.black12,
                          //     labelStyle: const TextStyle(
                          //       color: Colors.grey,
                          //     ),
                          //     //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          //     isDense: true,
                          //     contentPadding: EdgeInsets.zero,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(20),
                          //       borderSide: const BorderSide(
                          //         color: Colors.black,
                          //         width: 1,
                          //       ),
                          //     ),
                          //     //Add more decoration as you want here
                          //     //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                          //   ),
                          //   isExpanded: true,
                          //   hint: const Text(
                          //     'Select Your City',
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.grey,
                          //     ),
                          //   ),
                          //   icon: const Icon(
                          //     Icons.arrow_drop_down,
                          //     color: Colors.black,
                          //   ),
                          //   iconSize: 30,
                          //   buttonHeight: 60,
                          //   buttonPadding:
                          //       const EdgeInsets.only(left: 20, right: 10),
                          //   dropdownDecoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //   items: genderItems
                          //       .map((item) => DropdownMenuItem<String>(
                          //             value: item,
                          //             child: Text(
                          //               item,
                          //               style: const TextStyle(
                          //                 fontSize: 14,
                          //               ),
                          //             ),
                          //           ))
                          //       .toList(),
                          //   validator: (value) {
                          //     if (value == null) {
                          //       return 'Please select city.';
                          //     }
                          //     return null;
                          //   },
                          //   onChanged: (value) {
                          //     //Do something when changing the item if you want.
                          //   },
                          //   onSaved: (value) {},
                          // ),
                          //test
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordControllers,
                            validator: (val) {
                              if (val == null ||
                                  val.isEmpty ||
                                  val.length < 6) {
                                return "required";
                              }
                              return null;
                            },
                            obscureText: !isVisibles,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              labelText: "Password*",
                              hintText: "Password",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_rounded,
                                color: Color(0xffEF873D),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibles = !isVisibles;
                                  });
                                },
                                splashRadius: 24,
                                icon: isVisibles
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color(0xffEF873D),
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val == null ||
                                  val.isEmpty ||
                                  val.length < 6) {
                                return "required";
                              }
                              return null;
                            },
                            controller: confirmpasswordControllers,
                            obscureText: !isVisibless,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              labelText: "Confirm Password*",
                              hintText: "Confirm Password",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_rounded,
                                color: Color(0xffEF873D),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibless = !isVisibless;
                                  });
                                },
                                splashRadius: 24,
                                icon: isVisibless
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color(0xffEF873D),
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (createformKey.currentState!.validate()) {
                                    FirebaseControllers.signup(
                                        emailControllers.text.toString(),
                                        passwordControllers.text.toString(),
                                        context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffEF873D),
                                  minimumSize: const Size(double.infinity, 55),
                                ),
                                child: const Text('SignUp'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
