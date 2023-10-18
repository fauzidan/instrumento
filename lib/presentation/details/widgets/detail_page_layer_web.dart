import 'package:flutter/material.dart';
import 'package:instrumento/data/data.dart';

class DetailPageLayerWeb extends StatelessWidget {
  const DetailPageLayerWeb({
    super.key,
    required this.instrument,
    required this.onAddToCart,
  });

  final Instrument instrument;
  final Function(Instrument instrument) onAddToCart;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      width: 550,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.fromLTRB(16, 32, 0, 32),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Text(
                            instrument.name,
                            style: const TextStyle(
                              fontFamily: 'Anton',
                              fontSize: 36,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, bottom: mq.size.height * 0.05),
                          child: SizedBox(
                            width: mq.size.height < 550 ? 350 : 250,
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
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
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
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black87, Colors.black54],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topCenter,
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
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
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 75,
                width: 250,
                padding: const EdgeInsets.fromLTRB(24, 8, 32, 24),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    backgroundColor: Colors.white,
                    // minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () => onAddToCart(instrument),
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Tambahkan'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
