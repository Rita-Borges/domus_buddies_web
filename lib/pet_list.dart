import 'package:domus_buddies/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'get_keycloack_token.dart';
import 'get_pet_list_request.dart'; // Replace with the actual file name
import 'AddPetToUser.dart';
import 'AppBarGeneric.dart';
import 'BackgroundGeneric.dart';
import 'main.dart';
import 'registo_veterinario.dart';
import 'lostPet.dart';

class MyPetsList extends StatelessWidget {
  const MyPetsList({Key? key});

  @override
  Widget build(BuildContext context) {
    final username = UserSession.loggedInUsername; // Get the logged-in username

    final accessTokenProvider =
    Provider.of<FetchUserData>(context,
        listen: false);
    String? authToken =
        accessTokenProvider.accessToken;


    return ChangeNotifierProvider(
      create: (context) => PetDataProvider(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: GradientBackground(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  ' Os meus Pets ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontFamily: 'Handwritten',
                  ),
                ),
                Consumer<PetDataProvider>(
                  builder: (context, provider, child) {
                    final petNames = provider.petNames;
                    if (petNames.isEmpty) {
                      // Fetch pet names on initial build
                      provider.fetchPetNames(authToken as String, username!);
                      return Center(
                        child: CircularProgressIndicator(), // Add a loading indicator
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: petNames.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(petNames[index]),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPetToUser()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
