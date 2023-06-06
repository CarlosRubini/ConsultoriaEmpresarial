import 'package:easy_consulting/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../area/data_grid_cadastro_area.dart';

class CadastrosPerguntas extends StatelessWidget {
  const CadastrosPerguntas({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Container(
      width: MediaQuery.of(context).size.width * 0.81,
      height: 500,
      padding: const EdgeInsets.only(top: 20),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: TextBox(
                        textInputType: TextInputType.number,
                        paddingLeft: 25,
                        paddingRight: 10,
                        controller: TextEditingController(),
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp(r'^\d+\.?\d{0,3}'),
                              allow: true)
                        ],
                        hintText: "Código Pergunta",
                        onChanged: (String text) {},
                      )),
                  Expanded(
                      flex: 6,
                      child: TextBox(
                        textInputType: TextInputType.text,
                        paddingLeft: 5,
                        paddingRight: 10,
                        controller: TextEditingController(),
                        hintText: "Descrição Pergunta",
                        onChanged: (String text) {},
                      )),
                ],
              ),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
                        child: Text(
                          "Respostas",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.only(left: 56),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(56, 5, 56, 5),
                                  child: SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 5.0,
                                            height: 5.0,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                          ),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Text(
                                                  "Alto Risco (${index + 1})"))
                                        ],
                                      )),
                                ),
                              );
                            }))
                  ],
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                        backgroundColor:
                            MaterialStatePropertyAll<Color?>(Colors.red[500])),
                    onPressed: () {},
                    child: const Text("Excluir",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                  ),
                )
              ]),
              Expanded(child: DataGridCadastroArea())
            ],
          )),
    );
  }
}
