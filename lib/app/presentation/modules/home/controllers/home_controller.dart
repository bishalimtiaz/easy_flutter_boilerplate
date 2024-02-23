import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';
import 'package:easy_flutter_boilerplate/app/core/base/observable_list.dart';
import 'package:easy_flutter_boilerplate/app/core/base/screen_controller.dart';

class SomeModel {
  final int itemIndex;
  int count;
  bool isSelected;

  SomeModel({
    required this.itemIndex,
    this.count = 0,
    this.isSelected = false,
  });

  SomeModel copyWith({int? itemIndex, int? count}) {
    return SomeModel(
      itemIndex: itemIndex ?? this.itemIndex,
      count: count ?? this.count,
    );
  }
}

class HomeController extends ScreenController {
  Observable<bool> count = Observable<bool>(false);

  // Observable<SomeModel> model = Observable<SomeModel>(SomeModel());
  ObservableList<Observable<SomeModel>> myList =
      ObservableList<Observable<SomeModel>>.empty(growable: true);

  // List<SomeModel> list = List<SomeModel>.(elements);

  void updateCount() async {
    ///primitive type
    count.value = !count.value;

    // count.updateValue((int val) {
    //   val = val + 1;
    // });

    ///In case of immutable class
    // model.value = model.value.copyWith(count: model.value + 1);

    ///In case of mutable class
    // model.updateValue((SomeModel value) {
    //   value.count++;
    // });
  }

  void updateSelected(int index) async {
    // myList.updateAt(index, (Observable<SomeModel>? observable) {
    //   // model?.isSelected = !model.isSelected;
    //   observable?.updateValue((SomeModel model) {
    //
    //   })
    //
    // });
    myList.value[index].updateValue((SomeModel model) {
      model.isSelected = !model.isSelected;
    });
    print("updating.....");

    // myList.value[index].value;
  }

  void addMore() async {
    myList.addAll([
      // SomeModel(itemIndex: 81),
      // SomeModel(itemIndex: 82),
      // SomeModel(itemIndex: 83),
      // SomeModel(itemIndex: 84),
      // SomeModel(itemIndex: 85),
      // SomeModel(itemIndex: 86),
      // SomeModel(itemIndex: 87),
      // SomeModel(itemIndex: 88),
      // SomeModel(itemIndex: 89),
      // SomeModel(itemIndex: 90),
    ]);
  }

  @override
  void onInit() {
    print("onInit HomeController");
    _generateList();

    super.onInit();
  }

  @override
  void onDispose() {
    print("onDispose HomeController");
  }

  void _generateList() async {
    print("generarting List");
    myList.addAll([
      Observable<SomeModel>(SomeModel(itemIndex: 1)),
      // Observable<SomeModel>(SomeModel(itemIndex: 2)),
      // Observable<SomeModel>(SomeModel(itemIndex: 3)),
      // Observable<SomeModel>(SomeModel(itemIndex: 4)),
      // Observable<SomeModel>(SomeModel(itemIndex: 5)),
      // Observable<SomeModel>(SomeModel(itemIndex: 6)),
      // Observable<SomeModel>(SomeModel(itemIndex: 7)),
      // Observable<SomeModel>(SomeModel(itemIndex: 8)),
      // Observable<SomeModel>(SomeModel(itemIndex: 9)),
      // Observable<SomeModel>(SomeModel(itemIndex: 10)),
      // Observable<SomeModel>(SomeModel(itemIndex: 11)),
      // Observable<SomeModel>(SomeModel(itemIndex: 12)),
      // Observable<SomeModel>(SomeModel(itemIndex: 13)),
      // Observable<SomeModel>(SomeModel(itemIndex: 14)),
      // Observable<SomeModel>(SomeModel(itemIndex: 15)),
      // Observable<SomeModel>(SomeModel(itemIndex: 16)),
      // Observable<SomeModel>(SomeModel(itemIndex: 17)),
      // Observable<SomeModel>(SomeModel(itemIndex: 18)),
      // Observable<SomeModel>(SomeModel(itemIndex: 19)),
      // Observable<SomeModel>(SomeModel(itemIndex: 20)),
      // Observable<SomeModel>(SomeModel(itemIndex: 21)),
      // Observable<SomeModel>(SomeModel(itemIndex: 22)),
      // Observable<SomeModel>(SomeModel(itemIndex: 23)),
      // Observable<SomeModel>(SomeModel(itemIndex: 24)),
      // Observable<SomeModel>(SomeModel(itemIndex: 25)),
      // Observable<SomeModel>(SomeModel(itemIndex: 26)),
      // Observable<SomeModel>(SomeModel(itemIndex: 27)),
      // Observable<SomeModel>(SomeModel(itemIndex: 28)),
      // Observable<SomeModel>(SomeModel(itemIndex: 29)),
      // Observable<SomeModel>(SomeModel(itemIndex: 30)),
      // Observable<SomeModel>(SomeModel(itemIndex: 31)),
      // Observable<SomeModel>(SomeModel(itemIndex: 32)),
      // Observable<SomeModel>(SomeModel(itemIndex: 33)),
      // Observable<SomeModel>(SomeModel(itemIndex: 34)),
      // Observable<SomeModel>(SomeModel(itemIndex: 35)),
      // Observable<SomeModel>(SomeModel(itemIndex: 36)),
      // Observable<SomeModel>(SomeModel(itemIndex: 37)),
      // Observable<SomeModel>(SomeModel(itemIndex: 38)),
      // Observable<SomeModel>(SomeModel(itemIndex: 39)),
      // Observable<SomeModel>(SomeModel(itemIndex: 40)),
      // Observable<SomeModel>(SomeModel(itemIndex: 41)),
      // Observable<SomeModel>(SomeModel(itemIndex: 42)),
      // Observable<SomeModel>(SomeModel(itemIndex: 43)),
      // Observable<SomeModel>(SomeModel(itemIndex: 44)),
      // Observable<SomeModel>(SomeModel(itemIndex: 45)),
      // Observable<SomeModel>(SomeModel(itemIndex: 46)),
      // Observable<SomeModel>(SomeModel(itemIndex: 47)),
      // Observable<SomeModel>(SomeModel(itemIndex: 48)),
      // Observable<SomeModel>(SomeModel(itemIndex: 49)),
      // Observable<SomeModel>(SomeModel(itemIndex: 50)),
      // Observable<SomeModel>(SomeModel(itemIndex: 51)),
      // Observable<SomeModel>(SomeModel(itemIndex: 52)),
      // Observable<SomeModel>(SomeModel(itemIndex: 53)),
      // Observable<SomeModel>(SomeModel(itemIndex: 54)),
      // Observable<SomeModel>(SomeModel(itemIndex: 55)),
      // Observable<SomeModel>(SomeModel(itemIndex: 56)),
      // Observable<SomeModel>(SomeModel(itemIndex: 57)),
      // Observable<SomeModel>(SomeModel(itemIndex: 58)),
      // Observable<SomeModel>(SomeModel(itemIndex: 59)),
      // Observable<SomeModel>(SomeModel(itemIndex: 60)),
      // Observable<SomeModel>(SomeModel(itemIndex: 61)),
      // Observable<SomeModel>(SomeModel(itemIndex: 62)),
      // Observable<SomeModel>(SomeModel(itemIndex: 63)),
      // Observable<SomeModel>(SomeModel(itemIndex: 64)),
      // Observable<SomeModel>(SomeModel(itemIndex: 65)),
      // Observable<SomeModel>(SomeModel(itemIndex: 66)),
      // Observable<SomeModel>(SomeModel(itemIndex: 67)),
      // Observable<SomeModel>(SomeModel(itemIndex: 68)),
      // Observable<SomeModel>(SomeModel(itemIndex: 69)),
      // Observable<SomeModel>(SomeModel(itemIndex: 70)),
      // Observable<SomeModel>(SomeModel(itemIndex: 71)),
      // Observable<SomeModel>(SomeModel(itemIndex: 72)),
      // Observable<SomeModel>(SomeModel(itemIndex: 73)),
      // Observable<SomeModel>(SomeModel(itemIndex: 74)),
      // Observable<SomeModel>(SomeModel(itemIndex: 75)),
      // Observable<SomeModel>(SomeModel(itemIndex: 76)),
      // Observable<SomeModel>(SomeModel(itemIndex: 77)),
      // Observable<SomeModel>(SomeModel(itemIndex: 78)),
      // Observable<SomeModel>(SomeModel(itemIndex: 79)),
      // Observable<SomeModel>(SomeModel(itemIndex: 80)),
      // Observable<SomeModel>(SomeModel(itemIndex: 81)),
      // Observable<SomeModel>(SomeModel(itemIndex: 82)),
      // Observable<SomeModel>(SomeModel(itemIndex: 83)),
      // Observable<SomeModel>(SomeModel(itemIndex: 84)),
      // Observable<SomeModel>(SomeModel(itemIndex: 85)),
      // Observable<SomeModel>(SomeModel(itemIndex: 86)),
      // Observable<SomeModel>(SomeModel(itemIndex: 87)),
      // Observable<SomeModel>(SomeModel(itemIndex: 88)),
      // Observable<SomeModel>(SomeModel(itemIndex: 89)),
      // Observable<SomeModel>(SomeModel(itemIndex: 90)),
    ]);
  }
}
