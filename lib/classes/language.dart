class Language {
  final int id;
  final String name;
  final String flag;
  final String languagecode;

  Language(this.id, this.name, this.languagecode, this.flag);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "English", "en", "US"),
      Language(2, "Sinhala", "si", "LK"),
      Language(3, "Tamil", "ta", "IN"),
    ];
  }
}
