import 'package:excel/excel.dart';
import 'package:load_n_go_task/modals/orders_modal.dart';

class ExcelService{
  var excel = Excel.createExcel(); // automatically creates 1 empty sheet: Sheet1
  int rows;
  int columns;
  List<OrderModal> tableData;
  List<String> _labels = ["Order Number (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Order Description (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Weight of Order (g/kg) (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Quantity (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Pickup Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Pickup Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Pickup Address Line 2",
    "Pickup Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Delivery Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Delivery Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Delivery Address Line 2",
    "Delivery Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Customer First Name (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Customer Last Name (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Customer Email (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Customer Phone Number (REQUIRED FIELD, PLEASE FILL IN HERE)",
    "Customer Company",
    "Merchant Name",
    "Approval Status"];

  ExcelService(){

    /// It will put the list-iterables in the 8th index row
    List<String> dataList = ["Google", "loves", "Flutter", "and", "Flutter", "loves", "Google"];
    Sheet sheetObject = excel['Load and Go Exported Dummy Data'];
    sheetObject.insertRowIterables(dataList, 1);
  }
}