import 'package:flutter/material.dart';
import 'package:test_app_v2/src/utilities/models/product_model.dart';

class RelativeScrollProvider extends ChangeNotifier {
  static const int gridColumnCount = 3;
  ScrollController headerScrollController = ScrollController();
  ScrollController scrollController = ScrollController();
  int currentCategoryIndex = 0;

  List<ShopModel> shopList = [];
  RelativeScrollProvider(BuildContext context) {
    _generateDumyData();

    scrollController.addListener(() {
      final index = shopList.indexWhere((element) => element.position >= scrollController.offset);
      changeIndex(index);
      headerScrollController.animateTo(index * (MediaQuery.of(context).size.width * 0.2), duration: Duration(seconds: 1), curve: Curves.decelerate);
    });
  }

  void changeIndex(int val) {
    currentCategoryIndex = val;
    notifyListeners();
  }

  void headerListChangePosition(int index) {
    scrollController.animateTo(shopList[index].position, duration: Duration(seconds: 1), curve: Curves.ease);
  }

  double oneItemHeight = 0;
  void fillListPositionValues(double val) {
    if (oneItemHeight == 0) {
      oneItemHeight = val;
      shopList.asMap().forEach((key, value) {
        if (key == 0) {
          shopList[key].position = 0;
        } else {
          shopList[key].position = getShopListPosition(val, key);
        }
      });
    }
  }

  double getShopListPosition(double val, int index) {
    return val * (shopList[index].products.length / gridColumnCount) + shopList[index - 1].position;
  }

  void _generateDumyData() {
    shopList = List.generate(
      10,
      (index) {
        return ShopModel(
          categoryName: 'category ${index + 1}',
          products: List.generate(
            5,
            (pindex) {
              int id = int.tryParse('${index + 1}${pindex + 1}') ?? pindex;
              return ProductModel(id: id, title: 'product $id', price: id * 5.35);
            },
          ),
        );
      },
    );
  }
}

class ShopModel {
  final String categoryName;
  final List<ProductModel> products;
  double position = 0;
  ShopModel({
    required this.categoryName,
    required this.products,
  });
}
