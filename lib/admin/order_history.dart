import 'package:flutter/material.dart';
import 'package:insuline_admin/res/extension/general_extension.dart';
import 'package:timeline_tile/timeline_tile.dart';


class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  bool _isDetailsVisible = false; // State variable to track visibility
  bool _showOrderDetails = false; // State to toggle between list and details
  int? _selectedOrderId; // Keep track of the selected order ID
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Widget _buildOrderList() {
      return Row(
        children: [
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order  History",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  10.heightBox(),
                  // Table Header
                  Row(
                    children: [
                      _buildTableHeader("Product", flex: 3),
                      _buildTableHeader("Strip Size"),
                      _buildTableHeader("Quantity"),
                      _buildTableHeader("Amount"),
                      _buildTableHeader("Payment"),
                      _buildTableHeader("Status"),
                      _buildTableHeader("Ordered Date"),
                      _buildTableHeader("Expected Delivery Date"),
                    ],
                  ),
                  const Divider(),
                  // Table Rows
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOrderId =
                                    index; // Set the selected order ID
                                _showOrderDetails =
                                    true; // Switch to details view
                              });
                            },
                            child: _buildOrderCard());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: _showOrderDetails ? _buildOrderDetails() : _buildOrderList(),
    );
  }

  Widget _buildOrderDetails() {
    return Row(
      children: [
        // Main Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _showOrderDetails = false;
                            });
                          },
                          icon: Icon(Icons.arrow_back_ios_new_sharp)),
                      Text(
                        "Order 1",
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  10.heightBox(),
                  // Table Header
                  Row(
                    children: [
                      _buildTableHeader("Product", flex: 3),
                      _buildTableHeader("Strip Size"),
                      _buildTableHeader("Quantity"),
                      _buildTableHeader("Amount"),
                      _buildTableHeader("Status"),
                      _buildTableHeader("Ordered Date"),
                      _buildTableHeader("Expected Delivery Date"),
                    ],
                  ),
                  const Divider(),
                  // Table Rows
                  _buildOrderCard(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipment Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),

                          Card(
                            color: Colors.white,
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: "Shipment number\n",
                                              style: TextStyle(
                                                  fontSize: 10, color: Colors.grey),
                                              children: [
                                            TextSpan(
                                                text: "EVMDJFJUU",
                                                style:
                                                    TextStyle(color: Colors.black))
                                          ])),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.15,),
                                      Image.asset(
                                        "assets/Group 265.png",
                                        height: 60,
                                      )
                                    ],
                                  )
                              , SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              
                              Row(
                                children: [
              
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.15,
                                    child: ListTile(
                                      leading: Image.asset("assets/location.png", height: 30,),
                                      title: Text("2972 Westheimer ", style: TextStyle(color: Colors.black, fontSize: 13),),
                                      subtitle: Text("Rd. Santa Ana, Illinois 85486 ", style: TextStyle(color: Colors.grey, fontSize: 10),),
                                    ),
                                  ),
                                        SizedBox(
                                    width: MediaQuery.of(context).size.width*0.15,
                                    child: ListTile(
                                      leading: Image.asset("assets/Group 268.png", height: 30,),
                                      title: Text("2972 Westheimer ", style: TextStyle(color: Colors.black, fontSize: 13),),
                                      subtitle: Text("Rd. Santa Ana, Illinois 85486 ", style: TextStyle(color: Colors.grey, fontSize: 10),),
                                    ),
                                  )
                                ],
                              )
              
                               
                               
                                ],
                              ),
                            ),
                          )
                        ],
                      )
           ,      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Status",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
SizedBox(
  height: MediaQuery.of(context).size.height * 0.3,
  width: MediaQuery.of(context).size.width * 0.4,
  child: Card(
    color: Colors.white,
    elevation: 2,
    child: ListView(
      shrinkWrap: true,
      children: [
        TimelineTile(
          isFirst: true,
          alignment: TimelineAlign.start,
          indicatorStyle: IndicatorStyle(
            color: Colors.green,
            padding: EdgeInsets.all(6),
            drawGap: true, // Creates a gap to make lines smaller
      //      size: 16, // Adjust the size of the indicator
          ),
          beforeLineStyle: LineStyle(
            color: Colors.green,
            thickness: 3,
         //   dashArray: [3, 2], // Optional: Dashed line for a shorter appearance
          ),
          endChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0), // Reduce padding for smaller line height
            child: ListTile(
              title: Text(
                'Ordered',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: Text(
                'on Wed, 13 Mar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.start,
          indicatorStyle: IndicatorStyle(
            color: Colors.green,
            padding: EdgeInsets.all(6),
            drawGap: true,
       //     size: 16,
          ),
          beforeLineStyle: LineStyle(
            color: Colors.green,
            thickness: 3,
       //     dashArray: [3, 2],
          ),
          endChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              title: Text(
                'Packed',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: Text(
                'on Wed, 13 Mar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.start,
          indicatorStyle: IndicatorStyle(
            color: Colors.green,
            padding: EdgeInsets.all(6),
            drawGap: true,
      //      size: 16,
          ),
          beforeLineStyle: LineStyle(
            color: Colors.green,
            thickness: 3,
          //  dashArray: [3, 2],
          ),
          endChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              title: Text(
                'Shipped',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: Text(
                'on Wed, 13 Mar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        TimelineTile(
          isLast: true,
          alignment: TimelineAlign.start,
          indicatorStyle: IndicatorStyle(
            color: Colors.grey,
            padding: EdgeInsets.all(6),
            drawGap: true,
         //   size: 16,
          ),
          beforeLineStyle: LineStyle(
            color: Colors.green,
            thickness: 3,
         //   dashArray: [3, 2],
          ),
          endChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              title: Text(
                'Delivered',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: Text(
                'Expected by today',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
)

                        
                      
                        ],
                      )
                
                
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
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
                    title: Text(
                      "Product Name",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "One Hyde Park, Knightsbridge",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ),
                _buildTableCell("12"),
                _buildTableCell("1"),
                _buildTableCell("\$120"),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 80, // Explicit width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Center(
                        child: Text(
                          "Shipped",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
                _buildTableCell("22/09/2023"),
                _buildTableCell("22/09/2023"),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hide Enquiry Details",
                  style: TextStyle(color: Colors.green),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isDetailsVisible =
                          !_isDetailsVisible; // Toggle visibility
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
            if (_isDetailsVisible) // Show details if visible
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "John Doe | john.doe@gmail.com | +44 112 456 7890 | E17 JH",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Text(
                    "3 Newbridge Court, Chino Hills, CA 91709, United States",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
