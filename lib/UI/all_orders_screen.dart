import 'package:flutter/material.dart';
import 'package:load_n_go_task/Utils/utilities.dart';
import 'package:load_n_go_task/modals/dummyData.dart';
import 'package:load_n_go_task/modals/orders_modal.dart';
import 'package:load_n_go_task/widgets/my_label.dart';
import 'order_detail_screen.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({Key key}) : super(key: key);

  @override
  _AllOrdersScreenState createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  List<OrderModal> modalList ;
  @override
  void initState() {
    setState(() {
      modalList=DummyData.ordersList.map((orderjson) => OrderModal.fromJson(orderjson)).toList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Orders"),
      ),
      body: modalList==null?Container(child: Center(child: Text("No Data"),),):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: modalList.map((modal) => listItem(modal)).toList(),
        ),
      ),
    );
  }

  Widget listItem(OrderModal modal){
    return GestureDetector(
      onTap: (){Utils.push(context, OrderDetailScreen(modal));},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          MyLabel(label: modal.orderNumber),
          ListTile(
            dense: true,
            title: Text(modal.merchantName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(modal.orderDescription),
                    Text(modal.weightOfOrder),
                  ],
                ),

              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

}
