import 'package:api_integration_2/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        // await Provider.of<HomeScreenController>(context, listen: false)
        //     .fetchData();
        await context.read<HomeScreenController>().fetchData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeScreenController>();
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(homeProvider.dataModel?.usDataList?[index].year
                        .toString() ??
                    ""),
                subtitle: Text(
                    "Population : ${homeProvider.dataModel?.usDataList?[index].population.toString()}"),
              ),
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: homeProvider.dataModel?.usDataList?.length ?? 0),
    );
  }
}
