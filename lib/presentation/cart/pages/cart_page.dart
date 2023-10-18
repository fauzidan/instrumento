import 'package:flutter/material.dart';
import 'package:instrumento/data/data.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
    required this.cart,
    required this.onRemoveFromCart,
    required this.onPay,
  });

  final List<Instrument> cart;
  final Function(String id) onRemoveFromCart;
  final Function() onPay;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    if (widget.cart.isEmpty) {
      return 0;
    } else {
      return widget.cart.fold<double>(
          0, (previousValue, element) => previousValue + element.price);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang Anda',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.cart.isEmpty)
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.remove_shopping_cart),
                    Text('Keranjang anda masih kosong!')
                  ],
                ),
              )
            else
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: mq.size.width > 1200 ? 1200 : null,
                    child: ListView.builder(
                      itemCount: widget.cart.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          visualDensity: const VisualDensity(vertical: 4),
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  colors: [
                                    Colors.grey.shade500,
                                    Colors.grey.shade300
                                  ],
                                  radius: 0.5,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: Image.asset(
                                widget.cart[index].instrumentThumb,
                                fit: BoxFit.cover,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          title: Text(
                            widget.cart[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            'Rp.  ${widget.cart[index].price.toStringAsFixed(0)} ,-',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: IconButton.outlined(
                            onPressed: () {
                              setState(() {
                                widget.onRemoveFromCart(widget.cart[index].id);
                              });
                            },
                            icon: const Icon(Icons.remove),
                            style: IconButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: widget.cart.isEmpty
          ? null
          : BottomAppBar(
              color: Colors.white,
              child: Center(
                child: SizedBox(
                  width: mq.size.width > 1200 ? 1200 : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Harga',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Rp. ${totalPrice.toStringAsFixed(0)} ,-',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            widget.onPay();
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                        icon: const Icon(Icons.payments_rounded),
                        label: const Text('Bayar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
