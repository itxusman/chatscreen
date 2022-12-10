import 'package:flutter/material.dart';


class Product {
  final String title, desc;
  final Color color;
  Product({
    required this.title,
    required this.desc,
    required this.color,
  });
}

List<Product> products = [
  Product(
    title: "Monday Schedule",
    color: Color(0xFF71b8ff),
    desc:
        "First chapter of OOAD",
  ),
  Product(
    title: "Tuesday Schedule",
    color: Color(0xFFff6374),
    desc:
        " 3rd chapter of System programing",
  ),
  Product(
    title: "friday",
    color: Color(0xFFffaa5b),
    desc:
        "Cheatday",
  ),
  Product(
    title: "Team meeting",
    color: Color(0xFF9ba0fc),
    desc:
        "Fyp group meeting",
  ),
];

//class add to data

class Addtodo extends StatefulWidget {
  const Addtodo({Key? key}) : super(key: key);

  @override
  _AddtodoState createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.push_pin_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dashboard_outlined,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 8.0,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 8.0,
                          )
                        ]),
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      Icons.check,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: List.generate(
                      products.length, (index) => colorSelection(index)),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //title
            TextFormField(
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                hintText: "Enter title",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            TextFormField(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: const InputDecoration(
                hintText: "Enter description",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding colorSelection(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: products[index].color,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

//bottom appbar
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.5),
          spreadRadius: 2.0,
          blurRadius: 8.0,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.space_dashboard_rounded)),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Addtodo()));
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_outline_rounded)),
        ],
      ),
    );
  }
}
//cutomappbar
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Hi Usman,", 
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 45,
            width: 45,
            decoration: 
            BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8.0)),
            child: Image.asset(
              "assets/usman.jpg",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

// search screen
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
//list button
class ListButtonContainer extends StatelessWidget {
  const ListButtonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          LitsButton(
            isActive: true,
            press: () {},
            title: "Notes",
          ),
         
        ],
      ),
    );
  }
}

class LitsButton extends StatelessWidget {
  LitsButton({
    Key? key,
    this.isActive = false,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 19,
              color: isActive == true ? Colors.blue[400] : Colors.black54,
              fontWeight:
                  isActive == true ? FontWeight.bold : FontWeight.normal),
        ));
  }
}
//listdata.dart

class Listdata extends StatelessWidget {
  const Listdata({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) => ListCard(
                product: products[index],
                press: () {},
              )),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: product.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
            Text(
              product.desc,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//listmodel=fst class in this page

