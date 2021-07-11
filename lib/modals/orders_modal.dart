class OrderModal {
  String orderNumber;
  String orderDescription;
  String weightOfOrder;
  String quantity;
  String pickupDateDDMMYYY;
  String pickupAddressLine1;
  String pickupPostalCode;
  String deliveryDateDDMMYYYY;
  String deliveryAddressLine1;
  String deliveryPostalCode;
  String customerFirstName;
  String customerLastName;
  String customerEmail;
  String customerPhoneNumber;
  String merchantName;
  String approvalStatus;
  bool selected=false;

  OrderModal(
      {this.orderNumber,
        this.orderDescription,
        this.weightOfOrder,
        this.quantity,
        this.pickupDateDDMMYYY,
        this.pickupAddressLine1,
        this.pickupPostalCode,
        this.deliveryDateDDMMYYYY,
        this.deliveryAddressLine1,
        this.deliveryPostalCode,
        this.customerFirstName,
        this.customerLastName,
        this.customerEmail,
        this.customerPhoneNumber,
        this.merchantName,
        this.approvalStatus,
      });

  OrderModal.fromJson(Map<String, dynamic> json) {
    orderNumber =
    json['Order Number (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    orderDescription =
    json['Order Description (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    weightOfOrder =
    json['Weight of Order (g/kg) (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    quantity =
    json['Quantity (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    pickupDateDDMMYYY =
    json['Pickup Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    pickupAddressLine1 =
    json['Pickup Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    pickupPostalCode =
    json['Pickup Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    deliveryDateDDMMYYYY = json[
    'Delivery Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    deliveryAddressLine1 =
    json['Delivery Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    deliveryPostalCode =
    json['Delivery Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    customerFirstName =
    json['Customer First Name (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    customerLastName =
    json['Customer Last Name (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    customerEmail =
    json['Customer Email (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    customerPhoneNumber =
    json['Customer Phone Number (REQUIRED FIELD, PLEASE FILL IN HERE)'];
    merchantName = json['Merchant Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Order Number (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.orderNumber;
    data['Order Description (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.orderDescription;
    data['Weight of Order (g/kg) (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.weightOfOrder;
    data['Quantity (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.quantity;
    data['Pickup Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.pickupDateDDMMYYY;
    data['Pickup Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.pickupAddressLine1;
    data['Pickup Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.pickupPostalCode;
    data['Delivery Date (dd-MM-yyyy) (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.deliveryDateDDMMYYYY;
    data['Delivery Address Line 1 (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.deliveryAddressLine1;
    data['Delivery Postal Code (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.deliveryPostalCode;
    data['Customer First Name (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.customerFirstName;
    data['Customer Last Name (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.customerLastName;
    data['Customer Email (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.customerEmail;
    data['Customer Phone Number (REQUIRED FIELD, PLEASE FILL IN HERE)'] =
        this.customerPhoneNumber;
    data['Merchant Name'] = this.merchantName;
    data['Approval Status'] = this.approvalStatus;
    return data;
  }
}
