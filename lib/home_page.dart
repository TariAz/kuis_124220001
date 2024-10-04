import 'package:flutter/material.dart';
import 'package:kuis_mobile/daftar_barang_dummy.dart';

class Page2 extends StatelessWidget {
  final String username;
  Page2({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Log Out")),
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: const Color.fromARGB(255, 191, 154, 198),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "$username!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
                "Butuh Bantuan? Klik untuk pergi ke halaman Panduan dan Dukungan"),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  itemCount: supermarketItemList.length,
                  itemBuilder: (context, index) {
                    final SupermarketItem place = supermarketItemList[index];
                    return Card(
                      child: Column(
                        children: [
                          Image.network(place.imageUrls[0]),
                          Text(place.name),
                          Text(place.price),
                          // Text(place.stock),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
