import 'package:blog_app/src/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoryViewItem extends StatelessWidget {
  const CategoryViewItem({
    super.key,
    required this.category,
    required this.onTap,
    required this.selected,
  });

  final Category category;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          selected ? Colors.orangeAccent : Colors.orangeAccent.withOpacity(0.5),
      elevation: 0,
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
