import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/features/favorite/presentation/widgets/custom_grid_item.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/helper/build_dismissible_background.dart';

class FavoriteMovieItem extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const FavoriteMovieItem({
    required this.movie,
    required this.onTap,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(movie.id.toString()),
      direction: DismissDirection.horizontal,
      background: BuildDismissibleBackground(alignment: Alignment.centerLeft),
      secondaryBackground: BuildDismissibleBackground(
        alignment: Alignment.centerRight,
      ),
      onDismissed: (_) => onRemove(),
      child: CustomGridItem(movie: movie, onTap: onTap),
    );
  }
}
