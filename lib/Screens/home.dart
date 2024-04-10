import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var languages = [
    'English',
    'Hindi',
    'Malayalam',
    'Marathi',
    'German',
    'French',
    'Spanish',
    'Russian',
    'Chinese',
    'Japanese',
    'Arabic',
    'Italian',
    'Korean',
    'Portuguese',
    'Dutch',
    'Swedish',
    'Turkish',
    'Vietnamese',
    'Greek',
    'Polish'
  ];
  var originLanguage = 'From';
  var destinationLanguage = 'To';
  var output = "";

  TextEditingController controller = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translate = GoogleTranslator();
    var translation = await translate.translate(input, from: src, to: dest);
    setState(
      () {
        output = translation.text.toString();
      },
    );
    if (src == '--' || dest == '--') {
      setState(() {
        output = 'Failed to translate';
      });
    }
  }

  String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Hindi':
        return 'hi';
      case 'Malayalam':
        return 'ml';
      case 'Marathi':
        return 'mr';
      case 'German':
        return 'de';
      case 'French':
        return 'fr';
      case 'Spanish':
        return 'es';
      case 'Russian':
        return 'ru';
      case 'Chinese':
        return 'zh-cn';
      case 'Japanese':
        return 'ja';
      case 'Arabic':
        return 'ar';
      case 'Italian':
        return 'it';
      case 'Korean':
        return 'ko';
      case 'Portuguese':
        return 'pt';
      case 'Dutch':
        return 'nl';
      case 'Swedish':
        return 'sv';
      case 'Turkish':
        return 'tr';
      case 'Vietnamese':
        return 'vi';
      case 'Greek':
        return 'el';
      case 'Polish':
        return 'pl';
      default:
        return 'en';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text("Language Translator"),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originLanguage,
                      style: const TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    itemHeight: 48,
                    items: languages.map(
                      (String dropDownStringItem) {
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      },
                    ).toList(),
                    onChanged: (String? value) {
                      setState(
                        () {
                          originLanguage = value!;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destinationLanguage,
                      style: const TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    itemHeight: 48,
                    items: languages.map(
                      (String dropDownStringItem) {
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      },
                    ).toList(),
                    onChanged: (String? value) {
                      setState(
                        () {
                          destinationLanguage = value!;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Please Enter your Text',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2b3c5a),
                  ),
                  onPressed: () {
                    translate(
                      getLanguageCode(originLanguage),
                      getLanguageCode(destinationLanguage),
                      controller.text,
                    );
                  },
                  child: const Text('Translate'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "\n$output",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
