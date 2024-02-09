import '../../presentation/address/models/address_model.dart';
import '../../presentation/home/models/product_model.dart';
import '../../presentation/home/models/store_model.dart';
import 'assets.gen.dart';

final List<ProductModel> featuredProducts = [
  ProductModel(
    images: [
      Assets.images.products.lampu.path,
      Assets.images.products.lampu.path,
      Assets.images.products.lampu.path,
    ],
    name: 'Lampu',
    price: 90000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
  ProductModel(
    images: [
      Assets.images.products.earphone.path,
      Assets.images.products.earphone.path,
      Assets.images.products.earphone.path,
    ],
    name: 'Earphone',
    price: 320000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
];

final List<ProductModel> bestSellers = [
  ProductModel(
    images: [
      Assets.images.products.keyboard.path,
      Assets.images.products.keyboard.path,
      Assets.images.products.keyboard.path,
    ],
    name: 'Keyboard Mechanical',
    price: 320000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
  ProductModel(
    images: [
      Assets.images.products.earphone.path,
      Assets.images.products.earphone.path,
      Assets.images.products.earphone.path,
    ],
    name: 'Earphone',
    price: 320000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
];

final List<ProductModel> newArrivals = [
  ProductModel(
    images: [
      Assets.images.products.sepatu.path,
      Assets.images.products.sepatu2.path,
      Assets.images.products.sepatu.path,
    ],
    name: 'Sepatu Nike',
    price: 2200000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
  ProductModel(
    images: [
      Assets.images.products.sepatu2.path,
      Assets.images.products.sepatu.path,
      Assets.images.products.sepatu2.path,
    ],
    name: 'Sepatu Nike',
    price: 2200000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
];

final List<ProductModel> topRatedProducts = [
  ProductModel(
    images: [
      Assets.images.products.mac.path,
      Assets.images.products.mac2.path,
      Assets.images.products.mac.path,
    ],
    name: 'Macbook',
    price: 12220000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
  ProductModel(
    images: [
      Assets.images.products.mac2.path,
      Assets.images.products.mac.path,
      Assets.images.products.mac2.path,
    ],
    name: 'Macbook',
    price: 12220000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
];

final List<ProductModel> specialOffers = [
  ProductModel(
    images: [
      Assets.images.products.mac.path,
      Assets.images.products.mac2.path,
      Assets.images.products.mac.path,
    ],
    name: 'Macbook',
    price: 12220000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
  ProductModel(
    images: [
      Assets.images.products.mac2.path,
      Assets.images.products.mac.path,
      Assets.images.products.mac2.path,
    ],
    name: 'Macbook',
    price: 12220000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
];

final List<ProductModel> carts = [
  ProductModel(
    images: [
      Assets.images.products.earphone.path,
      Assets.images.products.earphone.path,
      Assets.images.products.earphone.path,
    ],
    name: 'Earphone',
    price: 320000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
  ProductModel(
    images: [
      Assets.images.products.sepatu.path,
      Assets.images.products.sepatu2.path,
      Assets.images.products.sepatu.path,
    ],
    name: 'Sepatu Nike',
    price: 2200000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
];

final List<AddressModel> addresses = [
  AddressModel(
    country: 'Indonesia',
    firstName: 'Saiful',
    lastName: 'Bahri',
    address: 'Jl. Merdeka No. 123',
    city: 'Jakarta Selatan',
    province: 'DKI Jakarta',
    zipCode: 12345,
    phoneNumber: '08123456789',
    isPrimary: true,
  ),
  AddressModel(
    country: 'Indonesia',
    firstName: 'Saiful',
    lastName: '',
    address: 'Jl. Cendrawasih No. 456',
    city: 'Bandung',
    province: 'Jawa Barat',
    zipCode: 67890,
    phoneNumber: '08987654321',
  ),
];
