import 'package:dev_test/common/widgets/main_appbar.dart';
import 'package:dev_test/common/widgets/space.dart';
import 'package:dev_test/core/dependancy_injection/modules/cookie_module.dart';
import 'package:dev_test/core/routes/app_routes.dart';
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

import '../widgets/export_widgets.dart';

ValueNotifier<int> bottonNavNotifier = ValueNotifier(0);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Tracking(),
      const Center(
        child: Text("Task"),
      ),
      const Center(
        child: Text("Ticket"),
      ),
      const Center(
        child: Text("Mis"),
      )
    ];
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Home',
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Center(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            )),
            ListTile(
              onTap: () {
                persistCookieJar.deleteAll().then((value) {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                });
              },
              title: const Text("Logout"),
              trailing: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: bottonNavNotifier,
          builder: (context, index, _) {
            return pages[index];
          }),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}

class Tracking extends StatelessWidget {
  const Tracking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Punch In',
              style: txt20Black500,
            ),
            Transform.scale(
              scale: 0.6,
              child: Switch(
                activeTrackColor: AppTheme.labelGreen,
                activeColor: AppTheme.whiteColor,
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        const SizedBox(
            width: double.infinity,
            child: Text(
              'Task Status',
              style: txt14Black500,
            )),
        Space.y(20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TastStatusContainer(
                label: "New", count: 12, labelStyle: txt14Orange400),
            TastStatusContainer(
                label: "In Progress", count: 12, labelStyle: txt14Blue400),
            TastStatusContainer(
                label: "Resolved", count: 12, labelStyle: txt14Green400)
          ],
        ),
        Space.y(20),
        const MapSection(),
        Space.y(20),
        const DetailsContainer(),
        Space.y(10),
        ViewDriveListButton(
          onPressed: () {},
        )
      ]),
    );
  }
}
