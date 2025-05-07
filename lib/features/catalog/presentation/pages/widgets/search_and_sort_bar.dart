import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:project/features/catalog/presentation/bloc/catalog_event.dart';

class SearchAndSortBar extends StatelessWidget {
  const SearchAndSortBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Поиск',
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CatalogBloc>(
                  context,
                ).add(LoadSortMinProducts());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Min"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Max"),
            ),
          ],
        ),
      ],
    );
  }
}
