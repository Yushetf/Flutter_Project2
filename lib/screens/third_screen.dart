import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _barList = [];
  List<String> _filteredBars = [];

  @override
  void initState() {
    super.initState();
    // Aquí puedes inicializar la lista de bares si es necesario
    _loadBarsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
            ),
            onChanged: (value) {
              _filterBars(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredBars.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredBars[index]),
                  // Aquí puedes agregar funcionalidad adicional para cada elemento de la lista
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _loadBarsFromDatabase() {
    // Aquí puedes cargar los bares desde la base de datos
    setState(() {
      _barList = []; // Inicializar la lista de bares
      _filteredBars = _barList; // Inicializar la lista filtrada
    });
  }

  void _filterBars(String searchText) {
    setState(() {
      _filteredBars = _barList
          .where((barName) =>
          barName.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
}
