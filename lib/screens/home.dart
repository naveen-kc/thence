import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thence/screens/details.dart';

import '../blocs/tree_bloc.dart';
import '../blocs/tree_event.dart';
import '../blocs/tree_state.dart';
import '../models/treeModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int pageIndex = 0;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        resizeToAvoidBottomInset: false,
        drawerEnableOpenDragGesture: true,
        bottomNavigationBar: buildMyNavBar(context),
        body: pages[pageIndex],

    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(
          color: Colors.grey,
          width: 0.2
        ))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: const Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 25,
                )
              ),

          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color:Colors.grey,
                size:25,
              )
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: const Icon(
                Icons.favorite_border,
                color:Colors.grey,
                size: 25,
              )
          ),

          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: const Icon(
                Icons.person_outline,
                color:Colors.grey,
                size: 25,
              )
          ),
        ],
      ),
    );
  }
}



class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => Page1State();
}

class Page1State extends State<Page1> {

  final TreesBloc _treesBloc=TreesBloc();
  List categories =['All','Succulents','In pots','Dried flowers'];
  String selectedCat='Succulents';


  @override
  void initState(){
    super.initState();
    _treesBloc.add(GetTreeList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _list()),
    );
  }



  Widget _list() {
    return BlocProvider(
      create: (_)=> _treesBloc,
      child: BlocListener<TreesBloc,TreesState>(
        listener: (context,state){
          if(state is TreeListError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
          }

        },
        child: BlocBuilder<TreesBloc,TreesState>(
          builder: (context,state){
            if(state is TreeInitial){
              return _loading();
            }else if(state is TreeLoading){
              return _loading();
            }else if(state is TreeLoaded){
              return _trees(context,state.trees!);
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _loading()=> Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(28),
          child: Row(
            children: [
              const Text('All Plants',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'MontMedium',
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {  },
                icon: Icon(Icons.search,
                  color: Colors.black,),
              )

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28,right: 28,bottom: 28),
          child: Text('Houseplants',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'MontBold',
                fontSize: 28
            ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context,index){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(244, 244, 244, 4),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Text('               ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontFamily: 'MontMedium'
                            ),),
                        ),

                      ),
                    ),
                  );
                }),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 8, 0),
              child: Container(
                height: 20,
                width: 100,
                
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5)
                ),
              )
            ),

          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(left: 28,right: 28,top: 28),
                child: Container(

                  child: Row(
                    children: [
                      Container(
                        height:100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 130,

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 20,
                              width: 80,

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 20,
                              width: 80,

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            )
                          ],
                        ),
                      ),



                    ],
                  ),

                ),
              );
            }, ),
        ),

      ],
    )
  );

  Widget _trees(BuildContext context,TreeModel model){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(28),
          child: Row(
            children: [
              const Text('All Plants',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'MontMedium',
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {  },
                icon: Icon(Icons.search,
                  size: 30  ,
                  color: Colors.black,),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28,right: 28,bottom: 28),
          child: Text('Houseplants',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'MontBold',
                fontSize: 28
            ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedCat=categories[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:categories[index]==selectedCat?Color.fromRGBO(176, 136, 136, 1)
                                  : Color.fromRGBO(244, 244, 244, 4),
                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Text(categories[index],
                              style: TextStyle(
                                  color: categories[index]==selectedCat?Colors.white
                                      :Colors.grey,
                                  fontSize: 13,
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
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 8, 0),
              child: Text('By popularity',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'MontRegular'
                ),),
            ),
            Icon(Icons.arrow_downward_outlined,
              color:Colors.grey,
              size: 15,)
          ],
        ),
//model.data![index].name!,
        Expanded(
          child: ListView.separated(
            itemCount: model.data!.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(left: 28,right: 28,top:7,bottom: 14),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Details(data:model.data![index])));
                   
                  },
                  child: Container(
                    height: 100,
                    child: Row(
                      children: [
                        Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Container(
                                  height: 90,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color:  Color.fromRGBO(255, 243, 233, 1),
                                      borderRadius: BorderRadius.circular(10)
                                  )),
                            ),
                            SizedBox(
                              width: 120,
                              height: 100,

                              child: Image.network(model.data![index].imageUrl!,
                                fit: BoxFit.fitWidth,),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:35,left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(model.data![index].name!,
                                    style: TextStyle(
                                        color:  Colors.black,
                                        fontFamily: 'MontBold',
                                        fontSize: 15
                                    ),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: Icon(Icons.star,
                                      color: Color.fromRGBO(255,187,86, 1),
                                      size: 15,),
                                  ),
                                  Text(model.data![index].rating!,
                                    style: TextStyle(
                                        color:  Color.fromRGBO(255,187,86, 1),
                                        fontFamily: 'MontBold',
                                        fontSize: 12
                                    ),)
                                ],
                              ),
                              Text(model.data![index].displaySize.toString()! +' '+ model.data![index].unit! ,
                                style: TextStyle(
                                    color:  Colors.grey,
                                    fontFamily: 'MontRegular',
                                    fontSize: 15
                                ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text(model.data![index].price! +' '+ model.data![index].priceUnit! ,
                                style: TextStyle(
                                    color:  Colors.black,
                                    fontFamily: 'MontMedium',
                                    fontSize: 15
                                ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            if ((index + 1) % 2 == 0) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(28, 34, 28, 14),
                child: Stack(
                  children: [
                    SizedBox(child: Image.asset("assets/images/ad.png")),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start  ,
                            children: [
                              Text('Free shipping',
                                style: TextStyle(
                                    color:  Colors.black,
                                    fontFamily: 'MontBold',
                                    fontSize: 15
                                ),),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text('on orders ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'MontRegular',
                                        fontSize: 12
                                    ),),
                                  Container(
                                      decoration: BoxDecoration(
                                          color:  Color.fromRGBO(255,187,86, 1),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                        child: Text('over \$100',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'MontRegular',
                                                fontSize: 12
                                            )),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                              height: 90,
                              child: Image.asset("assets/images/img.png")),

                        ],
                      ),
                    )
                  ],
                ),

              );
            } else {
              return Container();
            }
          },),
        ),

      ],
    );

  }


}





class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => Page2State();
}

class Page2State extends State<Page2> {

  final TreesBloc _treesBloc = TreesBloc();
  List categories = ['All', 'Succulents', 'In pots', 'Dried flowers'];

  @override
  void initState() {
    super.initState();
    _treesBloc.add(GetTreeList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Container(
        child: Center(
          child: Text('No Implementation'),
        ),
      )),
    );
  }
}


class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => Page3State();
}

class Page3State extends State<Page3> {

  final TreesBloc _treesBloc = TreesBloc();
  List categories = ['All', 'Succulents', 'In pots', 'Dried flowers'];

  @override
  void initState() {
    super.initState();
    _treesBloc.add(GetTreeList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Container(
        child: Center(
          child: Text('No Implementation'),
        ),
      )),
    );
  }
}


class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => Page4State();
}

class Page4State extends State<Page4> {

  final TreesBloc _treesBloc = TreesBloc();
  List categories = ['All', 'Succulents', 'In pots', 'Dried flowers'];

  @override
  void initState() {
    super.initState();
    _treesBloc.add(GetTreeList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Container(
        child: Center(
          child: Text('No Implementation'),
        ),
      )),
    );
  }
}