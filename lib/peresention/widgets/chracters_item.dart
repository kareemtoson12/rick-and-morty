import 'package:block/constants/colors.dart';
import 'package:block/constants/strings.dart';

import 'package:block/data/models/chracters.dart';

import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  final Result res;
  const CharactersItem({
    super.key,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        chractersScreenDetails,
        arguments: res,
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: myColors.mywhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${res.name}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          child: Hero(
            tag: res.id as Object,
            child: Container(
              color: myColors.mygrey,
              child: res.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'lib/assets/images/Loading.gif',
                      image: res.image!,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('lib/assets/images/whatsApp.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
