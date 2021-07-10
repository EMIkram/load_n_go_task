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
      body: modal==null?Container(child: Center(child: Text("something went wrong!"),),):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyLabel(label:modal.orderNumber),
            SizedBox(height: 15,),
            Text("Order Details:",style: TextStyle(color: Colors.blue, fontSize: 16),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Merchant Name"),
                Text(modal.merchantName),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(modal.orderDescription),
                Text(modal.weightOfOrder+"(${modal.quantity})"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
