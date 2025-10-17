import 'package:flutter/material.dart';

// You would typically define a CartItem model to pass data
class CartItem {
  final String id;
  final String name;
  final double price;
  final String category;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.quantity = 1,
  });

  double get subtotal => price * quantity;
}

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChanged;

  const CartItemCard({
    Key? key,
    required this.item,
    required this.onDelete,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Product Image (Left side) ---
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                item.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                // Replace with a placeholder asset or custom loading widget for real apps
                errorBuilder: (context, error, stackTrace) => 
                  Container(
                    width: 100, 
                    height: 100, 
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
              ),
            ),
            const SizedBox(width: 12),

            // --- Product Details and Controls (Right side) ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Price
                  Text(
                    '\$ ${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Shipping/Stock Info
                  const Text(
                    'Eligible for free shipping',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'In Stock',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Category
                  Text(
                    'Category : ${item.category}',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),

                  // Quantity and Delete Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Control
                      _buildQuantityControl(context),
                      
                      // Delete Button
                      _buildDeleteButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for quantity controls
  Widget _buildQuantityControl(BuildContext context) {
    return Row(
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.remove_circle_outline,
            color: Colors.black,
            size: 24,
          ),
          onPressed: item.quantity > 1
              ? () => onQuantityChanged(item.quantity - 1)
              : null, // Disable if quantity is 1
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            item.quantity.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () => onQuantityChanged(item.quantity + 1),
        ),
      ],
    );
  }

  // Helper widget for the delete button
  Widget _buildDeleteButton() {
    return ElevatedButton.icon(
      onPressed: onDelete,
      icon: const Icon(Icons.delete, size: 18),
      label: const Text('Delete'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[600],
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}