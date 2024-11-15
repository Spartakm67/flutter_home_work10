import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserTransactionsScreen extends StatelessWidget {
  const UserTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепти'),
      ),
      body: Column(
        // children: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: TextField(
        //       controller: recipeModel.searchController,
        //       onChanged: (query) => recipeModel.setSearchQuery(query),
        //       decoration: InputDecoration(
        //         labelText: 'Пошук за назвою',
        //         border: const OutlineInputBorder(),
        //         suffixIcon: recipeModel.searchController.text.isNotEmpty
        //             ? IconButton(
        //           icon: const Icon(Icons.clear),
        //           onPressed: recipeModel.clearSearchQuery,
        //         )
        //             : null,
        //       ),
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: DropdownButton<String>(
        //       value: recipeModel.selectedCategory,
        //       hint: const Text("Обрати категорію"),
        //       onChanged: (category) =>
        //           recipeModel.setSelectedCategory(category),
        //       isExpanded: true,
        //       items: [
        //         const DropdownMenuItem(
        //           value: null,
        //           child: Text("Усі категорії"),
        //         ),
        //         ...recipeModel.getAllCategories().map((category) {
        //           return DropdownMenuItem(
        //             value: category,
        //             child: Text(category),
        //           );
        //         }),
        //       ],
        //     ),
        //   ),
        //   Expanded(
        //     child: ListView.builder(
        //       itemCount: recipes.length,
        //       itemBuilder: (context, index) {
        //         final recipe = recipes[index];
        //         return RecipeCard(recipe: recipe);
        //       },
        //     ),
        //   ),
        // ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final result = await Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (_) => const RecipeForm()),
      //     );
      //     if (result != null && result is Recipe) {
      //       recipeModel.addRecipe(result);
      //     }
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
