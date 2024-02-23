import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';
import 'package:easy_flutter_boilerplate/app/core/base/observer.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/home/controllers/home_controller.dart';
import 'package:easy_flutter_boilerplate/app/presentation/widget/test_list_item.dart';
import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  final List<Observable<SomeModel>> list;
  final Function(int index)? onTapItem;
  final Function(int index)? onDoubleTapItem;

  const MyList({
    super.key,
    required this.list,
    this.onTapItem,
    this.onDoubleTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print("tap tap");
            onTapItem?.call(index);
          },
          child: Observer<SomeModel>(
              observable: list[index],
              childBuilder: (BuildContext context, SomeModel mode, _) {
                return TestListItem(
                  key: Key(list[index].value.itemIndex.toString()),
                  model: list[index].value,
                );
              }),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 2,
          color: Colors.black,
        );
      },
    );
  }
}
