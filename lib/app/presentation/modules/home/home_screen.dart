import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';
import 'package:easy_flutter_boilerplate/app/core/base/observer.dart';
import 'package:easy_flutter_boilerplate/app/core/base/screen_state.dart';
import 'package:easy_flutter_boilerplate/app/presentation/widget/test_list.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '/app/presentation/modules/home/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ScreenState<HomeScreen, HomeController> {
  @override
  String? get routeName => AppRoutes.home;

  @override
  Widget buildScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Observer<bool>(
            observable: controller.count,
            childBuilder: (BuildContext context, bool value, _) {
              return Container(
                color: value ? Colors.green : Colors.white,
                child: Text("${value}"),
              );
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              controller.updateCount();
            },
            child: Text("Count"),
          ),
          Observer<List<Observable<SomeModel>>>(
            observable: controller.myList,
            childBuilder:
                (BuildContext context, List<Observable<SomeModel>> list, _) {
              return MyList(
                list: list,
                onTapItem: (int index) {
                  controller.updateSelected(index);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
