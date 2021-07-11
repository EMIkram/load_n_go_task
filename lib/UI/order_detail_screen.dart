import 'package:flutter/material.dart';
import 'package:load_n_go_task/modals/orders_modal.dart';
import 'package:load_n_go_task/widgets/my_label.dart';

class OrderDetailScreen extends StatefulWidget {
  OrderModal modal;
  OrderDetailScreen(this.modal);
  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderModal modal;
  @override
  void initState() {
    setState(() {
      modal = widget.modal;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Description"),
      ),
      body: modal==null?Container(child: Center(child: Text("something went wrong!"),),):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyLabel(label:modal.orderNumber),
            SizedBox(height: 15,),
            Text("Order Details:",style: TextStyle(color: Colors.blue, fontSize: 16),),
            // SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Merchant Name"),
                Text(modal.merchantName),
              ],
            ),
            // SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(modal.orderDescription),
                Text(modal.weightOfOrder+"(${modal.quantity})"),
              ],
            ),
            SizedBox(height: 10,),
            Text("Pick Up Details:",style: TextStyle(color: Colors.blue, fontSize: 16),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address"),
                Text(modal.pickupAddressLine1),
              ],
            ),
            // SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Postal Code"),
                Text(modal.pickupPostalCode),
              ],
            ),
            Text(modal.pickupDateDDMMYYY,style: TextStyle(fontSize: 12),),
            SizedBox(height: 10,),
            Text("Delivery Details:",style: TextStyle(color: Colors.blue, fontSize: 16),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address"),
                Text(modal.deliveryAddressLine1),
              ],
            ),
            // SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Postal Code"),
                Text(modal.deliveryPostalCode),
              ],
            ),
            Text(modal.deliveryDateDDMMYYYY,style: TextStyle(fontSize: 12),),
            SizedBox(height: 10,),
            Text("Customer Details:",style: TextStyle(color: Colors.blue, fontSize: 16),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("First Name"),
                Text(modal.customerFirstName),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Last Name"),
                Text(modal.customerLastName),
              ],
            ),
            // SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email"),
                Text(modal.customerEmail,style: TextStyle(decoration: TextDecoration.underline),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Phone"),
                Text(modal.customerPhoneNumber,style: TextStyle(decoration: TextDecoration.underline),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Approval Status"),
                MyLabel(label: modal.approvalStatus??"N/A",textColor: Colors.white,backGroundColor: modal.approvalStatus=="Yes"?Colors.green:Colors.red[400],)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
