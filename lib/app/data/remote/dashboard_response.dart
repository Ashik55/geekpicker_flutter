class DashboardResponse {
  DashboardResponse({
    this.wallets,
    this.transactions,
  });

  DashboardResponse.fromJson(dynamic json) {
    if (json['wallets'] != null) {
      wallets = [];
      json['wallets'].forEach((v) {
        wallets?.add(Wallets.fromJson(v));
      });
    }
    transactions = json['transactions'] != null
        ? Transactions.fromJson(json['transactions'])
        : null;
  }

  List<Wallets>? wallets;
  Transactions? transactions;
}

class Transactions {
  Transactions({
    this.transactionObject1,
    this.transactionObject2,
  });

  Transactions.fromJson(dynamic json) {
    if (json['2021-02-26'] != null) {
      transactionObject1 = [];
      json['2021-02-26'].forEach((v) {
        transactionObject1?.add(TransactionObject.fromJson(v));
      });
    }
    if (json['2021-02-27'] != null) {
      transactionObject2 = [];
      json['2021-02-27'].forEach((v) {
        transactionObject2?.add(TransactionObject.fromJson(v));
      });
    }
  }

  List<TransactionObject>? transactionObject1;
  List<TransactionObject>? transactionObject2;
}

class TransactionObject {
  TransactionObject({
    this.title,
    this.balance,
    this.currencySym,
    this.type,
    this.status,
    this.picture,
  });

  TransactionObject.fromJson(dynamic json) {
    title = json['title'];
    balance = json['balance'];
    currencySym = json['currency_sym'];
    type = json['type'];
    status = json['status'];
    picture = json['picture'];
  }

  String? title;
  String? balance;
  String? currencySym;
  String? type;
  String? status;
  String? picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['balance'] = balance;
    map['currency_sym'] = currencySym;
    map['type'] = type;
    map['status'] = status;
    map['picture'] = picture;
    return map;
  }
}

class Wallets {
  Wallets({
    this.name,
    this.balance,
    this.currencySym,
    this.primary,
    this.qrCode,
  });

  Wallets.fromJson(dynamic json) {
    name = json['name'];
    balance = json['balance'];
    currencySym = json['currency_sym'];
    primary = json['primary'];
    qrCode = json['qr_code'];
  }

  String? name;
  String? balance;
  String? currencySym;
  String? primary;
  String? qrCode;

}
