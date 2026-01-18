class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final GlobalKey _allSetKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([_allSetKey]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    ListTile(
                      leading: CircleAvatar(child: Text("A")),
                      title: Text("Alice Johnson"),
                      subtitle: Text("alice@example.com"),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Text("B")),
                      title: Text("Brian Smith"),
                      subtitle: Text("brian@example.com"),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Text("C")),
                      title: Text("Carla Fernández"),
                      subtitle: Text("carla@example.com"),
                    ),
                  ],
                ),
              ),

              // ⭐ Nuestro Showcase con el botón All Set. Explore!
              Showcase(
                key: _allSetKey,
                description: "You're all set! Tap to explore more options.",
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción que quieras
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "All Set. Explore!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
