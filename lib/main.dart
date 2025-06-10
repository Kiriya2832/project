import 'package:flutter/material.dart';

void main() {
  runApp(PsychologyCenterApp());
}

class PsychologyCenterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Центр психологічної підтримки',
     theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  useMaterial3: true,
),

    
     home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HeroSection(onNavigate: _onItemTapped),
      InternshipPage(),
      PrivateCoursePage(),
      FundPage(),
      ContactPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Центр психологічної підтримки'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages.map((page) {
          if (page is HeroSection) {
            return HeroSection(onNavigate: _onItemTapped);
          }
          return page;
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  selectedItemColor: Colors.black,        // колір активного значка
  unselectedItemColor: Colors.black54,    // колір неактивних значків
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Головна'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Стажування'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Курси 1-на-1'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Фонд'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Контакти'),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final Function(int) onNavigate;

  HeroSection({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'Ласкаво просимо до центру психологічної підтримки',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Професійна допомога, підтримка і розвиток. Ми допомагаємо вам зрозуміти себе і розвиватись.В нас ви можете відвідувати як індивідуальні сеанси з псиологом так і групові.Якщо ви студент психолог то в нас ти можеш пройти своє стажування.Всі подробиці нищє',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => onNavigate(1),
            child: Text('Подати заявку на стажування'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => onNavigate(2),
            child: Text('Записатись на курс 1-на-1'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => onNavigate(3),
            child: Text('Підтримати центр (Фонд)'),
          ),
        ],
      ),
    );
  }
}

class InternshipPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Стажування для майбутніх психологів', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
            'Безкоштовне стажування для студентів психології. Отримайте реальний досвід під супроводом менторів.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 30),
          Text('Подайте заявку:', style: TextStyle(fontSize: 18)),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(labelText: "Ваше ім'я")),
                TextFormField(decoration: InputDecoration(labelText: 'Email')),
                TextFormField(decoration: InputDecoration(labelText: 'Освітній заклад')),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text('Надіслати')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PrivateCoursePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Індивідуальні курси з психологом', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
            'Приватні онлайн або офлайн зустрічі з психологом. Доступно для всіх бажаючих.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 30),
          Text('Запишіться на консультацію:', style: TextStyle(fontSize: 18)),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(labelText: "Ваше ім'я")),
                TextFormField(decoration: InputDecoration(labelText: 'Email')),
                TextFormField(decoration: InputDecoration(labelText: 'Опишіть ваш запит')),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text('Записатись')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Благодійний фонд розвитку центру', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
            'Допоможіть нам розширити наші послуги, закупити обладнання, та надати доступ до психологічної допомоги всім, хто цього потребує.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: Text('Зробити внесок'),
          )
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Text(
          'Звʼяжіться з нами: support@psy-center.org | +380 50 000 00 00',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
