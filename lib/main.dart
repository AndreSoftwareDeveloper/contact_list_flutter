import 'package:flutter/material.dart';

import 'Contact.dart';
import 'package:todo_list/MySearchDelegate.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return Scaffold(
              appBar: AppBar(
                  title: const Text("Contacts"),
                  centerTitle: true,
                  leading: const Icon(Icons.menu),
                  actions: [
                    IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: MySearchDelegate(),
                          );
                        },
                      icon: const Icon(Icons.search),
                    ),
                  ]
              ),

              body: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.lightBlue,
                        ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(contacts[index].name + " "
                              + contacts[index].surname),

                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Are you sure you want"
                                      " to delete the contact?"),
                                  content: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: () {
                                          setState(() {
                                            contacts.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.cancel_outlined),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.delete_forever),
                          ),

                          IconButton(
                              onPressed: () {
                                showContactDetails(context, index, contacts);
                              },
                              icon: Icon(Icons.info_outline)
                          )
                        ],
                      )
                    );
                  }
              ),

              floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Add contact"),
                              content: Column(
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'first name', // Placeholder text
                                    ),
                                  ),

                                  TextField(
                                    controller: surnameController,
                                    decoration: InputDecoration(
                                      hintText: 'last name', // Placeholder text
                                    ),
                                  ),

                                  TextField(
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      hintText: 'phone number', // Placeholder text
                                    ),
                                  ),

                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          Contact contact = new Contact(
                                              nameController.text,
                                              surnameController.text,
                                              phoneController.text
                                          );

                                          contacts.add(contact);
                                        });

                                        nameController.clear();
                                        surnameController.clear();
                                        phoneController.clear();

                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Add")
                                  )
                                ],
                              ),
                            )
                        );
                      },
                      child: Text("+", style: TextStyle(fontSize: 36),),
                    ),
          );
        }
    );
  }
}

void showContactDetails(BuildContext context, int index, List contacts) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: Row(
        children: [
          Row(
            children: [
              Text(
                "\nFirst name:\t${contacts[index].name}"
                    "\n\nSecond name:\t${contacts[index].surname}"
                    "\n\nPhone number:\t${contacts[index].phoneNumber}",
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
