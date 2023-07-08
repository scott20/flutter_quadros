import 'package:flutter/material.dart';
import 'package:flutter_login/main.dart';
import 'package:flutter_login/model/quadro.dart';
import 'package:flutter_login/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Quadro"),
        actions: [
          IconButton(
            icon: const Icon(Icons.view_list),
            onPressed: () {
              setState(() => _isGrid = false);
            },
          ),
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {
              setState(() => _isGrid = true);
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _isGrid ? _buildGrid() : _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: MyApp.listaQuadros.length,
      itemBuilder: (context, index) {
        final quadro = MyApp.listaQuadros[index];
        return ListTile(
          title: _buildCard(quadro),
          onTap: () {
            print(quadro.nome);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(quadro.nome),
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(quadro),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: MyApp.listaQuadros.length,
      itemBuilder: (context, index) {
        final quadro = MyApp.listaQuadros[index];
        return ListTile(
          title: _buildCard(quadro),
          onTap: () {
            print(quadro.nome);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Alex Alemany"),
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(quadro),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCard(Quadro quadro) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 900,
            height: 300,
            child: _buildImage(quadro.imagem),
          ),
          const Divider(),
          ListTile(
            title: Center(
              child: Text(
                quadro.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    return Image.asset(path);
  }
}