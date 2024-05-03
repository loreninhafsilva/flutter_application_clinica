import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/medico.dart';

class MyClinica extends StatefulWidget {
  const MyClinica({super.key});

  @override
  State<MyClinica> createState() => _MyClinicaState();
}

class _MyClinicaState extends State<MyClinica> {
   GlobalKey <FormState> chaveValidacao = GlobalKey();
    TextEditingController crmController = TextEditingController();
    TextEditingController nomeController = TextEditingController();
    bool residencia = false;
    bool especializacao = false;
    bool posgraduacao = false;
    bool notifications = false;
    List<bool> formacao = [false, false, false];
    List<Medico> cadastro = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 122, 150, 174),
        title: Text("Clínica Your Health First", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: chaveValidacao,
          child: Column(children: [
            Image.asset("assets/images/logo.jpg"),
            Text("CADASTRO", style: TextStyle(color: Color.fromARGB(255, 122, 150, 174), fontWeight: FontWeight.bold, fontSize: 25)),
            SizedBox(height: 20,),
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(labelText: "Nome", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.blue),),),
              validator: (value) {
                if (value!.isEmpty){
                  return("O nome não pode ser vazio"); 
                } else {
                if(value.length < 3){
                  return("Digite um nome com pelo menos 5 caracteres");
                }
                }
                return null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: crmController,
              decoration: InputDecoration(labelText: "Número do registro no CRM", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.blue),),),
              validator: (value) {
                if (value!.isEmpty){
                  return("O campo não pode ser vazio"); 
                } else {
                if(value.length < 3){
                  return("Digite um número com pelo menos 5 caracteres");
                }
                }
                return null;
              },
            ),
            SizedBox(height: 15,),
            Text("Selecione a sua formação:", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 17)),
            CheckboxListTile(
              title: Text("Residência"),
              secondary: Icon(Icons.medical_information),
              value: residencia, 
              onChanged: (value){
                residencia = value!;
                formacao[0] = true;
              setState(() {
              
              });
            }),
            CheckboxListTile(
              title: Text("Especialização"),
              secondary: Icon(Icons.medical_information),
              value: especializacao, 
                onChanged: (value){
                especializacao = value!;
                formacao[1] = true;
              setState(() {
              
              });
            }),
            CheckboxListTile(
              title: Text("Pós-Graduação"),
              secondary: Icon(Icons.medical_information),
              value: posgraduacao, 
                onChanged: (value){
                posgraduacao = value!;
                formacao[2] = true;
              setState(() {
              
                });
            }),
            SizedBox(height: 10,),
            SwitchListTile(
              title: Text("Permitir chamadas de emergência"),
              value: notifications, 
                onChanged: (value){
                notifications = value;
              setState(() {
              
              });
            },
            activeColor: const Color.fromARGB(255, 113, 124, 185),
            inactiveTrackColor: const Color.fromARGB(255, 196, 82, 82),),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(onPressed: (){
              if(chaveValidacao.currentState!.validate()){
                String nome = nomeController.text;
                int crm = int.parse(crmController.text);
                bool notificacoes = notifications;
                Medico cad = new Medico(nome, crm, formacao, notificacoes);
                cadastro.add(cad);
                  print('Resultados:\n======================'); 
                  for (var p in cadastro){ 
                  print('Nome: ' + p.nome.toString()); 
                  print('CRM: ' + p.CRM.toString()); 
                  print('Residência: ' + p.formacao[0].toString()); 
                  print('Especialização: ' + p.formacao[1].toString()); 
                  print('Pós-Graduação: ' + p.formacao[2].toString()); 
                  print('Notificação: ' + p.notificacoes.toString()); 
                  print('======================');
                  }
                  nomeController.clear();
                  crmController.clear();
                  notifications = false;
                  residencia = false;
                  formacao[0] = false;
                  especializacao = false;
                  formacao[1] = false;
                  posgraduacao = false;
                  formacao[2] = false;
                }
                setState(() {
            
                });
            }, child: Text("Cadastrar", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 113, 124, 185), 
                onPrimary: Colors.black,
                elevation: 4,
                shadowColor: Colors.black, 
              ),),
              SizedBox(width: 20,),
            ElevatedButton(onPressed: (){
              nomeController.clear();
              crmController.clear();
              notifications = false;
              residencia = false;
              formacao[0] = false;
              especializacao = false;
              formacao[1] = false;
              posgraduacao = false;
              formacao[2] = false;
              setState(() {
                
              });
            }, 
            child:Text("Cancelar", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 196, 82, 82), 
                onPrimary: Colors.black,
                elevation: 4,
                shadowColor: Colors.black, 
            ),),],)
          ],
          )),

      ),)
    );
  }
}