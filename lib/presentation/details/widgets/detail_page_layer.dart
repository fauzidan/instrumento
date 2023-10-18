import 'package:flutter/material.dart';
import 'package:instrumento/data/data.dart';

class DetailPageLayer extends StatelessWidget {
  const DetailPageLayer({
    super.key,
    required this.instrument,
    required this.onAddToCart,
  });

  final Instrument instrument;
  final Function(Instrument instrument) onAddToCart;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        instrument.name,
                        style: const TextStyle(
                          fontFamily: 'Anton',
                          fontSize: 36,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 64),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: mq.size.width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Deskripsi',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                instrument.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, Colors.black54],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: mq.size.width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Harga',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Rp.  ${instrument.price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              instrument.instrumentThumb,
              height: mq.size.height * 0.70,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  minimumSize: Size.fromHeight(mq.size.height * 0.06)),
              onPressed: () => onAddToCart(instrument),
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Tambahkan'),
            ),
          ),
        ),
      ],
    );
  }
}
