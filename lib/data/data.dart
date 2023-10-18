enum Category {
  accoustic('ACCOUSTIC'),
  originalGuitar('ORIGINAL GUITAR'),
  eiiGuitar('E-II GUITAR'),
  ltdBass('LTD BASS'),
  eiiBass('E-II BASS');

  const Category(this.text);
  final String text;
}

class CategoryType {
  String id;
  Category category;
  String categoryThumb;
  List<Instrument> instruments;

  CategoryType({
    required this.id,
    required this.category,
    required this.categoryThumb,
    required this.instruments,
  });
}

class Instrument {
  String id;
  String name;
  String description;
  String instrumentThumb;
  double price;

  Instrument({
    required this.id,
    required this.name,
    required this.description,
    required this.instrumentThumb,
    required this.price,
  });
}

final storeData = [
  CategoryType(
    id: 'C1',
    category: Category.accoustic,
    categoryThumb: 'assets/images/esp/accoustic_thumb.png',
    instruments: [
      Instrument(
        id: 'I1',
        name: 'ESP D-320E',
        description:
            'Gitar akustik klasik yang berbahan mahogany. Memiliki kualitas kayu yang tinggi untuk menghasilkan suara yang halus. Memiliki mekanisme elektronik.',
        instrumentThumb: 'assets/images/esp/akustik/d_320e.png',
        price: 5000000,
      ),
    ],
  ),
  CategoryType(
    id: 'C2',
    category: Category.originalGuitar,
    categoryThumb: 'assets/images/esp/original_guitar_thumb.png',
    instruments: [
      Instrument(
        id: 'I2',
        name: 'ESP FRX',
        description:
            'Gitar elektrik yang berkesan agresif. Memiliki desain dengan derajat yang tinggi. Gitar yang dikhususkan untuk pemain gitar yang ingin gitar yang memiliki aspek yang kuat.',
        instrumentThumb: 'assets/images/esp/original_guitar/esp_frx.png',
        price: 15000000,
      ),
      Instrument(
        id: 'I3',
        name: 'ESP Horizon NT-II',
        description:
            'Gitar yang didesain khusus untuk musisi profesional yang mengandalkan suara, sensasi, dan peforma. Jika anda mencari gitar yang dapat menarik perhatian dengan skema warnanya, gitar ini cocok untuk anda.',
        instrumentThumb: 'assets/images/esp/original_guitar/esp_horizon.png',
        price: 23000000,
      ),
    ],
  ),
  CategoryType(
    id: 'C3',
    category: Category.eiiGuitar,
    categoryThumb: 'assets/images/esp/eii_guitar_thumb.png',
    instruments: [
      Instrument(
        id: 'I4',
        name: 'ESP E-II Arrow',
        description:
            'Desain unik dari gitar ini dijamin akan menarik semua perhatian keramaian konser. Selain desain, gitar ini memiliki performa yang tinggi. E-II Arrow menghadirkan suara yang kuat dan agresif sesuai dengan tampilannya.',
        instrumentThumb: 'assets/images/esp/eii_guitar/eii_arrow.png',
        price: 35000000,
      ),
      Instrument(
        id: 'I5',
        name: 'ESP E-II NT',
        description:
            'Gitar unik yang dikhususkan untuk musisi yang fenomenal. Berbahan dasar mahogany, gitar ini menghadirkan 22 fret yang sangat panjang. Gitar ini dijamin oleh para profesional yang telah menggunakannya.',
        instrumentThumb: 'assets/images/esp/eii_guitar/eii_ex.png',
        price: 14700000,
      ),
    ],
  ),
  CategoryType(
    id: 'C4',
    category: Category.ltdBass,
    categoryThumb: 'assets/images/esp/ltd_bass_thumb.png',
    instruments: [
      Instrument(
        id: 'I6',
        name: 'ESP AP-4',
        description:
            'ESP AP-4 mengasimilasi desain tradisional dan performa modern yang membuatnya sempurna untuk musik kontemporer.',
        instrumentThumb: 'assets/images/esp/ltd_bass/ap4.png',
        price: 11000000,
      ),
      Instrument(
        id: 'I7',
        name: 'ESP F-1004',
        description:
            'Bass yang diperuntukkan untuk musisi yang berkarakter agresif. Pahatan badan bass ini dibuat sesuai dengan preferensi banyak musisi musik berat. Badan bass juga dilapisi resin tipis yang memberi kesan mengkilau.',
        instrumentThumb: 'assets/images/esp/ltd_bass/f_1004.png',
        price: 29000000,
      ),
      Instrument(
        id: 'I8',
        name: 'ESP M4',
        description:
            'Bass terjangkau dan serbaguna. Fitur fitur yang dimiliki bass ini mampu untuk menghasilkan berbagai genre musik. Sangat direkomendasikan untuk pemula yang baru mulai belajar bass.',
        instrumentThumb: 'assets/images/esp/ltd_bass/m4.png',
        price: 3000000,
      ),
    ],
  ),
  CategoryType(
    id: 'C5',
    category: Category.eiiBass,
    categoryThumb: 'assets/images/esp/eii_bass_thumb.png',
    instruments: [
      Instrument(
        id: 'I9',
        name: 'ESP BTL 5',
        description:
            'Sebelumnya dikenal sebagai "ESP Standar". Bass ini dinilai mampu menangani berbagai gaya musik. Bass yang sangat sempurna untuk menemani musisi yang berbakat dalam segala genre musik. ',
        instrumentThumb: 'assets/images/esp/eii_bass/btl_5.png',
        price: 18000000,
      ),
    ],
  ),
];
