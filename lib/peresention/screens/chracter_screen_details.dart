import 'package:block/constants/colors.dart';
import 'package:block/data/models/chracters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChracterScreenDeatils extends StatelessWidget {
  final Result chracter;

  const ChracterScreenDeatils({super.key, required this.chracter});

  Widget buildSliverAppbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: myColors.myYellow,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          chracter.name!,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        background: Hero(
          tag: chracter.id as Object,
          child: Image.network(
            chracter.image!,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('lib/assets/images/whatsApp.jpg');
            },
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
          SliverToBoxAdapter(
            child: Container(
              color: myColors.myYellow,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow('Gender', chracter.gender ?? 'N/A'),
                  buildInfoRow('Species', chracter.species ?? 'N/A'),
                  buildInfoRow('Status', chracter.status ?? 'N/A'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
