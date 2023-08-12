import 'package:blog_app/src/core/constants/app_assets.dart';
import 'package:blog_app/src/data/models/blog_post.dart';
import 'package:blog_app/src/presentation/widgets/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class BlogPostScreen extends StatelessWidget {
  const BlogPostScreen({super.key, required this.blogPost});

  final BlogPost blogPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent.withOpacity(0.3),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.orangeAccent,
              floating: false,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  blogPost.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                titlePadding: const EdgeInsets.only(
                  left: 50,
                  bottom: 17,
                ),
                expandedTitleScale: 1,
                background: Hero(
                  tag: "BlogPostHeroTag${blogPost.id}",
                  child: CachedNetworkImage(
                    imageUrl: blogPost.featuredImageUrl?.replaceAll(
                          "127.0.0.1",
                          "10.0.2.2",
                        ) ??
                        "",
                    progressIndicatorBuilder: (context, widget, event) =>
                        const LoadingIndicator(),
                    errorWidget: (context, error, stack) => Image.asset(
                      AppAssets.imagePlaceholder,
                      fit: BoxFit.cover,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              pinned: true,
              collapsedHeight: kToolbarHeight,
              expandedHeight: 300,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            blogPost.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black26,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  blogPost.category.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black26,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  DateFormat("dd-MM-yyyy").format(
                                    DateTime.parse(
                                      blogPost.createdAt!,
                                    ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    HtmlWidget(
                      blogPost.details,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
