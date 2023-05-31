import 'package:easy_consulting/pages/menu/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData("Fevereiro", 38),
      ChartData("Março", 20),
      ChartData("Abril", 60),
      ChartData("Maio", 50),
    ];

    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: const Icon(Icons.more_vert),
          )
        ],
        title: const Text('Easy Consulting'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
            child: Center(
                child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.81,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          )
                        ],
                        color: Colors.grey[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.399,
                          height: 300,
                          child: Card(
                            color: const Color.fromRGBO(59, 52, 153, 1),
                            child: SafeArea(
                              child: SfCartesianChart(
                                  margin: const EdgeInsets.all(10),
                                  title: ChartTitle(
                                      text: "Histórico Usuários",
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  legend: Legend(
                                      textStyle:
                                          const TextStyle(color: Colors.white),
                                      isVisible: true,
                                      position: LegendPosition.bottom),
                                  primaryXAxis: CategoryAxis(
                                      borderColor: Colors.white,
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.shift),
                                  primaryYAxis: NumericAxis(
                                      borderColor: Colors.white,
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.shift),
                                  series: <CartesianSeries>[
                                    LineSeries<ChartData, String>(
                                        markerSettings: const MarkerSettings(
                                            isVisible: true),
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                color: Colors.white,
                                                isVisible: true),
                                        legendIconType: LegendIconType.image,
                                        dataSource: chartData,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y,
                                        name: 'Usuarios',
                                        color: Colors.white),
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.399,
                          height: 300,
                          child:
                              const Card(color: Color.fromRGBO(0, 109, 252, 1)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 200,
                          child: const Card(
                              color: Color.fromRGBO(247, 121, 37, 1)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 200,
                          child:
                              const Card(color: Color.fromRGBO(253, 53, 53, 1)),
                        ),
                      ],
                    )))),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final num y;
}
