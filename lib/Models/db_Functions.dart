import 'package:flutter/cupertino.dart';

import 'data.dart';

ValueNotifier<List<ItemModel>> itemListNotifier =ValueNotifier([]);

void addItem(ItemModel value)
{
  itemListNotifier.value.add(value);
  itemListNotifier.notifyListeners();

}