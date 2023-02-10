import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thence/models/treeModel.dart';

class Details extends StatefulWidget {
  final Data data;
  const Details({Key? key,required this.data}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  int selectedSize=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Color.fromRGBO(244, 244, 244, 1),
        elevation: 0,
        iconTheme: IconThemeData(
        color: Colors.black, //change your color here
        ),),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                   Container(
                      height: MediaQuery.of(context).size.height*0.35,
                      decoration: BoxDecoration(
                          color:  Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight:Radius.circular(24)
                          )
                      )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.35,
                    child: Image.network(widget.data.imageUrl!,
                      fit: BoxFit.cover,),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
              child: Row(
                children: [
                  Text(widget.data.name!,
                    style: TextStyle(
                        color:  Colors.black,
                        fontFamily: 'MontBold',
                        fontSize: 28
                    ),),
                  Spacer(),
                  Text(widget.data!.price! +' '+ widget.data!.priceUnit! ,
                    style: TextStyle(
                        color:  Colors.black,
                        fontFamily: 'MontMedium',
                        fontSize: 17
                    ),),
                ],
              ),
            ),
            
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 5, 0),
                  child: Icon(Icons.star,
                    color: Color.fromRGBO(255,187,86, 1),
                    size: 18,),
                ),
                Text(widget.data!.rating!,
                  style: TextStyle(
                      color:  Color.fromRGBO(255,187,86, 1),
                      fontFamily: 'MontBold',
                      fontSize: 15
                  ),)
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
              child: Text('Choose size',
                style: TextStyle(
                    color:  Colors.black,
                    fontFamily: 'MontBold',
                    fontSize: 15
                ),),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.data.availableSize!.length,
                    itemBuilder: (context,index){
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedSize=widget.data.availableSize![index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color:widget.data.availableSize![index]==selectedSize?Color.fromRGBO(176, 136, 136, 1)
                                      : Color.fromRGBO(244, 244, 244, 4),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                child: Text(widget.data.availableSize![index].toString()+' cm',
                                  style: TextStyle(
                                      color: widget.data.availableSize![index]==selectedSize?Colors.white
                                          :Colors.grey,
                                      fontSize: 14,
                                      fontFamily: 'MontMedium'
                                  ),),
                              ),

                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(28, 14, 28, 0),
              child: Text('Description',
                style: TextStyle(
                    color:  Colors.black,
                    fontFamily: 'MontBold',
                    fontSize: 15
                ),),
            ),
            Padding(padding: EdgeInsets.fromLTRB(28, 10, 28, 0),
            child: Text(widget.data.description!,
              style: TextStyle(
                  color:  Colors.grey,
                  fontFamily: 'MontRegular',
                  fontSize: 14
              ),),),

            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(176, 136, 136, 1),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(56, 14, 56, 14),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'MontMedium'
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
