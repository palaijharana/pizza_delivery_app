import 'package:flutter/material.dart';

void main() => runApp(const PizzaApp());

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const PizzaHome(),
    );
  }
}

//////////////////////////////////////////////////////
// 🔹 COMMON STUDENT HEADER
//////////////////////////////////////////////////////

class StudentHeader extends StatelessWidget {
  const StudentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Student Info", style: TextStyle(color: Colors.grey)),
        Text(
          "Jharana Palai | 160124737149",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Divider(),
      ],
    );
  }
}

//////////////////////////////////////////////////////
// 🔹 HOME PAGE
//////////////////////////////////////////////////////

class PizzaHome extends StatelessWidget {
  const PizzaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          '🍕 Pizza Hub',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),

      // 🔹 Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.redAccent),
              accountName: const Text("Jharana Palai",
                  style: TextStyle(fontSize: 18)),
              accountEmail: const Text("Roll No: 160124737149"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.redAccent),
              ),
            ),
            const ListTile(
                leading: Icon(Icons.history), title: Text("My Orders")),
            const ListTile(
                leading: Icon(Icons.settings), title: Text("Settings")),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StudentHeader(),

            const SizedBox(height: 10),

            const Text(
              "Popular Pizzas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: ListView(
                children: [
                  pizzaCard(context, "Pepperoni Feast", "12.99",
                      "assets/images/pizza1.png"),
                  pizzaCard(context, "Veggie Supreme", "10.99",
                      "assets/images/pizza2.png"),
                  pizzaCard(context, "Cheese Burst", "14.99",
                      "assets/images/pizza3.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////
  // 🔹 PIZZA CARD
  //////////////////////////////////////////////////////

  Widget pizzaCard(
      BuildContext context, String name, String price, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Text("\$$price"),
        trailing: const Icon(Icons.add_shopping_cart),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetails(
                name: name,
                price: price,
                imagePath: imagePath,
              ),
            ),
          );
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////
// 🔹 DETAILS PAGE
//////////////////////////////////////////////////////

class PizzaDetails extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  const PizzaDetails({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const StudentHeader(),

            const SizedBox(height: 20),

            Image.asset(
              imagePath,
              height: 180,
            ),

            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "Price: \$$price",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Order Now"),
            ),
          ],
        ),
      ),
    );
  }
}