import 'package:flutter/material.dart';

class HowToDeletePage extends StatelessWidget {
  const HowToDeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'How to Delete an Item',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the Delete Item Guide!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'In your app, we have a fantastic feature that allows you to delete items effortlessly using the Slidable widget.',
                style: TextStyle(color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              const Text(
                'Follow these steps to delete an item:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              _buildStep('1. Open the App:', 'Launch the app on your device.'),
              _buildStep('2. Navigate to Your List:',
                  'Go to the list containing the item you want to delete.'),
              _buildStep('3. Swipe Left :',
                  'Swipe left or right on the item you want to delete. This will reveal the delete action.'),
              _buildStep('4. Confirm Deletion:',
                  'Some slidable widgets may require an additional confirmation step. Confirm the deletion if prompted.'),
              const SizedBox(height: 16),
              const Text(
                'And that\'s it! You have successfully deleted an item using the Slidable widget.',
                style: TextStyle(color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              const Text(
                'Note: The Slidable widget makes it easy to perform actions on list items by providing a swipeable surface. Keep enjoying your app!',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
