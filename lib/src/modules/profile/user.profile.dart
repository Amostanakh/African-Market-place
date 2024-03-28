import 'package:afyef/controllers/authcontoller.dart';
import 'package:afyef/src/common.dart';
import 'package:afyef/src/modules/edit.details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


class UserProfile extends GetView<AuthenticationController> {
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
                        decoration: const BoxDecoration(                          
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
                            image: const DecorationImage(
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
                      child: const Row(
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
                    const SizedBox(height: 12.0,),
                    Container(
                      child: const Text('Owner of Acrosoft', style: TextStyle(fontSize: 18.0),)
                    ),
                    const SizedBox(height: 10.0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.collections,color:orange,), onPressed: () {  },
                              ),
                              const Text('300 Connections',style: TextStyle(
                                color: Colors.black
                              ),)
                            ],
                          ),
                        
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.more_vert,color: Colors.black),
                                onPressed: (){
                                  _showMoreOption(cx);
                                },
                              ),
                              const Text('More',style: TextStyle(
                                color: Colors.black
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: const Column(
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
              padding: const EdgeInsets.all(10.0),
              child: 
             Row(children: <Widget>[
              Icon(Icons.feedback,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              GestureDetector(
                onTap: (){
                  Get.to( EditDetailsPage());
                },
                child: Text('Edit Profile',
                style: TextStyle(
                  fontSize: 18.0
                ),),
              )
            ],),),


Container(
              padding: const EdgeInsets.all(10.0),
              child: 
             Row(children: <Widget>[
              Icon(Icons.block,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              GestureDetector(
                onTap: (){
                  controller.signOut();
                },
                child: Text('Logout',
                style: TextStyle(
                  fontSize: 18.0
                ),),
              )
            ],),),



            Container(
              padding: const EdgeInsets.all(10.0),
              child: 
            const Row(children: <Widget>[
              Icon(Icons.link,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Share Profile',
              style: TextStyle(
                fontSize: 18.0
              ),)
            ],),),



            Container(
              padding: const EdgeInsets.all(10.0),
              child: 
            const Row(children: <Widget>[
              Icon(Icons.search,
              color: Colors.black,),
              SizedBox(width: 10.0,),
              Text('Total connections',
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