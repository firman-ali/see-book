class TransactionModel {
  TransactionModel({
    required this.customerName,
    required this.customerPhoneNumber,
    required this.book,
    required this.priceType,
    required this.duration,
    required this.subTotal,
    required this.voucher,
    required this.total,
    required this.paymentMethod,
    required this.paymentChannel,
  });

  final String customerName;
  final String customerPhoneNumber;
  final String book;
  final String priceType;
  final int duration;
  final int subTotal;
  final int voucher;
  final int total;
  final String paymentMethod;
  final String paymentChannel;

  Map<String, dynamic> toJson() => {
        'customer_name': customerName,
        'customer_phone_number': customerPhoneNumber,
        'book': book,
        'price_type': priceType,
        'duration': duration.toString(),
        'sub_total': subTotal.toString(),
        'voucher': voucher.toString(),
        'total': total.toString(),
        'payment_method': paymentMethod,
        'payment_channel': paymentChannel
      };
}
