import 'package:flutter/material.dart';
import 'package:test_drive/screens/budget.dart';
import 'package:test_drive/screens/investments.dart';
import 'package:test_drive/screens/records.dart';
import 'package:test_drive/screens/settings.dart';
//import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.green,
        //add the buttons
         actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            padding:const EdgeInsets.only(top:20.0),
            
            onPressed: () {
              // Add your settings button logic here
            
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            padding: const EdgeInsets.only(top: 20.0),
            onPressed: () {
              // Add your search button logic here

            },
          ),
          //Add a widget to display List of accounts

         ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'My Wallet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              //You can add an icon for each widget here
              title: const Text('Home'),
              onTap: () {
                // Navigate to Home page
                
                //Navigator.pop(context); 
                // Close the drawer
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: const Text('Investments'),
              onTap: () {
                // Navigate to Investments page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyInvestments()),
                  ); // Close the drawer
                  //Navigator.pop(context);
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: const Text('Budget'),
              onTap: () {
                // Navigate to Budget page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyBudget()),
                ); // Close the drawer
                //Navigator.pop(context);
                // Add your navigation logic here

              },
            ),
            ListTile(
              title: const Text('Records'),
              onTap: () {
                // Navigate to Records page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyRecords()),); 
                  // Close the drawer
                  //Navigator.pop(context);
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MySettings()),
                  ); 
                  Navigator.pop(context);
                  // Close the drawer
                // Add your navigation logic here
              },
            ),
          ],
        ),
      ),
      // ignore: sort_child_properties_last
      body:const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
       children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed:() {
                    
                  },
                  child: Text('List Of Accounts'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Button 2 action

                  },
                  child: Text('Add Account'),
                ),
              ],
            ),
        ],
      )

    );

  }

  void onPressed() {
                  // Button 1 action
                }
}
