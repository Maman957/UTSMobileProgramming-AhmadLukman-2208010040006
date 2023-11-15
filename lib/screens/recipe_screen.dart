import 'package:flutter/material.dart';
import 'package:resep_makanan_app/models/resep_models.dart';
import 'package:resep_makanan_app/provinder/favorite_provinder.dart';
import 'package:resep_makanan_app/screens/detail_screen.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<ResepModel> dataResep = [
    ResepModel(
      namaMakanan: "Bubur Ayam",
      image: "assets/ba.png",
      deskripsi:
          "Bubur ayam adalah salah satu jenis makanan dari Indonesia. Bubur nasi adalah beras yang dimasak dengan air yang banyak sehingga memiliki tekstur yang lembut dan berair. Bubur biasanya disajikan dalam suhu panas atau hangat. Bubur ayam disajikan dengan irisan daging ayam dengan beberapa bumbu, seperti kecap asin dan kecap manis, merica, garam, dan terkadang diberi kaldu ayam. Bubur dilengkapi dengan taburan daun bawang cincang, bawang goreng, seledri, tongcai (sayur asin), kacang tanah goreng, cakwe, dan kerupuk. Bubur ayam cocok bagi mereka yang kurang menyukai masakan Indonesia yang pedas, karena bubur umumnya tidak pedas; sambal atau saus cabai disajikan secara terpisah.",
    ),
    ResepModel(
      namaMakanan: "Nasi Goreng",
      image: "assets/nasi goreng.png",
      deskripsi:
          "Nasi goreng merupakan sajian nasi yang digoreng dalam sebuah wajan atau penggorengan yang menghasilkan cita rasa berbeda karena dicampur dengan bumbu-bumbu seperti garam, bawang putih, bawang merah, merica, rempah-rempah tertentu dan kecap manis. Selain itu, ditambahkan bahan-bahan pelengkap seperti telur, sayur-sayuran, makanan laut, atau daging. Makanan tersebut sering kali disantap sendiri atau disertai dengan hidangan lainnya. Nasi goreng adalah komponen populer dari masakan Asia Timur, Tenggara dan Selatan pada wilayah tertentu. Sebagai hidangan buatan rumah, nasi goreng biasanya dibuat dengan bahan-bahan yang tersisa dari hidangan lainnya, yang berujung pada ragam yang tak terbatas. ",
    ),
    ResepModel(
      namaMakanan: "Lontong Sayur",
      image: "assets/lontong sayur.png",
      deskripsi:
          "Lontong gulai atau lontong sayur adalah makanan Indonesia yang berasal dari Minangkabau, Sumatera Barat. Lontong ini identik dengan kuah santan yang memiliki bumbu kental khas masakan Minang. Kuah santan yang kaya bumbu rempah sudah dikenal sebagai salah satu cara memasak ala masakan Minang.[1] Beberapa lontong gulai ini antara lain; lontong gulai paku, lontong gulai tauco, lontong gulai cubadak. Makanan ini disajikan dengan telur bulat, mie goreng dan yang khas adalah lontong ini disajikan dengan kerupuk merah.Bahkan sekarang bersama lontong sayur juga di tambahkan tunjang.",
    ),
    ResepModel(
      namaMakanan: "Oatmeal",
      image: "assets/oatmeal.png",
      deskripsi:
          "Oatmeal merupakan makanan yang terdiri dari gandum, air, dan susu sapi atau susu nabati. Oat jadi satu bahan utama dari oatmeal, dimana ini kaya akan serat dan nutrisi yang menyehatkan tubuh.",
    ),
    ResepModel(
      namaMakanan: "Roti Panggang",
      image: "assets/roti.png",
      deskripsi:
          "Roti panggang merujuk kepada kepingan roti yang dipanggang dengan proses radiasi termal sehingga roti menjadi lebih kecoklatan dan garing. Warna kecoklatan adalah hasil dari reaksi Maillard mengubah rasa roti dan membuatnya lebih kering sehingga lebih mudah untuk menaburkan topping di atasnya.",
    ),
    ResepModel(
      namaMakanan: "Telur Mata Sapi",
      image: "assets/telur.png",
      deskripsi:
          "Telur mata sapi atau telur ceplok adalah hidangan dari telur ayam yang digoreng dengan minyak goreng panas tanpa diaduk terlebih dahulu.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Recipe"), centerTitle: true),
      body: Center(
        child: GridView.builder(
          itemCount: dataResep.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1),
          itemBuilder: (context, index) {
            final data = dataResep[index];
            final provider = FavoriteProvider.of(context);
            return InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => DetailPage(
                    namaGame: data.namaMakanan,
                    image: data.image,
                    deskripsi: data.deskripsi,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Expanded(
                      child: Image.asset(data.image),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          data.namaMakanan,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.toggleFavorite(data.namaMakanan);
                          },
                          icon: provider.isExist(data.namaMakanan)
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
