import 'package:domus_buddies/User/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../User/get_keycloack_token.dart';
import '../pet/animal_info.dart';
import '../pet/get_pet_list_request.dart';
import 'add_pet_to_user.dart';
import '../background/appbar_generic.dart';
import '../background/background_generic.dart';
import 'registo_veterinario.dart';

class MyPetsList extends StatelessWidget {
  const MyPetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = UserSession.loggedInUsername;
    final accessTokenProvider = Provider.of<FetchUserData>(context, listen: false);
    final authToken = accessTokenProvider.accessToken;

    return ChangeNotifierProvider(
      create: (context) => PetDataProvider(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: buildBody(username, authToken),
        floatingActionButton: buildFloatingActionButton(context),
      ),
    );
  }

  Widget buildBody(String? username, String? authToken) {
    return GradientBackground(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildHeaderText(),
            const SizedBox(height: 16.0),
            Consumer<PetDataProvider>(
              builder: (context, provider, child) {
                List<AnimalInfo> petNames = provider.petNames;

                // Check if petNames is empty or null
                if (petNames.isEmpty) {
                  // Fetch pet names on initial build
                  provider.fetchPetNames(authToken as String, username!);
                  return buildLoadingIndicator(); // Show loading indicator
                } else {
                  // Pet names are available, build the pet list
                  return buildPetList(petNames, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderText() {
    return const Text(
      ' Os meus Pets ',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.pink,
        fontFamily: 'Handwritten',
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildPetList(List<AnimalInfo> petNames, BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 400, // Set the maximum width, adjust as needed
          ),
          child: ListView.builder(
            itemCount: petNames.length,
            itemBuilder: (context, index) {
              return buildPetCard(petNames.elementAt(index), context);
            },
          ),
        ),
      ),
    );
  }



  Widget buildPetCard(AnimalInfo animalInfo, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ObterRegistoVeterinario(animalInfo: animalInfo),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Colors.pink,
        child: ListTile(
          title: Text(
            animalInfo.name,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Handwritten',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddPetToUser()),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}