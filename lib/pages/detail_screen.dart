import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monger/models/houses.dart';
import 'package:monger/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  // final House house;
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteState = context.watch<FavoriteProvider>();
    final house = ModalRoute.of(context)!.settings.arguments as House;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              title: Text(
                "Detail",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
              ),
            ),
            body: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return SingleChildScrollView(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImagePreviewDesktop(house: house),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "\$${NumberFormat('#,##0').format(house.price)}",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .shadow,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(200),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    favoriteState.isFavorite(
                                                            house.id)
                                                        ? favoriteState
                                                            .removeFavorite(
                                                                house.id)
                                                        : favoriteState
                                                            .addFavorite(
                                                                house.id);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    child: Icon(
                                                        favoriteState
                                                                .isFavorite(
                                                                    house.id)
                                                            ? IconsaxBold.heart
                                                            : IconsaxOutline
                                                                .heart,
                                                        color: favoriteState
                                                                .isFavorite(
                                                                    house.id)
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .error
                                                            : Theme.of(context)
                                                                .colorScheme
                                                                .shadow,
                                                        size: 24),
                                                  ),
                                                ),
                                              )
                                            ]),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          house.location,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .shadow
                                                  .withOpacity(0.6)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(children: [
                                          LargeDetailTag(
                                              detail:
                                                  "${NumberFormat('#,##0').format(house.landSize)}m²",
                                              icon: Icons.expand_sharp),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          LargeDetailTag(
                                              detail: house.bedroom.toString(),
                                              icon: Icons.bed_outlined),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          LargeDetailTag(
                                              detail: house.bathroom.toString(),
                                              icon: Icons.bathtub_outlined),
                                        ])
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text("Description",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow)),
                                  const SizedBox(height: 8),
                                  Text(
                                    house.description,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                    softWrap: true,
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ])),
                );
              } else {
                return SingleChildScrollView(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImagePreview(house: house),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\$${NumberFormat('#,##0').format(house.price)}",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            child: Icon(
                                                favoriteState
                                                        .isFavorite(house.id)
                                                    ? IconsaxBold.heart
                                                    : IconsaxOutline.heart,
                                                color: favoriteState
                                                        .isFavorite(house.id)
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .error
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .shadow,
                                                size: 24),
                                          ),
                                        ),
                                      )
                                    ]),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  house.location,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .shadow
                                          .withOpacity(0.6)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(children: [
                                  LargeDetailTag(
                                      detail:
                                          "${NumberFormat('#,##0').format(house.landSize)}m²",
                                      icon: Icons.expand_sharp),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  LargeDetailTag(
                                      detail: house.bedroom.toString(),
                                      icon: Icons.bed_outlined),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  LargeDetailTag(
                                      detail: house.bathroom.toString(),
                                      icon: Icons.bathtub_outlined),
                                ])
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text("Description",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.shadow)),
                          const SizedBox(height: 8),
                          Text(house.description,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow)),
                        ]));
              }
            })));
  }
}

class ImagePreview extends StatefulWidget {
  const ImagePreview({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  late int choosenImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            widget.house.imageUrls[choosenImageIndex],
            width: double.infinity,
            fit: BoxFit.cover,
            height: 200,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: double.infinity,
          height: 58,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      choosenImageIndex = index;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Opacity(
                      opacity: choosenImageIndex == index ? 1 : 0.3,
                      child: Image.network(
                        widget.house.imageUrls[index],
                        width: 100,
                        height: 58,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 12,
                  ),
              itemCount: widget.house.imageUrls.length),
        ),
      ]),
    );
  }
}

class ImagePreviewDesktop extends StatefulWidget {
  const ImagePreviewDesktop({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<ImagePreviewDesktop> createState() => _ImagePreviewDesktopState();
}

class _ImagePreviewDesktopState extends State<ImagePreviewDesktop> {
  late int choosenImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 3,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            widget.house.imageUrls[choosenImageIndex],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: double.infinity,
          height: 58,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      choosenImageIndex = index;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Opacity(
                      opacity: choosenImageIndex == index ? 1 : 0.3,
                      child: Image.network(
                        widget.house.imageUrls[index],
                        width: 100,
                        height: 58,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 12,
                  ),
              itemCount: widget.house.imageUrls.length),
        ),
      ]),
    );
  }
}

class LargeDetailTag extends StatelessWidget {
  const LargeDetailTag({
    super.key,
    required this.detail,
    required this.icon,
  });

  final String detail;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        children: [
          Icon(icon,
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.6),
              size: 16),
          const SizedBox(
            width: 6,
          ),
          Text(
            detail,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
          )
        ],
      ),
    );
  }
}
