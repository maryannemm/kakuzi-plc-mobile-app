import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishatodo_app/customdrawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'lib/pages/images/woman.svg',
                      width: MediaQuery.of(context).size.width * .85,
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      'lib/pages/images/fairy2.svg',
                      width: MediaQuery.of(context).size.width * .85,
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Welcome to Girl\'s App',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Explore the app and stay productive!',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  _buildGridItem(
                      context,
                      'Exercise',
                      'lib/pages/images/girl-exercise.gif',
                      '/workout-home/gym'),
                  _buildGridItem(context, 'Shopping',
                      'lib/pages/images/girl-shopping.gif', '/shopping-list'),
                  _buildGridItem(context, 'CheckList',
                      'lib/pages/images/check-list.gif', '/Chores-list'),
                  _buildGridItem(context, 'Reading',
                      'lib/pages/images/girl-study.gif', '/study'),
                  _buildGridItem(context, 'Cycle',
                      'lib/pages/images/girl_period.gif', '/cycle_main'),
                  _buildGridItem(
                      context, 'How to', 'lib/pages/images/how.gif', '/how'),
                  // Add more grid items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      BuildContext context, String title, String imagePath, String route) {
    return GridTile(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Card(
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath,
                  height: 100, width: 100, fit: BoxFit.cover),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
