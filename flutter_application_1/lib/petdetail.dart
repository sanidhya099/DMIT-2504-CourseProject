import 'package:flutter/material.dart';
import 'pet.dart';

class PetDetailsForm extends StatefulWidget {
  @override
  _PetDetailsFormState createState() => _PetDetailsFormState();
}

class _PetDetailsFormState extends State<PetDetailsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  String _breed = '';
  String _gender = '';
  String _description = '';
  List<Pet> _pets = []; // List to store added pets

  @override
  void initState() {
    super.initState();
    _breed = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Pet Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter pet name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter pet age';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _age = int.tryParse(value!) ?? 0;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Breed'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter pet breed';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _breed = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Gender'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter pet gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _gender = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter pet description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _addPet(); // Add the pet to the list
                    }
                  },
                  child: Text('Add Pet'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PetListScreen(pets: _pets)),
                    );
                  },
                  child: Text('View Pet List'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addPet() {
    // Create a new Pet object and add it to the list
    Pet newPet = Pet(
      name: _name,
      age: _age,
      breed: _breed,
      gender: _gender,
      description: _description,
    );
    setState(() {
      _pets.add(newPet);
    });
  }
}

class PetListScreen extends StatelessWidget {
  final List<Pet> pets;

  const PetListScreen({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet List'),
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pets[index].name),
            subtitle: Text('Age: ${pets[index].age}, Breed: ${pets[index].breed}'),
          );
        },
      ),
    );
  }
}
