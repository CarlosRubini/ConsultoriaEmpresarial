import 'package:easy_consulting/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data_grid_cadastro_area.dart';

class CadastrosArea extends StatelessWidget {
  const CadastrosArea({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Container(
      width: MediaQuery.of(context).size.width * 0.81,
      height: 500,
      padding: const EdgeInsets.only(top:20),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  TextBox(
                    width: 150,
                    textInputType: TextInputType.number,
                    paddingLeft: 25,
                    paddingRight: 10,
                    controller: TextEditingController(),
                    inputFormatters: [
                      FilteringTextInputFormatter(RegExp(r'^\d+\.?\d{0,3}'),
                          allow: true)
                    ],
                    hintText: "Código Área",
                    onChanged: (String text) {},
                  ),
                  Expanded(
                      child: TextBox(
                    width: 350,
                    textInputType: TextInputType.text,
                    paddingLeft: 5,
                    paddingRight: 10,
                    controller: TextEditingController(),
                    hintText: "Descrição Área",
                    onChanged: (String text) {},
                  )),
                  Container(
                    width: 125,
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Salvar",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    width: 125,
                    padding: const EdgeInsets.fromLTRB(10, 5, 25, 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color?>(
                              Colors.red[500])),
                      onPressed: () {},
                      child: const Text("Excluir",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
              Expanded(child: DataGridCadastroArea())
            ],
          )),
    );
  }
}
