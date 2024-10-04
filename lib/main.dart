import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Sesión',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

//*************************PANTALLA DE INICIO************************************ */
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido de Nuevo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Fondo blanco
                textStyle: TextStyle(color: Colors.black),
              ),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Fondo negro
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Text(
                'Regístrate',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//*************************PANTALLA DE INICIAR SESION************************************ */
class LoginScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'User name',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Acción para recuperar contraseña
                },
                child: Text('¿Olvidaste tu contraseña?'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al iniciar sesión
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  Fluttertoast.showToast(
                    msg: 'Bienvenido al Sistema 😊✌',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                } else {
                  Fluttertoast.showToast(
                    msg:
                        'Usuario o contraseña incorrectos, por favor ingrese nuevamente los datos correctos',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 10),
            Text('Si no tienes cuenta, regístrate aquí'),
          ],
        ),
      ),
    );
  }
}

//******************PANTALLA DE REGISTRO************************************* */
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'User name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Correo',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'DNI',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'RUC',
              ),
            ),
            SizedBox(height: 10),
            Text('Su empresa es'),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text('Proveedor'),
                    value: 'proveedor',
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('Bodeguero'),
                    value: 'bodeguero',
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre de la empresa',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Departamento',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Distrito',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al registrarse
              },
              child: Text('Regístrate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//******************PANTALLA de menu principal************************************* */
class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Lista de productos iniciales
  List<String> products = [
    'Producto 1',
    'Producto 2',
    'Producto 3',
    'Producto 4',
    'Producto 5',
    'Producto 6',
    'Producto 7',
    'Producto 8',
    'Producto 9',
  ];

  // Lista que se mostrará (inicia igual a la lista de productos)
  List<String> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts =
        products; // Al inicio, la lista filtrada es igual a la lista completa
  }

  // Función para actualizar los resultados de la búsqueda
  void _filterProducts(String query) {
    List<String> _filtered = products
        .where((product) => product.toLowerCase().contains(
            query.toLowerCase())) // Filtra ignorando mayúsculas/minúsculas
        .toList();

    setState(() {
      filteredProducts = _filtered; // Actualiza la lista filtrada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar producto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterProducts(value); // Llama a la función de filtrado
              },
            ),
          ),
          // GridView para mostrar los productos
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de columnas en el grid
                crossAxisSpacing: 10, // Espaciado entre columnas
                mainAxisSpacing: 10, // Espaciado entre filas
                childAspectRatio: 2 / 3, // Relación de aspecto (ancho / alto)
              ),
              itemCount:
                  filteredProducts.length, // Total de productos filtrados
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: GridTile(
                    header: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        filteredProducts[index], // Nombre del producto
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.shopping_bag,
                          size: 50), // Icono de ejemplo
                    ),
                    footer: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Acciones para el botón
                        },
                        child: Text('Agregar'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
