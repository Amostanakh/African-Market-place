import 'package:afyef/src/common.dart';
import 'package:afyef/src/modules/chats/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class FbCloneProfileStful extends StatefulWidget {
  _FbCloneProfileState createState() => _FbCloneProfileState();
}

class _FbCloneProfileState extends State<FbCloneProfileStful> {
  Widget build(BuildContext cx) {
    return  Scaffold(
        appBar: null,
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    clipBehavior: Clip.none, alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Expanded(child: 
                        Container(
                        height: 200.0,
                        decoration: BoxDecoration(                          
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/p1.jpg')
                          )
                        ),
                      ),)
                      ],
                      ),
                      Positioned(
                        top: 100.0,
                        child: Container(
                          height: 190.0,
                          width: 190.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                             image: AssetImage('images/p1.jpg'),
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 6.0
                            )
                          ),
                        ),
                      ),
                    ],)                    
                  ,
                ),


                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 130.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text('John Doe', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0
                            ),),
                            SizedBox(width: 5.0,),
                        Icon(Icons.check_circle, color: Colors.blueAccent,)                      
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0,),
                    Container(
                      child: Text('Owner of Acrosoft', style: TextStyle(fontSize: 18.0),)
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.collections,color:orange,), onPressed: () {  },
                              ),
                              Text('Connected',style: TextStyle(
                                color: Colors.black
                              ),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.message,color: orange), onPressed: () { Get.to(Chat()); },
                              ),
                              Text('Message',style: TextStyle(
                                color: Colors.black
                              ),)
                            ],
                          ),
                          // Column(
                          //   children: <Widget>[
                          //     IconButton(
                          //       icon: Icon(Icons.more_vert,color: Colors.black),
                          //       onPressed: (){
                          //         _showMoreOption(cx);
                          //       },
                          //     ),
                          //     Text('More',style: TextStyle(
                          //       color: Colors.black
                          //     ),)
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      padding: EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Icon(Icons.work),
                            SizedBox(width: 5.0,),
                            Text('Founder and CEO at',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,),
                            Text('SignBox',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)
                          ],),
                          SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.work),
                            SizedBox(width: 5.0,),
                            Text('Works at',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,),
                            Text('SignBox',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)
                          ],),
                          SizedBox(height: 10.0,),
                          // Row(children: <Widget>[
                          //   Icon(Icons.school),
                          //   SizedBox(width: 5.0,),
                          //   Text('Studied Computer Science at',style: TextStyle(
                          //     fontSize: 18.0
                          //   ),),
                          //   SizedBox(width: 5.0,),                            
                          // ],),
                          // Wrap(
                          //   children: <Widget>[
                          //     Text('Abc University',style: TextStyle(
                          //   fontSize: 18.0,
                          //     fontWeight: FontWeight.bold
                          //   ),)
                          //   ],
                          // ),

SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.home),
                            SizedBox(width: 5.0,),
                            Text('Lives in',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,),    
                            Text('Ghana',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)                        
                          ],),


                          SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.location_on),
                            SizedBox(width: 5.0,),
                            Text('From',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,), 
                            Text('Zambia',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)                           
                          ],),



                          SizedBox(height: 10.0,),
                          Row(children: <Widget>[
                            Icon(Icons.list),
                            SizedBox(width: 5.0,),
                            Text('Connected To',style: TextStyle(
                              fontSize: 18.0
                            ),),
                            SizedBox(width: 5.0,), 
                            Text('100K people',style: TextStyle(
                            fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),)                           
                          ],),
                          SizedBox(height: 20.0,),
                        

                          Container(
                            height: 10.0,
                            child: 
                            Divider(
                              color: Colors.grey,                              
                            ),
                          ),
  Row(children: <Widget>[
                            Expanded(
                              child: TextButton(
                                onPressed: (){},
                                child: Text('see more about Mohsin'),
                              ),
                            )
                          ],),
                        // Container(
                        //   alignment: Alignment.topLeft,
                        //   child: Text('Photos',style: TextStyle(
                        //     fontSize: 30.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),)),
                        
          // Container(child: 
          //   Column(
          //     children: <Widget>[
          //       Row(children: <Widget>[
          //         Expanded(
          //           child: Card(
          //             child: 
          //             Image.asset('images/p1.jpg'),
          //           )
          //         ),
          //         Expanded(
          //           child: Card(
          //             child: 
          //           Image.asset('images/p1.jpg'),
          //           )
          //         )
          //       ],),
          //       Row(children: <Widget>[
          //         Expanded(
          //           child: Card(
          //             child: 
          //           Image.asset('images/p1.jpg'),
          //           )
          //         ),
          //         Expanded(
          //           child: Card(
          //             child: 
          //             Image.network('https://nation.com.pk/print_images/large/2014-12-28/truck-art-1419719431-3924.png'),
          //           )
          //         ),
          //         Expanded(
          //           child: Card(
          //             child: 
          //             Image.network('https://nation.com.pk/print_images/large/2014-12-28/truck-art-1419719431-3924.png'),
          //           )
          //         )
          //       ],)
          //     ],
          //   )
          // ,)




                        ],
                      ),
                    )


              ],
            )
          ],
        ),
    );
  
  }



  _showMoreOption(cx) {

     showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.feedback,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Give feedback or report this profile',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),),


Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.block,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Block',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),),



            Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.link,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Copy link to profile',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),),



            Container(
              padding: EdgeInsets.all(10.0),
              child: 
            Row(children: <Widget>[
              Icon(Icons.search,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Search Profile',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),)




           

          ],
        );

      },


     ); 


  }
}