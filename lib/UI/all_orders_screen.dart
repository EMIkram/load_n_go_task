import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load_n_go_task/Utils/utilities.dart';
import 'package:load_n_go_task/modals/dummyData.dart';
import 'package:load_n_go_task/modals/orders_modal.dart';
import 'package:load_n_go_task/widgets/my_button.dart';
import 'package:load_n_go_task/widgets/my_label.dart';
import 'package:load_n_go_task/widgets/my_text_field.dart';
import 'order_detail_screen.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({Key key}) : super(key: key);

  @override
  _AllOrdersScreenState createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  List<OrderModal> modalList =[];
  List<OrderModal> duplicateModalList=[];
  List<OrderModal> searchBackUp=[];
  List<String> sortLabels = ['PickUp Area Code','Delivery Area Code','Pickup Date','Delivery Date','Merchant Name'];
  List<String> pickUpAreaCodesList=[] ;
  List<String> deliveryAreaCodesList=[] ;
  List<String> pickUpDatesList=[] ;
  List<String> deliveryDatesList=[] ;
  List<String> merchantNamesList =[];
  String pickupAreaCodeSelectedValue='Un Selected';
  String deliveryAreaCodeSelectedValue='Un Selected';
  String merchantNameSelectedValue='Un Selected';
  String pickupDateSelectedValue='Un Selected';
  String deliveryDateSelectedValue='Un Selected';
  bool appBarBottomVisible=false;
  TextEditingController _serachController = TextEditingController();
  @override
  void initState() {
   loadModal();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
       modalList.any((element) => element.selected)?
       Row(
         children: [
           IconButton(
             icon: Icon(Icons.delete,color: Colors.red,),
             onPressed: deleteOrders,
           ),
           Tooltip(message: "Mark as Approved",
           child: IconButton(
             icon: Icon(Icons.done,color: Colors.white,),
             onPressed:markApproved ,
           ),
           )
         ],
       )
       :Row(
           children: [
             Container(
               width: 100,
               child:
               Tooltip(
                 message: "Sort Orders",
                 child: DropdownButtonHideUnderline(
                   child: DropdownButton<String>(
                     isExpanded: true,
                     icon: const Icon(Icons.sort,color: Colors.white,),
                     iconSize: 24,
                     // underline: Container(),
                     onChanged: sortOrders,
                     items: sortLabels
                         .map<DropdownMenuItem<String>>((String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(value),
                       );
                     }).toList(),
                   ),
                 ),
               ),
             ),
             Tooltip(
               message: "Search",
               child: IconButton(
                 icon: Icon(Icons.search,color: Colors.white,),
                 onPressed: (){
                   if(!appBarBottomVisible)
                     {
                       searchBackUp = modalList;
                       setState(() {
                         appBarBottomVisible=!appBarBottomVisible;
                       });
                     }
                   else
                     {
                       setState(() {
                         modalList= searchBackUp;
                         appBarBottomVisible=!appBarBottomVisible;
                       });
                     }
                 },
               ),
             ),
             Tooltip(
               message: "Filter",
               child: IconButton(
                 icon: Icon(Icons.filter_alt_outlined),
                 onPressed: filterBottomSheet,
               ),
             ),
           ],
         ),

          SizedBox(width: 10,),
          // IconButton(icon: Icon(Icons.sort),),

        ],
              bottom:PreferredSize(
                child: Container(
                  height:appBarBottomVisible?70.0:0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        TextField(
                          focusNode: FocusNode(),
                          style: TextStyle(
                            color: Colors.white
                          ),
                          // hintText: "Type Order number,Merchant name or Pick/Delivery Date",
                          decoration: InputDecoration(
                            hintText: "Type Order number,Merchant name or Pick/Delivery Date",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                            )
                          ),
                        onChanged:searchOrders,
                        controller: _serachController,
                        ),
                      ],
                    ),
                  ),
                ),
                  preferredSize: Size.fromHeight(appBarBottomVisible?70.0:0.0),
        ),
        title: Text("All Orders"),
      ),
      body: modalList.isEmpty?Container(child: Center(child: Text("No Data"),),):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: WillPopScope(
          onWillPop: (){
           setState(() {
             modalList.forEach((element) {
               element.selected=false;
             });
           });
            return;
          },
          child: ListView(
            children: modalList.map((modal) => listItem(modal)).toList(),
          ),
        ),
      ),
    );
  }

  Widget listItem(OrderModal modal){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: ListTile(
            selected: modal.selected,
            selectedTileColor: Colors.blueGrey[600],
            onLongPress: (){
              setState(() {
                modal.selected=true;
              });
            },
            onTap: (){
              if(modalList.any((element) => element.selected==true))
                {
                  setState(() {
                    modal.selected=!modal.selected;
                  });
                }
              else
                {
                  Utils.push(context, OrderDetailScreen(modal));
                }
            },
            dense: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyLabel(label: modal.orderNumber),
                SizedBox(height: 10,),
                Text(modal.merchantName),
              ],
            ),
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
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PickUp Postal Code"),
                    Text(modal.pickupPostalCode),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Postal Code"),
                    Text(modal.deliveryPostalCode),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pick up Date"),
                    Text(modal.pickupDateDDMMYYY),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Date"),
                    Text(modal.deliveryDateDDMMYYYY),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Approval Status"),
                    MyLabel(label: modal.approvalStatus??"N/A",textColor: Colors.white,backGroundColor: modal.approvalStatus=="Yes"?Colors.green:Colors.red[400],)
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        // Divider(),
      ],
    );
  }


  sortOrders(String value){
    switch (value) {
      case 'Delivery Area Code':
        {
         setState(() {
           modalList.sort((a, b) {
             return a.deliveryPostalCode.substring(0,2).compareTo(b.deliveryPostalCode.substring(0,2));
           });
         });
        }
        break;
      case 'PickUp Area Code':
        {
          setState(() {
            modalList.sort((a, b) {
              return a.pickupPostalCode.substring(0,2).compareTo(b.pickupPostalCode.substring(0,2));
            });
          });
        }
        break;
      case 'Pickup Date':
        {
          setState(() {
            modalList.sort((a, b) {
              var first = DateTime(int.parse(a.pickupDateDDMMYYY.split("/")[2]),int.parse(a.pickupDateDDMMYYY.split("/")[1]),int.parse(a.pickupDateDDMMYYY.split("/")[0]));
              var second = DateTime(int.parse(b.pickupDateDDMMYYY.split("/")[2]),int.parse(b.pickupDateDDMMYYY.split("/")[1]),int.parse(b.pickupDateDDMMYYY.split("/")[0]));
              return first.compareTo(second);
            });
          });
        }
        break;
      case 'Delivery Date':
        {
          setState(() {
            modalList.sort((a, b) {
              var first = DateTime(int.parse(a.deliveryDateDDMMYYYY.split("/")[2]),int.parse(a.deliveryDateDDMMYYYY.split("/")[1]),int.parse(a.deliveryDateDDMMYYYY.split("/")[0]));
              var second = DateTime(int.parse(b.deliveryDateDDMMYYYY.split("/")[2]),int.parse(b.deliveryDateDDMMYYYY.split("/")[1]),int.parse(b.deliveryDateDDMMYYYY.split("/")[0]));
              return first.compareTo(second);
            });
          });
        }
        break;
      case 'Merchant Name':
        {
          setState(() {
            modalList.sort((a, b) {
              return a.merchantName.compareTo(b.merchantName);
            });
          });
        }
        break;
      default:
       {}
    }
  }
  filterBottomSheet(){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState ) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pick Up Area Code"),
                            DropdownButton<String>(
                              // isExpanded: true,
                              value: pickupAreaCodeSelectedValue,
                              // isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 24,
                              // underline: Container(),
                              onChanged: (newValue){
                                setState(() {
                                  pickupAreaCodeSelectedValue = newValue;
                                });
                              },
                              items: pickUpAreaCodesList
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Divider(color: Colors.blue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Area Code"),
                            DropdownButton<String>(
                              value: deliveryAreaCodeSelectedValue,
                              // isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 24,
                              // underline: Container(),
                              onChanged: (newValue){
                                setState(() {
                                  deliveryAreaCodeSelectedValue = newValue;
                                });
                              },
                              items: deliveryAreaCodesList
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Divider(color: Colors.blue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pick Up Date"),
                            DropdownButton<String>(
                              value: pickupDateSelectedValue,
                              // isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 24,
                              // underline: Container(),
                              onChanged: (newValue){
                                setState(() {
                                  pickupDateSelectedValue = newValue;
                                });
                                setState(() {

                                });
                              },
                              items: pickUpDatesList
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Divider(color: Colors.blue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Date"),
                            DropdownButton<String>(
                              value: deliveryDateSelectedValue,
                              // isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 24,
                              // underline: Container(),
                              onChanged: (newValue){
                                setState(() {
                                  deliveryDateSelectedValue = newValue;
                                });
                                setState(() {

                                });
                              },
                              items: deliveryDatesList
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Divider(color: Colors.blue,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Merchant name"),
                            DropdownButton<String>(
                              value: merchantNameSelectedValue,
                              // isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 24,
                              // underline: Container(),
                              onChanged: (newValue){
                                setState(() {
                                  merchantNameSelectedValue = newValue;
                                });
                                setState(() {

                                });
                              },
                              items: merchantNamesList
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Divider(color: Colors.blue,),
                        Spacer(),
                        MyFilledButton(txt: "Filter Orders",ontap: filterOrders,)
                      ],
                    ),
                  ),
                );
              });

  });
  }
  filterOrders(){
    setState(() {
      modalList=duplicateModalList;
    });
    if(pickupAreaCodeSelectedValue!="Un Selected")
      {
        setState(() {
          modalList = modalList.where((modal) => modal.pickupPostalCode.substring(0,2)==pickupAreaCodeSelectedValue).toList();
        });
      }
    if(deliveryAreaCodeSelectedValue!="Un Selected")
    {
      setState(() {
        modalList = modalList.where((modal) => modal.deliveryPostalCode.substring(0,2)==deliveryAreaCodeSelectedValue).toList();
      });
    }
    if(pickupDateSelectedValue!="Un Selected")
    {
      setState(() {
        modalList = modalList.where((modal) => modal.pickupDateDDMMYYY==pickupDateSelectedValue).toList();
      });
    }
    if(deliveryDateSelectedValue!="Un Selected")
    {
      setState(() {
        modalList = modalList.where((modal) => modal.deliveryDateDDMMYYYY==deliveryDateSelectedValue).toList();
      });
    }
    if(merchantNameSelectedValue!="Un Selected")
    {
      setState(() {
        modalList = modalList.where((modal) => modal.merchantName==merchantNameSelectedValue).toList();
      });
    }
    Navigator.pop(context);
  }
  searchOrders(String newValue){
    setState(() {
      modalList = searchBackUp.where((modal) => modal.merchantName.toLowerCase().contains(newValue.toLowerCase())||modal.orderNumber.toLowerCase().contains(newValue.toLowerCase())||modal.pickupDateDDMMYYY.toLowerCase().contains(newValue.toLowerCase())||modal.deliveryDateDDMMYYYY.toLowerCase().contains(newValue.toLowerCase())).toList();
    });
  }
  markApproved(){
  setState(() {
    modalList.forEach((element) {
      if(element.selected)
      {
        element.approvalStatus="Yes";
        element.selected=false;
      }
    });
  });
  duplicateModalList = modalList;
  }
  deleteOrders(){
   setState(() {
  modalList.removeWhere((element) => element.selected);
});
   duplicateModalList = modalList;
  }
  loadModal(){
    setState(() {
      modalList=DummyData.ordersList.map((orderjson) => OrderModal.fromJson(orderjson)).toList();
    });
    duplicateModalList= modalList;
    pickUpAreaCodesList = modalList.map((e) => e.pickupPostalCode.substring(0,2)).toSet().toList();
    deliveryAreaCodesList =modalList.map((e) => e.deliveryPostalCode.substring(0,2)).toSet().toList();
    pickUpDatesList = modalList.map((e) => e.pickupDateDDMMYYY).toSet().toList();
    deliveryDatesList = modalList.map((e) => e.deliveryDateDDMMYYYY).toSet().toList();
    merchantNamesList = modalList.map((e) => e.merchantName).toSet().toList();
    pickUpAreaCodesList.add("Un Selected");
    deliveryAreaCodesList.add("Un Selected");
    pickUpDatesList.add("Un Selected");
    deliveryDatesList.add("Un Selected");
    merchantNamesList.add("Un Selected");
  }
}
