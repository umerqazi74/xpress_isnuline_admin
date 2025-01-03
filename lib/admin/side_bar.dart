import 'package:flutter/material.dart';
import 'package:insuline_admin/admin/clinic.dart';
import 'package:insuline_admin/admin/inventories.dart';
import 'package:insuline_admin/admin/order_history.dart';
import 'package:insuline_admin/res/color/app_colors.dart';


class SideBarWithBody extends StatefulWidget {
  const SideBarWithBody({super.key});

  @override
  _SideBarWithBodyState createState() => _SideBarWithBodyState();
}

class _SideBarWithBodyState extends State<SideBarWithBody> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    OrderHistoryScreen(), // Replace with your actual class
   Inventoriescreen(),
   ClinicScreen(),
   Container()
 //   Center(child: Text("Help Screen", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // App bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.06, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "LOGO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff0080A4),
                      child: Center(
                        child: Text(
                          "JD",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      "   JHON DOE",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                      size: 35,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Sidebar
                Container(
                  width: w * 0.2,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildListTile(0, "Recent Orders", Icons.more_time_rounded),
                      _buildListTile(1, "Inventory", Icons.inventory),
                      _buildListTile(2, "Clinics", Icons.local_hospital),
                      _buildListTile(3, "Log out", Icons.logout),
                    ],
                  ),
                ),

                // Main body content
                Expanded(
                  child: _screens[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(int index, String title, IconData icon) {
    return ListTile(
      tileColor: _selectedIndex == index ? AppColors.greenColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: Icon(
        icon,
        color: _selectedIndex == index ? Colors.white : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: _selectedIndex == index ? Colors.white : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
