import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monger/models/houses.dart';
import 'package:monger/providers/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:monger/providers/name_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameState = context.watch<NameProvider>();
    var favoriteState = context.watch<FavoriteProvider>();
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Halo ${nameState.name}👋🏼",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Plan Your Adventure and Explore Every Corner of the World",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.6),
                              ),
                              softWrap: true,
                              textWidthBasis: TextWidthBasis.parent,
                            ),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      // crossAxisCount: 3, // Number of columns
                      childAspectRatio: 1,
                      crossAxisSpacing: 8.0, // Horizontal spacing between items
                      mainAxisSpacing: 8.0, // Vertical spacing between items
                    ),
                    itemCount: housesList.length,
                    itemBuilder: (context, index) {
                      final House house = housesList[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detail',
                                arguments: house);
                          },
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 300),
                            padding: const EdgeInsets.all(8),
                            height: 700,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    constraints: BoxConstraints(minHeight: 80),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Stack(children: [
                                        Container(
                                          constraints:
                                              BoxConstraints(minHeight: 80),
                                          child: Image.network(
                                            house.imageUrls[0],
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Container(
                                            constraints:
                                                BoxConstraints(minHeight: 80),
                                            height: double.infinity,
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
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
                                                      decoration: BoxDecoration(
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .inversePrimary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      200)),
                                                      child: Icon(
                                                          favoriteState
                                                                  .isFavorite(
                                                                      house.id)
                                                              ? IconsaxBold
                                                                  .heart
                                                              : IconsaxOutline
                                                                  .heart,
                                                          color: favoriteState
                                                                  .isFavorite(
                                                                      house.id)
                                                              ? Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .error
                                                              : Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .shadow,
                                                          size: 20),
                                                    ),
                                                  ),
                                                ])),
                                      ]),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\$${NumberFormat('#,##0').format(house.price)}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          house.location,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .shadow
                                                  .withOpacity(0.6)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Wrap(
                                      spacing:
                                          8.0, // Horizontal spacing between items
                                      runSpacing:
                                          8.0, // Vertical spacing between rows
                                      children: [
                                        DetailTag(
                                          detail:
                                              "${NumberFormat('#,##0').format(house.landSize)}m²",
                                          icon: Icons.expand_sharp,
                                        ),
                                        DetailTag(
                                          detail: house.bedroom.toString(),
                                          icon: Icons.bed_outlined,
                                        ),
                                        DetailTag(
                                          detail: house.bathroom.toString(),
                                          icon: Icons.bathtub_outlined,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Halo ${nameState.name}👋🏼",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Plan Your Adventure and Explore Every Corner of the World",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.6),
                              ),
                              softWrap: true,
                              textWidthBasis: TextWidthBasis.parent,
                            ),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: housesList.length,
                  itemBuilder: (context, index) {
                    final House house = housesList[index];
                    return GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          // height: 275,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .shadow
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SizedBox(
                                  height: 185,
                                  width: double.infinity,
                                  child: Stack(children: [
                                    Image.network(
                                      house.imageUrls[0],
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                    ),
                                    Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  favoriteState
                                                          .isFavorite(house.id)
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
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .inversePrimary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200)),
                                                  child: Icon(
                                                      favoriteState.isFavorite(
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
                                                      size: 20),
                                                ),
                                              ),
                                            ])),
                                  ]),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\$${NumberFormat('#,##0').format(house.price)}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        house.location,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .shadow
                                                .withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(children: [
                                    DetailTag(
                                        detail:
                                            "${NumberFormat('#,##0').format(house.landSize)}m²",
                                        icon: Icons.expand_sharp),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    DetailTag(
                                        detail: house.bedroom.toString(),
                                        icon: Icons.bed_outlined),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    DetailTag(
                                        detail: house.bathroom.toString(),
                                        icon: Icons.bathtub_outlined),
                                  ])
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: house);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                )
              ],
            ),
          );
        }
      }),

      // body: Center(
      //   child: Text("HOME"),
      // ),
    ));
  }
}

class DetailTag extends StatelessWidget {
  const DetailTag({
    super.key,
    required this.detail,
    required this.icon,
  });

  final String detail;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.6),
              size: 16),
          const SizedBox(
            width: 2,
          ),
          Text(
            detail,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.shadow),
          )
        ],
      ),
    );
  }
}
