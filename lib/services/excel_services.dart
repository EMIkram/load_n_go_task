import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:load_n_go_task/Utils/utilities.dart';
import 'package:load_n_go_task/modals/orders_modal.dart';
import 'package:permission_handler/permission_handler.dart';

class ExcelService{
  var excel = Excel.createExcel(); // automatically creates 1 empty sheet: Sheet1
  int rows;
  int columns;
  String sheetName;
  List<OrderModal> tableData;
  Sheet sheetObject;
  List<String> _labels = [
  /// 1
  "Order Number (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 2
  "Order Description (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 3
  "Weight of Order (g/kg) (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 4
  "Quantity (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 5
  "Pickup Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 6
  "Pickup Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 7
  "Pickup Address Line 2",
  /// 8
  "Pickup Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 9
  "Delivery Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 10
  "Delivery Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 11
  "Delivery Address Line 2",
  /// 12
  "Delivery Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 13
  "Customer First Name (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 14
  "Customer Last Name (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 15
  "Customer Email (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 16
  "Customer Phone Number (REQUIRED FIELD, PLEASE FILL IN HERE)",
  /// 17
  "Customer Company",
  /// 18
  "Merchant Name",
  /// 19
  "Approval Status"];

  ExcelService({@required this.sheetName}){
    /// It will put the list-iterables in the 8th index row
    sheetObject = excel[sheetName];
    sheetObject.insertRowIterables(_labels, 1);
  }

  appendRow(OrderModal modal)
  {
    sheetObject.appendRow(
         [
           modal.orderNumber,
           modal.orderDescription,
           modal.weightOfOrder,
           modal.quantity,
           modal.pickupDateDDMMYYY,
           modal.pickupAddressLine1,
           modal.pickupAddressLine2,
           modal.pickupPostalCode,
           modal.deliveryDateDDMMYYYY,
           modal.deliveryAddressLine1,
           modal.deliveryAddressLine2,
           modal.deliveryPostalCode,
           modal.customerFirstName,
           modal.customerLastName,
           modal.customerEmail,
           modal.customerPhoneNumber,
           modal.customerCompany,
           modal.merchantName,
           modal.approvalStatus
         ]);
  }

  saveToDownloads() async {
    await Permission.storage.request();
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   await Permission.storage.request();
    // }
 try{
   Directory downloadsDirectory = await  DownloadsPathProvider.downloadsDirectory;
   // Save the Changes in file
   excel.encode().then((onValue) {
     File file = File("${downloadsDirectory.path}/$sheetName.xlsx")
     // File.fromUri(Uri.parse("$downloadsDirectory/$sheetName.xlsx"))
     //   ..createSync(recursive: true)
     ..create(recursive: true)
       ..writeAsBytesSync(onValue);
     Utils.showToast("File saved in $downloadsDirectory");
   });
 }
 catch(e)
    {
      Utils.showToast("${e.message}");
    }
  }

}