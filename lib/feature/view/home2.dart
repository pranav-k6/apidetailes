import 'package:flutter/material.dart';
import 'package:get_api_products/feature/model/get_api.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key, required this.datas});
  final NewApi datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height ,
                width: double.infinity,
                color: Colors.white,
                child:Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.network(datas.image.toString(),fit: BoxFit.contain,),
                      
                    ),
                    Text(datas.title.toString()),
                    Text(datas.description.toString()),
                  ],
                )
                 ),
            ],
          ),
        ),
      ),
    );
  }
}