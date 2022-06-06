import 'package:flutter/material.dart';

class LoadDataFailed extends StatelessWidget {
  const LoadDataFailed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center,children: const [
      Text('Failed to load data. \n Please check your network connection.',textAlign: TextAlign.center,),
      SizedBox(height: 10,),
      Icon(Icons.refresh,size: 30,)
    ],),
  );
}
