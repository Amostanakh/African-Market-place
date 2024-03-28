import 'package:afyef/src/models/new.chat.dart';
import 'package:afyef/src/modules/chats/chat.dart';
import 'package:afyef/src/modules/profile/user.profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AllChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    int chatsNumber = 20;
    return Scaffold(
      appBar: AppBar(
         title: const Text(
                  'Messages',
                  
                ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text("All Chats  ($chatsNumber)", style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
              ),
            ],
          ),

          //  Container(
          //             height: 100,
          //             child: ListView.builder(
          //                 itemCount: allChats.length,
          //                 shrinkWrap: true,
          //                 scrollDirection: Axis.horizontal,
          //                 itemBuilder: (context, index) {
          //                   final allChat = allChats[index];
          //                   return Container(
          //                    padding: EdgeInsets.all(10),
          //                     child: CircleAvatar(
          //                     radius: 28,
          //                     backgroundImage: AssetImage(allChat.avatar),
          //                                             ),
          //                   );
          //                 }),
          //           ),
//           Container(
//             margin: EdgeInsets.all(5),
//             padding:   EdgeInsets.all(5),
//             child: Padding(
//   padding: EdgeInsets.only(top: 16,left: 16,right: 16),
//   child: TextField(
//     decoration: InputDecoration(
//       hintText: "Search...",
//       hintStyle: TextStyle(color: Colors.grey.shade600),
//       prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
//       filled: true,
//       fillColor: Colors.grey.shade100,
//       contentPadding: EdgeInsets.all(8),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               color: Colors.grey.shade100
//           )
//       ),
//     ),
//   ),
// ),
//           ),
          
          ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: allChats.length,
              itemBuilder: (context, int index) {
                final allChat = allChats[index];
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(UserProfile());
                          },
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(allChat.avatar),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(Chat());
                           
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                allChat.sender.name,
                             
                              ),
                              Text(
                                allChat.text,
                                
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            allChat.unreadCount == 0
                                ? const Icon(
                                    Icons.done_all,
                                    color: Colors.red,
                                  )
                                : const CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.amber, 
                                      
                                ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              allChat.time,
                              
                            )
                            
                          ],
                        ),
                        
                      ],
                    ));
                   
              }),
             
        ],
      ),
    );
  }
}