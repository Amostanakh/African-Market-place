import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/authcontoller.dart';

// ignore: must_be_immutable
class EventsDetailsPage extends GetView<AuthenticationController> {


  bool isBookSelected = false;


  EventsDetailsPage({super.key});

  // purchasedButton() async {
  //   DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(kUser.value!.uid)
  //       .get();
  //   Map<String, dynamic>? data = db.data();
  //   List books = data?['books'] ?? [];

  //   var bks = books.where((e) => e == book.id).toList();
  //   if (bks.isEmpty) {
  //     books.add(book.id);
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(kUser.value!.uid)
  //         .update({'books': books});
  //     Get.snackbar("Alert", 'Was succesfully added to Purchased Books');
  //   } else {
  //     return Get.snackbar("Alert", 'Book is already Added');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.only(left: 12, right: 12),
        height: 49,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // Get.to(Ecocash())
              
                //purchasedButton();
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7.0,
                    )
                  ],
                  color: Colors.amber.shade800,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Purchase Ticket',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.library_add, color: Colors.white),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7.0,
                  )
                ],
                color: Colors.amber.shade800,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: GestureDetector(
                onTap: () async {
                  // Share.share(
                  //     "Get Prophet W. Magaya Latest Books on:\n http://get/app/on/playstore$book['book']");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox(
                      // width: 65,
                      child: Text(
                        'Share Event',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.share, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height * 0.7,
              flexibleSpace: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                          decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/p3.jpg'),
                            fit: BoxFit.cover),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    height: 300,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Title: Youth Empower',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 20),
                            //   child: LikeButton(book: book),
                            // )
                          ],
                        ),
                        Text(
                          'Members: With all african Members',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Price: 10',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.amber.shade800,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'More About: African Event',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // void favouritesButton() async {
  //   dynamic savedbooks = await favStorage.read("favBooks");

  //   if (savedbooks == null) {
  //     String imgUrl = book['img'];
  //     Map<String, dynamic> dataToadd = {
  //       'book': imgUrl,
  //       'booklink': book['booklink']
  //     };
   

  //     await favStorage.write("favBooks", [dataToadd]);
  //   } else {
  //     List favB =
  //         savedbooks.where((e) => e['booklink'] == book['booklink']).toList();
  //     if (favB.isEmpty) {
  //       List<Map<String, dynamic>> bestBooks = [];
  //       for (var fbook in bestBooks) {
  //         bestBooks.add(fbook);
  //       }
  //       bestBooks.add(
  //         {
  //           'book': book['img'],
  //           'booklink': book['booklink'],
  //         },
  //       );
        

  //       await favStorage.write("favBooks", bestBooks);
  //     }
  //   }
    
  // }
}