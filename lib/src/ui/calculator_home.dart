import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_bloc.dart';

class CalculatorHome extends StatelessWidget {
  final TextEditingController _controllerNumberA = TextEditingController();
  final TextEditingController _controllerNumberB = TextEditingController();
  final CalculatorBloc _calculatorBloc = CalculatorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc Calculator"),
      ),
      body: BlocProvider<CalculatorBloc>(
        create: (context) => _calculatorBloc,
        child: MainProgram(),
      ),
    );
  }
}

class MainProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalculatorBloc bloc = BlocProvider.of<CalculatorBloc>(context);

    
    return Container(
      
    );
  }
}


