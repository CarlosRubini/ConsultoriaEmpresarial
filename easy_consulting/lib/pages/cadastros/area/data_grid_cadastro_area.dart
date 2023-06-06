import 'package:easy_consulting/models/area/area.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// ignore: must_be_immutable
class DataGridCadastroArea extends StatelessWidget {
  DataGridCadastroArea({super.key});

  List<Area> areas = [
    Area('carlos.rubini', 1, 'Finanças'),
    Area('carlos.rubini', 2, 'Recursos Humanos'),
    Area('carlos.rubini', 3, 'Marketing / Vendas'),
    Area('carlos.rubini', 4, 'Processos'),
    Area('carlos.rubini', 5, 'Estratégia'),
  ];

  late AreaDataSource areaDataSource =
      AreaDataSource(areas: areas);

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      columnWidthMode: ColumnWidthMode.fill,
      source: areaDataSource,
      columns: <GridColumn>[
        GridColumn(
            width: 150,
            columnName: 'id',
            label: Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerRight,
                child: const Text(
                  'Código Área',
                  style: TextStyle(color: Colors.white),
                ))),
        GridColumn(
            columnName: 'name',
            label: Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Descrição Área',
                  style: TextStyle(color: Colors.white),
                )))
        // GridColumn(
        //     columnName: 'edit',
        //     label: Container(
        //         padding: const EdgeInsets.all(16.0),
        //         alignment: Alignment.centerRight,
        //         child: const Text('Editar'))),
        // GridColumn(
        //     columnName: 'excluir',
        //     label: Container(
        //         padding: const EdgeInsets.all(16.0),
        //         alignment: Alignment.centerLeft,
        //         child: const Text('Excluir'))),
      ],
    );
  }
}

class AreaDataSource extends DataGridSource {
  AreaDataSource({required List<Area> areas}) {
    _areas = areas
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.codigoArea),
              DataGridCell<String>(columnName: 'name', value: e.descricaoArea),
            ]))
        .toList();
  }

  List<DataGridRow> _areas = [];

  @override
  List<DataGridRow> get rows => _areas;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'id')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: const EdgeInsets.all(16.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
