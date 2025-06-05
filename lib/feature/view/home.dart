import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_api_products/feature/controller/get_products.dart';
import 'package:get_api_products/feature/model/get_api.dart';
import 'package:get_api_products/feature/view/home2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<NewApi>?>(
        future: productdetails(),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Text('fail:${snapshot.error}');
          }else if(!snapshot.hasData  || snapshot.data!.isNotEmpty){
            // List<NewApi>? datass=snapshot.data;
            final item=snapshot.data!;
          
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: item.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product=item[index];
                    
                    return Container(
                      height: 200,
                      width: 200,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home2(datas: snapshot.data![index]),));
                            },
                              child: Container(
                                height: 100,
                                width: 100,
                                
                                child: Image.network(product.image.toString(),fit: BoxFit.contain,),
                              ),
                            ),
                            Text(product.id.toString()),
                            Text(product.title.toString()),
                          ],
                        ),
                      ),
                    );
                    }, gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 10,
                    ),
                  
                ),
              )
            ],
          );
          }else{
            return Text('not found');
          }        }, 
      ),
    );
  }
}