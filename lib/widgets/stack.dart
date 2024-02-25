import 'package:flutter/material.dart';
import 'dart:math';
import 'package:scavenger_hunt/dummydata/listofdummytask.dart';
import 'package:scavenger_hunt/widgets/imageinput.dart';
import 'package:scavenger_hunt/widgets/taskwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StackClass extends StatefulWidget {
  const StackClass({super.key});
  @override
  State<StackClass> createState() {
    return _StackClass();
  }
}

class _StackClass extends State<StackClass> {
  //Random function to generate the random indices once;
  List<int> getRandomIndices(int length) {
    List<int> indices = List<int>.generate(
        length, (index) => index); // Generate indices from 0 to length - 1
    List<int> randomIndices = [];

    Random random = Random();
    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(indices
          .length); // Generate a random index within the remaining indices
      randomIndices
          .add(indices[randomIndex]); // Add the random index to the result list
      indices.removeAt(
          randomIndex); // Remove the chosen index from the list to prevent repetition
    }
    return randomIndices;
  }

  int index = 0;
  @override
  void initState() {
    index = getRandomIndices(scavengerHuntTasks.length).last;
    super.initState();
  }

  Future<void> addDataToFirestore(String text) async {
    // Get a reference to the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Add a new document with a generated ID to the 'messages' collection
      await firestore.collection('messages').add({
        'text': text,
        'timestamp': Timestamp.now(),
      });

      print('Data added to Firestore successfully.');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }

  TextEditingController ctr = new TextEditingController();
  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imagepath = "";
    Widget task = TaskWidget(index: index);
    Widget content = Container(
      height: 400,
      width: 400,
      child: Card(
        elevation: 20,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Color.fromARGB(98, 152, 140, 103),
        child: Center(
          child: Column(
            children: [
              task,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    ElevatedButton(
                      onPressed: () async {
                        // TO navigate to the image input screen
                        var result =
                            await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const ImageInput();
                          },
                        ));
                        imagepath = result;
                      },
                      child: const Text("Upload Image"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index =
                              getRandomIndices(scavengerHuntTasks.length).last;
                          task = TaskWidget(index: index);
                        });
                        addDataToFirestore(imagepath);
                      },
                      child: const Text("Submit Image"),
                    )
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: TextField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 137, 2, 255)),
                          controller: ctr,
                          clipBehavior: Clip.hardEdge,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            label: Text("Enter Text"),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index = getRandomIndices(scavengerHuntTasks.length)
                                .last;
                            task = TaskWidget(index: index);
                          });
                          addDataToFirestore(ctr.text);
                        },
                        child: const Text("Submit Text"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Center(child: content)
      ],
    );
  }
}
