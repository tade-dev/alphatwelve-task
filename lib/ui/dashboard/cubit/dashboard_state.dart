part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {

  const DashboardState._();

  const factory DashboardState.initial({

    @Default(0) int currentIndex,
    @Default([]) List<Product> productList,
    Product? selectedProduct,
    @Default("") String searchText

  }) = _Initial;

  List<Widget> get views => [
    HomeV(),
    CartV(),
    FavoritesV(),
    FavoritesV(),
  ];

  List<Product> get filteredProducts => (searchText.isEmpty) ? 
  productList : 
  productList.where((product)=> product.title.toLowerCase().contains(searchText.toLowerCase())).toList();

  List<Map<String, dynamic>> get products => [
    {
      "title": "Apple iPhone 16 128GB|Teal",
      "image": Assets.images.iphone.path,
      "price": 700.00,
      "quantity": 1,
      "description": [
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
        "There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.",
      ],
      "availability": true,
      "isLiked": false
    },
    {
      "title": "M4 Macbook Air 13” 256GB|Sky blue",
      "image": Assets.images.laptop.path,
      "price": 1000.00,
      "quantity": 1,
      "description": [
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
        "There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.",
      ],
      "availability": true,
      "isLiked": false
    },
    {
      "title": "Google Pixel 9A 128GB|Iris",
      "image": Assets.images.pixel.path,
      "price": 499.00,
      "quantity": 1,
      "description": [
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
        "There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.",
      ],
      "availability": true,
      "isLiked": false
    },
    {
      "title": "Apple Airpods 4 Active Noise Cancellation",
      "image": Assets.images.pods.path,
      "price": 129.00,
      "quantity": 1,
      "description": [
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
        "There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.",
      ],
      "availability": true,
      "isLiked": false
    },
  ];

}