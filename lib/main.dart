import 'package:demo/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

 


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _Keyform =  GlobalKey<FormState>();
  void login(String email,password)async{
    try{
      http.Response response =await http.post(Uri.parse("https://reqres.in/api/register"),
      body: {
        'email': email,
        'password': password,
      }
      );
      if(response.statusCode == 200){
       
               print("👍👍👍👍👍login successfull");
              ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Container(
      padding: EdgeInsets.symmetric(vertical: 20), 
      child: ListTile(
        
        title: Text(
        "Login successful!",
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        "your account created",
        style: TextStyle(fontSize: 18),
      ),
      )
    ),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating, 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);

      } else{
          ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login failed',style: 
                TextStyle(fontSize: 15,color: Colors.white),),
                backgroundColor: Colors.red,
                elevation: 4,)
               );
        
      }
      

      

    }catch(e){
      print(e.toString());
    }
  }
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
      
      
     
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
         
          child: Form(
            key: _Keyform,
            child: Column(
            
            
              children: <Widget>[
                  
                  SizedBox(height: 50,),
                  CircleAvatar(radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person,color: Colors.white,size: 50,),),
                    SizedBox(height: 30,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "please enter the email";
                        }else{
                          return null;
                        }
                      },
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                        SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "please the enter the password";
                        } else if
                           (value.length <= 4){
                            return "please enter  more the 4";

                           
                        }else{
                          return null;
                        }
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                      SizedBox(height: 16,),
                      ElevatedButton(onPressed: (){
                          if (_Keyform.currentState!.validate()) {
                           
                            login(emailcontroller.text.toString(),passwordcontroller.text.toString());
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

                            
                          }
                      }, 
                      style: ElevatedButton.styleFrom(fixedSize: Size(300, 60),elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blue),
                      
                      child: Text('Login',style:
                       TextStyle(fontSize: 25,color: Colors.white),)),
                    
                    
             ]
            ),
          )
        ),
      )
        );
  }}