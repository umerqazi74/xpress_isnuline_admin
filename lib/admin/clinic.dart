import 'package:flutter/material.dart';
import 'package:insuline_admin/res/color/app_colors.dart';
import 'package:insuline_admin/res/extension/general_extension.dart';


class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  bool _isDetailsVisible = false; // State variable to track visibility
  bool isAddInventory = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              // Main Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Clinic",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isAddInventory =
                                    true; // Show the inventory container
                              });
                            },
                            child: Container(
                              height: 40,
                              width: w * 0.12,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.greenColor),
                              child: const Center(
                                  child: Text(
                                "Add new Clinic ",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                      10.heightBox(),
                      // Table Header
                      Row(
                        children: [
                          _buildTableHeader("Test Name", flex: 3),
                          _buildTableHeader("Name"),
                          _buildTableHeader("Time Slot"),
                          _buildTableHeader("Date"),
                          _buildTableHeader("Payment Status"),
                          _buildTableHeader("Message"),
                        ],
                      ),
                      const Divider(),
                      // Table Rows
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return _buildOrderCard();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Add Inventory Container Overlay
          if (isAddInventory)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isAddInventory = false; // Hide the inventory container
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5), // Background overlay
                  child: Center(
                    child: Container(
                      height: h * 0.9,
                      width: w * 0.55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.02,
                          vertical: h * 0.05,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Add Clinic",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Product Name Field
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Clinic Name"),
                                        const SizedBox(height: 8),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "Clinic Name",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width: w *
                                          0.02), // Add spacing between fields
                                  // Product Tag Field
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Medical Services"),
                                        const SizedBox(height: 8),
                                      Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                      child: Center(
                                          child: Text(
                                        "12 X",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    10.widthBox(),
                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                      child: Center(
                                          child: Text(
                                        "12 X",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    10.widthBox(),
                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                      child: Center(
                                          child: Text(
                                        "12 X",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                             
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              10.heightBox(),
                              Text(
                                "About Clinic",
                                style: TextStyle(),
                              ),
                              TextFormField(
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintText: "Write about the medicine",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              10.heightBox(),
                               Text(
                                "Address",
                                style: TextStyle(),
                              ),

                              TextFormField(
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintText: "Address",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              10.heightBox(),
                                Text(
                                "Opening Time",
                                style: TextStyle(),
                              ),
                              
                         TextFormField(
            decoration: InputDecoration(
              hintText: "12",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: "AM", // Default value
                  icon: const Icon(Icons.arrow_drop_down),
                  items: <String>["AM", "PM"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle the dropdown selection
                  },
                )))),
                         
                         
                              10.heightBox(),
                            
                            
                                  Text(
                                "Closing Time",
                                style: TextStyle(),
                              ),
                              
                         TextFormField(
            decoration: InputDecoration(
              hintText: "12",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: "AM", // Default value
                  icon: const Icon(Icons.arrow_drop_down),
                  items: <String>["AM", "PM"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle the dropdown selection
                  },
                )))),
                         
                              10.heightBox(),
                                  Text(
                                "Website Link",
                                style: TextStyle(),
                              ),

                              TextFormField(
                              
                                decoration: InputDecoration(
                                  hintText: "INR 20",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              20. heightBox(),
                           Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    InkWell(
      onTap: () {
        setState(() {
          isAddInventory = false;
        });
      },
      child: Container(
        height: 40,
        width: w * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: const Center(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    InkWell(
      onTap: () {
        // Add SKU action
      },
      child: Container(
        height: 40,
        width: w * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.greenColor,
        ),
        child: const Center(
          child: Text(
            "Add Clicnic",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  ],
)

                           
                           
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(String title, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHighlighted = false}) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          text,
          style: TextStyle(
            color: isHighlighted ? Colors.green : Colors.black,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard() {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ListTile(
                    leading: Image.asset("assets/Image.png", height: 30),
                    title: const Text(
                      "Test 1",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Clinic",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ),
                _buildTableCell("Rajdeep"),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 80, // Explicit width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: const Center(
                        child: Text(
                          "11:00-12:00 AM",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
                _buildTableCell("12/11/2024"),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 80, // Explicit width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.greenColor,
                      ),
                      child: const Center(
                        child: Text(
                          "COD",
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      ),
                    ),
                  ),
                ),
                _buildTableCell("Lorem Ipsum"),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            Row(
              children: [
                const Text(
                  "Hide Enquiry Details",
                  style: TextStyle(color: Colors.green),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isDetailsVisible = !_isDetailsVisible;
                    });
                  },
                  icon: Icon(
                    _isDetailsVisible
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            if (_isDetailsVisible)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "John Doe | john.doe@gmail.com | +44 112 456 7890 | E17 JH",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "3 Newbridge Court, Chino Hills, CA 91709, United States",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffDC2040),
                            ),
                            child: const Center(
                                child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                          20.widthBox(),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greenColor,
                            ),
                            child: const Center(
                                child: Text(
                              "Accept",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
