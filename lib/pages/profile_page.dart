import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/notifiers/data_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final noteCount = dataProvider.notes.length;
    final taskCount = dataProvider.tasks.length;
    final completedTasks = dataProvider.tasks.where((t) => t.isDone).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // 1. Profile Image (Static Asset)
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade100,
                      // --- THIS IS THE CODE THAT SELECTS YOUR IMAGE ---
                      image: const DecorationImage(
                        // Make sure 'assets/avatar.jpg' exists in your project!
                        image: AssetImage('assets/images/profile.jpg'), 
                        fit: BoxFit.cover,
                      ),
                      // ------------------------------------------------
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  
                  // Edit Icon (Visual only)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor, 
                          width: 2
                        ),
                      ),
                      child: const Icon(Icons.edit, size: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 2. Name & Email
            const Text(
              "Guest User",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "guest@example.com",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),

            const SizedBox(height: 30),

            // 3. Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard(context, "Notes", noteCount.toString()),
                  Container(height: 40, width: 1, color: Colors.grey.shade300),
                  _buildStatCard(context, "Tasks", taskCount.toString()),
                  Container(height: 40, width: 1, color: Colors.grey.shade300),
                  _buildStatCard(context, "Done", completedTasks.toString()),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Divider(thickness: 1),
            const SizedBox(height: 10),

            // 4. Menu Options
            _buildMenuOption(context, Icons.person_outline, "Edit Profile"),
            _buildMenuOption(context, Icons.notifications_outlined, "Notifications"),
            _buildMenuOption(context, Icons.lock_outline, "Privacy & Security"),
            _buildMenuOption(context, Icons.help_outline, "Help & Support"),

            const SizedBox(height: 20),

            // 5. Logout Button
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.redAccent),
              label: const Text(
                "Log Out", 
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Stats
  Widget _buildStatCard(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22, 
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14, 
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Helper Widget for Menu Items
  Widget _buildMenuOption(BuildContext context, IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.grey.shade800 
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 22),
      ),
      title: Text(
        title, 
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title clicked (Demo only)")),
        );
      },
    );
  }
}