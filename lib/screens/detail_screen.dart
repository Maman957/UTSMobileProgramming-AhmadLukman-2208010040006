// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:resep_makanan_app/provinder/favorite_provinder.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String namaGame;
  String image;
  String deskripsi;
  DetailPage({
    Key? key,
    required this.namaGame,
    required this.image,
    required this.deskripsi,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.namaGame), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(widget.image),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.namaGame,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.toggleFavorite(widget.namaGame);
                    },
                    icon: provider.isExist(widget.namaGame)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.deskripsi,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
