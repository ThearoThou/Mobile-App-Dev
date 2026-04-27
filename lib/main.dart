import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // Use path-based URLs instead of hash-based URLs (removes the # from the URL)
  usePathUrlStrategy();
  runApp(
    MaterialApp.router(
      routerConfig: router,
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive Profile')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 600;

          if (isWide) {
            // 2-column layout for wide screens
            return Row(
              children: [
                Expanded(child: _buildColumn(Colors.blue.shade100, 'Left Column', context)),
                Expanded(child: _buildColumn(Colors.green.shade100, 'Right Column', context)),
              ],
            );
          } else {
            // 1-column layout for narrow screens
            return Column(
              children: [
                Expanded(child: _buildColumn(Colors.blue.shade100, 'Top Column', context)),
                Expanded(child: _buildColumn(Colors.green.shade100, 'Bottom Column', context)),
              ],
            );
          }
        },
      ),
    );
  }

  // Helper widget with a single button for navigation
  Widget _buildColumn(Color color, String text, BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigates to the ItemDetailScreen using the route parameter
                context.go('/home/item/42');
              },
              child: const Text('View Item 42'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => openCheckout(context),
              child: const Text('Go to Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

// Exercise 3: Target screen for the deep link
class ItemDetailScreen extends StatelessWidget {
  final String? id;
  const ItemDetailScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Detail')),
      body: Center(
        child: Text('Item ID: $id', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Exercise 2 + 3: Complete Route Configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProfileScreen(),
    ),
    // Exercise 3: Deep link support with :id parameter
    GoRoute(
      path: '/home/item/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ItemDetailScreen(id: id);
      },
    ),
  ],
);

// --- Fixes for the errors below ---

Future<void> openCheckout(BuildContext context) async {
  // We await the result from the pushed route
  final result = await Navigator.push<String>(
    context,
    MaterialPageRoute(builder: (_) => const CheckoutScreen()),
  );

  // Show snackbar when result == 'success'
  if (result == 'success' && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Checkout Successful!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, 'success'),
          child: const Text('Complete Purchase'),
        ),
      ),
    );
  }
}

enum UiState { loading, empty, error, data }

Widget buildCatalogBody(UiState state) {
  switch (state) {
    case UiState.loading:
      return const Center(child: CircularProgressIndicator());
    case UiState.empty:
      return const Center(child: Text('No products found'));
    case UiState.error:
      return const Center(child: Text('Something went wrong'));
    case UiState.data:
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_bag, size: 50),
                Text('Product ${index + 1}'),
                Text('\$${(index + 1) * 10}'),
              ],
            ),
          );
        },
      );
  }
}
