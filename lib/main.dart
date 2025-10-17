import 'package:flutter/material.dart';

// --- Data Model and Sample Data ---
class Product {
  final String name;
  final String price;
  String imageUrl="https://www.ipack.com/media/icons/empty-cart-ipack.png";
  final double rating;

  Product(this.name, this.price, this.imageUrl, this.rating);
}

// Using placeholder URLs for demonstration
final List<Product> products = [
  Product('Lippie Pencil', '\$5.0', 'assets/lippie_pencil.jpg', 5.0),
  Product('Blotted Lip', '\$5.5', 'assets/blotted_lip.jpg', 5.0),
  Product('Lippie Stix', '\$5.5', 'assets/lippie_stix.jpg', 5.0),
  Product('No Filter Foundation', '\$12.0', 'assets/No_Filter_Foundation.jpg', 5.0),
];

void main() {
  // You would typically wrap the MaterialApp around the ProductGridScreen
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Grid Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductGridScreen(),
    );
  }
}
// --- Main Screen Widget ---
class ProductGridScreen extends StatefulWidget {
  const ProductGridScreen({super.key});

  @override
  State<ProductGridScreen> createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  @override
  Widget build(BuildContext context) {
    // The total number of items to display: products.length + 1 for the placeholder
    final int itemCount = products.length + 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: itemCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns as seen in the image
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75, // Adjust this ratio to match the card height in the image
          ),
          itemBuilder: (context, index) {
            // Check if it's the last item (which should be the "No Item In your Cart" placeholder)
            if (index == products.length) {
              // Create a special Product object for the placeholder data
              final placeholderProduct = Product(
                  'No Filter Foundation', '\$12.0', 'assets/placeholder.jpg', 5.0);
              return ProductCard(
                product: placeholderProduct,
                isCartEmptyPlaceholder: true,
              );
            }

            // Regular product card
            return ProductCard(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}
// --- Product Card Widget ---
class ProductCard extends StatelessWidget {
  final Product product;
  final bool isCartEmptyPlaceholder;

  const ProductCard({
    super.key,
    required this.product,
    this.isCartEmptyPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.grey, width: 0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image/Placeholder Section
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Product Image (or Placeholder)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: isCartEmptyPlaceholder
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Placeholder for the shopping bag image
                              Icon(Icons.shopping_bag_outlined, size: 60, color: Colors.grey),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'No Item In your Cart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        )
                      // Replace with actual image loading logic (e.g., Image.network or Image.asset)
                      : Image.asset(
                          product.imageUrl, // Use actual asset path
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Text('Image not found')),
                        ),
                ),
                
                // Heart Icon (Wishlist)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product Details Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Rating (5 stars in the image)
                        Row(
                          children: [
                            const Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.star,
                              color: Colors.green[400],
                              size: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Price
                        Text(
                          product.price,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // Add to Cart Button
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: FloatingActionButton(
                        heroTag: product.name, // Important for multiple FABs
                        onPressed: () {
                          // Handle add to cart logic
                        },
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

