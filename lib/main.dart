import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(  // context yukarıdaki context, .showSnackBar(snackBar) özelliği bir snackbar tanımlaması istiyor
                      SnackBar(content: Text("Merhaba"),), // mesaj olarak content özelliğini kullanıyoruz
                  );
                },
                child: Text("Varsayılan"),
            ),

            ElevatedButton(
              onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Silmek istiyor musunuz?"),
                        action: SnackBarAction(
                          label: "Evet",  // action üzerindeki yazı
                          onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Silindi"),),
                            );
                          },
                        ),
                      ),
                  );
              },
              child: Text("SnackBar Action"),
            ),

            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("İnternet Bağlantısı Yok!", style: TextStyle(color: Colors.indigoAccent),),
                    backgroundColor: Colors.white,
                    duration: Duration(seconds: 5), // snackbarın ekranda kalma süresini ayarlıyor
                    action: SnackBarAction(
                      label: "Tekrar Dene",  // action üzerindeki yazı
                      textColor: Colors.red,
                      onPressed: (){
                        print("Tekrar denendi");
                      },
                    ),
                  ),
                );
              },
              child: Text("SnackBar Özel"),
            ),

          ],
        ),
      ),
    );
  }
}
