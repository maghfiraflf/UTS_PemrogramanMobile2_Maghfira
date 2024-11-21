// ignore: unused_import
import 'package:beauty/LoginScreen.dart';

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String username;

  const Homepage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 100, 184, 223),
          title: Text(
            'Hello, $username!',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.spa),
                text: "Skincare",
              ),
              Tab(
                icon: Icon(Icons.brush),
                text: "Makeup",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Log Out",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            HomeTab(),
            SkincareTab(),
            MakeupTab(),
            LogOutTab(),
          ],
        ),
      ),
    );
  }
}



// Each tab content as a separate widget

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bestSellers = [
      {"name": "Wardah UV shield Acne Calming Sunscreen Moisturizer SPF 35 PA+++", "info": "Sunscreen yang diformulasikan khusus jntuk kulit berminyak dan Acne-Prone skin. Sunscreen Moisturizer SPF 35 PA+++ nyaman dan ringan digunakan setiap hari, diformulasikan khusus untuk kulit wajah berminyak dan rentan berjerawat."},
      {"name": "Wardah Matte Lip Cream", "info": "Wardah Matte Lip Cream merupakan Inovasi Lushlip Liquid dengan tekstur cream lembut untuk aplikasi sekali oles dengan warna merata. Lip Cream dengan kandungan Colorbinding Pigments di dalamnya memberikan matte finish intens yang tahan lama. Variasi warna mewah sempurna dapat bertahan lama di bibir sepanjang hari."},
      {"name": "Wardah UV Shield Essential Sunscreen Gel SPF 35 PA+++ 40 ml", "info": "Wardah UV Shield Essential Sunscreen Gel, Sunscreen wajah untuk perlindungan aktivitas sehari-hari di luar rumah. Penggunaan suncreen UV Shield membantu mengurangi kulit kusam dari paparan blue light, mencegah penuaan dini, menghindari munculnya bintik hitam di wajah, dan melindungi resiko kanker kulit. Dilengkapi dengan SPF 35 PA +++"},
      {"name": "Wardah Moist Dew Tint 3 g - Liptint yang mengandung Oatmilk dan Pentavitin", "info": "Wardah Moist Dew Tint adalah liptint yang dirancang untuk dapat memberikan tampilan bibir lembab glossy dengan hasil warna intens dan tint coverage tinggi yang tahan seharian, namun tetap terasa ringan di bibir. Mengandung Oatmilk dan Pentavitin yang dapat memberikan nutrisi dan melembabkan bibir hingga 24 jam seperti menggunakan lip oil. Dilengkapi dengan aplikator (flat-angled hi-density applicator) yang dapat memberikan coverage yang merata dan presisi pada bibir."},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Best Sellers Products",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 100, 184, 223),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: bestSellers.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final product = bestSellers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 100, 184, 223),
                      child: Text(
                        product["name"]![0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      product["name"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 100, 184, 223)),
                    onTap: () {
                      _showProductDetails(context, product["name"]!, product["info"]!);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, String productName, String productInfo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          productName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 100, 184, 223),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              productInfo,  
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Color.fromARGB(255, 100, 184, 223)),
            ),
          ),
        ],
      ),
    );
  }
}

class SkincareTab extends StatelessWidget {
  const SkincareTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> skincareProducts = [
      {"name": "Wardah UV shield Acne Calming Sunscreen Moisturizer SPF 35 PA+++", "info": "Sunscreen yang diformulasikan khusus untuk kulit berminyak dan rentan jerawat."},
      {"name": "Wardah UV Shield Essential Sunscreen Gel SPF 35 PA+++ 40 ml", "info": "Sunscreen wajah untuk perlindungan aktivitas sehari-hari di luar rumah."},
      {"name": "Wardah Gel Moisturizer Series 30 g - Trenaxamic Alpha Arbutin", "info": "Gel moisturizer dengan formula pencerah yang cocok untuk semua jenis kulit."},
      {"name": "Wardah Lightening Niacinamide Face Toner 125 ml", "info": "Toner dengan kandungan Niacinamide yang membantu mencerahkan kulit."},
      {"name": "Wardah Serum Vitamin C 10% + Ferulic Acid Radiant Charge Serum 20 ml", "info": "Serum vitamin C untuk memberikan kelembapan dan mencerahkan kulit."},
      {"name": "Wardah Acnederm Acne Care Micellar Water", "info": "Micellar water yang membersihkan wajah dan mengatasi masalah kulit berjerawat."},
      {"name": "Wardah Crystal Secret exfoliating Toner with Natural AHA+PHA 125 ml", "info": "Toner dengan AHA dan PHA untuk eksfoliasi lembut dan mencerahkan kulit."},
      {"name": "Wardah Hydra Rose 14X Hyaluronic Pentavitin Deep Barrier Repair Serum 30 ml", "info": "Serum dengan kandungan Hyaluronic Acid dan Pentavitin untuk melembapkan kulit."},
      {"name": "Wardah 5% Azeclair + Salicylic Acid Acnederm Acne Care Serum 15 ml", "info": "Serum acne care untuk mengatasi jerawat dan mencegah kemunculan jerawat baru."},
      {"name": "Wardah Nature Daily Multifunction Gel", "info": "Gel multifungsi yang memberikan kelembapan dan melindungi kulit."},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Skincare Products",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 100, 184, 223),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: skincareProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final product = skincareProducts[index];
                return GestureDetector(
                  onTap: () {
                    _showProductDetails(context, product["name"]!, product["info"]!);
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                product["name"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, String productName, String productInfo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          productName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 100, 184, 223),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              productInfo,  
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Color.fromARGB(255, 100, 184, 223)),
            ),
          ),
        ],
      ),
    );
  }
}

class MakeupTab extends StatelessWidget {
  const MakeupTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> makeupProducts = [
      {"name": "Wardah Glasting Liquid Lip Hi-Pigmented Glass Color", "info": "Lipstick dengan hasil akhir glossy dan pigmen warna yang intens."},
      {"name": "Wardah Matte Lip Cream", "info": "Lip cream dengan hasil matte yang tahan lama."},
      {"name": "Wardah Lightening Niacinamide Face Toner 125 ml", "info": "Toner dengan kandungan Niacinamide yang membantu mencerahkan kulit."},
      {"name": "Wardah Moist Dew Tint 3 g - Liptint yang mengandung Oatmilk dan Pentavitin", "info": "Liptint dengan kandungan oatmilk dan pentavitin untuk kelembapan."},
      {"name": "Wardah Colorfit Cream Blush", "info": "Cream blush dengan warna pigmen yang tahan lama dan mudah diaplikasikan."},
      {"name": "Wardah Hydrabalm Lip Care 4 g", "info": "Lip balm dengan formulasi lembut untuk melembapkan dan merawat bibir."},
      {"name": "Wardah EyeXpert The Volume Expert Mascara Waterproof", "info": "Maskara waterproof dengan hasil volume maksimal dan tahan lama."},
      {"name": "Wardah Lightening Liquid Foundation 25 ml", "info": "Foundation cair yang memberikan tampilan kulit cerah dan flawless."},
      {"name": "Wardah EyeXpert Eyebrow Kit", "info": "Kit alis dengan dua warna pilihan untuk tampilan alis sempurna."},
      {"name": "Wardah Colorfit Mattifying Powder SPF 30 PA++", "info": "Bedak padat dengan formula mattifying yang melindungi kulit dari sinar UV."},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Makeup Products",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 100, 184, 223),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: makeupProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final product = makeupProducts[index];
                return GestureDetector(
                  onTap: () {
                    _showProductDetails(context, product["name"]!, product["info"]!);
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                product["name"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, String productName, String productInfo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          productName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 100, 184, 223),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              productInfo,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Color.fromARGB(255, 100, 184, 223)),
            ),
          ),
        ],
      ),
    );
  }
}

class LogOutTab extends StatelessWidget {
  const LogOutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.settings,
            size: 80,
            color: Color.fromARGB(255, 100, 184, 223),
          ),
          const SizedBox(height: 20),
          Text(
            "See you!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade700,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman login atau keluar dari aplikasi
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 25, 70, 90),  
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
