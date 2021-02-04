import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_bloc.dart';

class CalculatorHome extends StatelessWidget {
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
  final TextEditingController _controllerNumberA = TextEditingController();
  final TextEditingController _controllerNumberB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //CalculatorBloc bloc = BlocProvider.of<CalculatorBloc>(context);
    return BlocListener<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state is CalculatorFailed) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('${state.error}')));
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controllerNumberA,
                decoration: InputDecoration(labelText: 'Number A'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _controllerNumberB,
                decoration: InputDecoration(labelText: 'number B'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('+'),
                      onPressed: (){
                        //fitur penjumlahan
                      }
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: RaisedButton(
                      child: Text('-'),
                      onPressed: () {
                        //fitur pengurangan
                      }
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: RaisedButton(
                      child: Text('X'),
                      onPressed: () {
                        //fitur perkalian
                      }
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: RaisedButton(
                      child: Text(':'),
                      onPressed: () {
                        //fungsi pembagian
                      }
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state){
                  if (state is CalculatorInitial) {
                    return Text('Result : -');
                  } else if (state is CalculatorSuccess) {
                    return Text('Result : ${state.result}');
                  } else if (state is CalculatorFailed) {
                    return Text('Error : ${state.error}');
                  } else {
                    return Container();
                  }
                })
            ],
          ),
        ),
      ),
    );
  }
}