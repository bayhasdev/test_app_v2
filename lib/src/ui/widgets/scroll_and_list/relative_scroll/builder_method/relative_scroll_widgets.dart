import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_v2/src/ui/widgets/scroll_and_list/relative_scroll/builder_method/relative_scroll_provider.dart';
import 'package:test_app_v2/src/utilities/models/product_model.dart';

class CategoryHeaderSingleItem extends StatelessWidget {
  final int index;
  const CategoryHeaderSingleItem(this.index);
  @override
  Widget build(BuildContext context) {
    RelativeScrollProvider provider = Provider.of<RelativeScrollProvider>(context);
    return Card(
      elevation: 1,
      color: provider.currentCategoryIndex == index ? Colors.white60 : Colors.white,
      child: InkWell(
        onTap: () {
          provider.headerListChangePosition(index);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(provider.shopList[index].categoryName, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final ShopModel model;
  final int index;
  final Function(double val) onHeight;

  const ShopCard({required this.model, required this.index, required this.onHeight});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      onHeight((context.size!.height) / (model.products.length / RelativeScrollProvider.gridColumnCount));
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        _categoryHeader(),
        buildGridViewProducts(index, model.products),
      ],
    );
  }

  Widget _categoryHeader() {
    return Card(
      color: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${model.categoryName} $index",
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  GridView buildGridViewProducts(int index, List<ProductModel> products) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: RelativeScrollProvider.gridColumnCount),
      itemBuilder: (context, index) {
        return ProductSingleItem(products[index]);
      },
    );
  }
}

class ProductSingleItem extends StatelessWidget {
  final ProductModel item;
  const ProductSingleItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(item.title ?? ''),
      ),
    );
  }
}
