import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pokodex/models/pokemon_model.dart';
import 'package:pokodex/utils/globals.dart';

PreferredSizeWidget myappBar2(type) {
  bool? liked;

  return AppBar(
    // actions: [
    //   // IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
    //   CircleAvatar(
    //     backgroundColor: Colors.grey.shade100,
    //     child: Center(
    //       child: LikeButton(
    //         circleColor: const CircleColor(end: Colors.red, start: Colors.blue),
    //         onTap: (isSelected) async {
    //           if (isSelected == true) {
    //           } else {}
    //           isSelected = !isSelected;
    //           liked = isSelected;
    //           return liked;
    //         },
    //       ),
    //     ),
    //   )
    // ],
    foregroundColor: Colors.white,
    backgroundColor: type == 'Type.GRASS'
        ? Colors.green
        : type == 'Type.FIRE'
            ? secondColor
            : type == 'Type.WATER'
                ? Colors.blue
                : type == 'Type.NORMAL'
                    ? bakColor
                    : type == 'Type.ELECTRIC'
                        ? mainColor1
                        : type == 'Type.GROUND'
                            ? Colors.brown
                            : Colors.grey,
    elevation: 0,
    shadowColor: Colors.transparent,
  );
}

Widget backgroundColor(type, size) {
  return Container(
    color: type == 'Type.GRASS'
        ? Colors.green
        : type == 'Type.FIRE'
            ? secondColor
            : type == 'Type.WATER'
                ? Colors.blue
                : type == 'Type.NORMAL'
                    ? bakColor
                    : type == 'Type.ELECTRIC'
                        ? mainColor1
                        : type == 'Type.GROUND'
                            ? Colors.brown
                            : Colors.grey,
    height: size.height * 0.5,
    width: size.width,
  );
}

Widget backLogo(size) {
  return Positioned(
    top: size.height * 0.07,
    left: size.width * 0.55,
    child: Container(
      height: size.height * 0.4,
      width: size.width * 0.6,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/pokeball.png'),
        opacity: 0.4,
      )),
      //  child: Image.asset('assets/pokeball.png')
    ),
  );
}

Widget whiteMenu(size) {
  return Positioned(
    top: size.height * 0.4,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: const Color(0xfffafafa),
        height: size.height * 0.5,
        width: size.width,
      ),
    ),
  );
}

Widget pokemonImage(size, PokemonElement pokemon) {
  return Positioned(
    top: size.height * 0.115,
    left: size.width * 0.25,
    child: SizedBox(
      // color: Colors.red,
      height: size.height * 0.35,
      width: size.width * 0.5,
      child: FittedBox(
        fit: BoxFit.cover,
        child: CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 50),
          fit: BoxFit.cover,
          imageUrl: pokemon.img,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}

Widget titleName(size, PokemonElement pokemon) {
  return SizedBox(
    // color: Colors.red,
    height: size.height * 0.15,
    width: size.width,
    child: Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.07,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(pokemon.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  )),
              const Spacer(),
              Expanded(
                child: Text('#${pokemon.num}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: pokemon.type.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white24,
                        height: size.height * 0.02,
                        width: size.width * 0.19,
                        child: Center(
                          child: Text(
                            pokemon.type[index]
                                .toString()
                                .characters
                                .toString()
                                .substring(5),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ),
  );
}
