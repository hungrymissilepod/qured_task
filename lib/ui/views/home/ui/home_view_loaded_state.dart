import 'package:flutter/material.dart';
import 'package:flutter_app_template/ui/views/home/home_viewmodel.dart';
import 'package:flutter_app_template/ui/views/home/ui/home_view_empty_state.dart';
import 'package:stacked/stacked.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeViewLoadedState extends ViewModelWidget<HomeViewModel> {
  const HomeViewLoadedState({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return viewModel.postDetails.isEmpty
        ? const HomeViewEmptyState()
        : Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: viewModel.postDetails.map((e) {
                  return InkWell(
                    onTap: () => viewModel.onPostTap(e),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: e.imageUrl ?? '',
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),

                            /// TODO: make this into a reusable widget
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text('${e.user.initial()}'),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    '${e.user.name}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              '${e.post.title}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '${e.post.body}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
  }
}
