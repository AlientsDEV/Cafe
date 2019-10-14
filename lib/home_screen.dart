import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'food.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  double containerHeight = 0.0;
  bool isInit = true;
  bool isExpanded = false;
  String selectedItem = '';
  Food selectedFood = Food();
  int selectedCounter = 0;
  bool bottomViewTrigger = false;
  List<Food> userFoodCart = List();

  @override
  void didChangeDependencies() {
    if(isInit){
      containerHeight = MediaQuery.of(context).size.height - 100;
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  padding: EdgeInsets.all(12.0),
                  height: containerHeight - 20,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    )
                  ),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: isExpanded
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon:Icon(
                                  Icons.chevron_left,
                                  size: 40.0,
                                ),
                                onPressed: (){
                                  setState(() {
                                    if(isExpanded){
                                      selectedItem = '';
                                      containerHeight = MediaQuery.of(context).size.height - 100.0;
                                      isExpanded = false;
                                    }
                                  });
                                }
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Hero(
                              tag: 'food',
                              child: Center(
                                child: Image.network(
                                  selectedItem,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(left:15.0,top: 20.0,bottom: 15.0,right: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      selectedFood.title,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 38.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text(
                                      selectedFood.subTitle,
                                      //textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 110.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.2),
                                        width: 1.5
                                      )
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                if(selectedCounter > 0 )
                                                  selectedCounter--;
                                              });
                                            },
                                            child: Center(
                                              child: Icon(Icons.remove),
                                            ),
                                          )
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text(
                                              selectedCounter.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Center(
                                                child: Icon(Icons.add),
                                              ),
                                              onTap: (){
                                                setState(() {
                                                  selectedCounter++;
                                                });
                                              },
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    selectedFood.price,
                                    style: TextStyle(
                                      fontSize: 33.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'About the product',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    SingleChildScrollView(
                                      child: Container(
                                        child: Text(
                                          'Les chips ou pommes chips, connues aussi sous le néologisme de croustilles au Canada1,',
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 1.1
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                   Container(
                                     height: 50.0,
                                     width: 50.0,
                                     alignment: Alignment.center,
                                     child: Icon(Icons.favorite_border),
                                     decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       border: Border.all(
                                         color: Colors.grey.withOpacity(0.2),
                                         width: 2.0,
                                       )
                                     ),
                                   ),
                                   InkWell(
                                     onTap: (){
                                       setState(() {
                                         userFoodCart.add(selectedFood);
                                       });
                                     },
                                     child: Container(
                                       height: 55.0,
                                       width: 200.0,
                                       alignment: Alignment.center,
                                       decoration: BoxDecoration(
                                         color: Colors.orange,
                                         borderRadius: BorderRadius.circular(30.0),
                                       ),
                                       child: Text(
                                         'Add to cart',
                                         style: TextStyle(
                                           fontSize: 16.0,
                                           fontWeight: FontWeight.bold
                                         ),
                                       ),
                                     ),
                                   )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 40.0,
                                child: AppBar(
                            title: Text(
                              'Best Café',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            actions: <Widget>[
                              Icon(Icons.tune)
                            ],
                            elevation: 0.0,
                            backgroundColor: Colors.white,
                            leading: Icon(Icons.arrow_back_ios,size: 20.0,),
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                              ),
                              Container(
                                height: containerHeight - 70.0,
                                child: StaggeredGridView.countBuilder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: foodItems.length,
                                  crossAxisCount: 2,
                                  staggeredTileBuilder: (index){
                                    return StaggeredTile.count(1,index.isEven ? 1.8 : 1.52);
                                  },
                                  itemBuilder: (context,index){
                                    return InkWell(
                                      onTap: (){
                                        print('Item Clicked');
                                        setState(() {
                                          if(isExpanded){
                                            selectedItem = '';
                                            selectedFood = null;
                                            containerHeight = MediaQuery.of(context).size.height - 100.0;
                                            isExpanded = false;
                                          }else{
                                            selectedFood = foodItems[index];
                                            selectedItem = foodItems[index].imgPath;
                                            containerHeight = MediaQuery.of(context).size.height;
                                            isExpanded = true;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15.0),
                                        margin: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15.0),
                                            border: Border.all(
                                                color: Colors.grey.withOpacity(0.3),
                                                width: 1.0
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  blurRadius: 3,
                                                  spreadRadius: 1
                                              )
                                            ]
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Hero(
                                                tag:foodItems[index].hashCode,
                                                child: Image.network(
                                                  foodItems[index].imgPath,
                                                  //fit: BoxFit.cover,
                                                  width: 100.0,
                                                  height: 100.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20.0,),
                                            Text(
                                              foodItems[index].price,
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 15.0,),
                                            Text(
                                              foodItems[index].title,
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.black87
                                              ),
                                            ),
                                            SizedBox(height: 5.0,),
                                            Text(
                                              foodItems[index].subTitle,
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.black54
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
                        )
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      bottomViewTrigger = ! bottomViewTrigger;
                    });
                  },
                  child: !isExpanded
                      ? Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 16.0,right: 16.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Text(
                                  'Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: ListView.builder(
                                  itemCount: userFoodCart.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index){
                                    return Container(
                                    //  height: 40.0,
                                      width: 50.0,
                                      margin: EdgeInsets.all(8.0),
                                      //alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          userFoodCart[index].imgPath,
                                          height: 30.0,width: 30.0,
                                        )
                                      ),
                                    );
                                  },
                                )
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    shape: BoxShape.circle
                                  ),
                                  child: Text(
                                    userFoodCart.length.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0
                                    ),
                                  ),
                                )
                              ),
                            ],
                    ),
                  )
                      : Container(),
                )
              ],
            ),
          ),
      ),
    );
  }
}