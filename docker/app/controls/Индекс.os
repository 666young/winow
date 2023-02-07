&Пластилин Перем МенеджерОтображений Экспорт;

&Контроллер("/")
&Отображение(Шаблон = "./view/main.html", Метод = "ПолучитьМодельКонтрола")
Процедура ПриСозданииОбъекта()

КонецПроцедуры

Функция ПолучитьМодельКонтрола() Экспорт
	Модель = Новый Структура("Заголовок", "Минималистичный веб сервер WINOW");

	Возврат Модель;
КонецФункции

&ТочкаМаршрута("")
&Отображение("./view/index.html")
Процедура Главная(Ответ) Экспорт
	Ответ.Модель = Новый Структура("АвторПожелания", "сервер WINOW");
КонецПроцедуры

&ТочкаМаршрута("about")
&Отображение("./view/about.html")
Процедура ОСебе(Ответ) Экспорт
	Библиотеки = Новый Массив;
	Библиотеки.Добавить(Новый Структура("Имя, Адрес",  "autumn","https://github.com/autumn-library/autumn"));
	Библиотеки.Добавить(Новый Структура("Имя, Адрес",  "autumn-dduck ","https://github.com/autumn-library/autumn-dduck"));
	Библиотеки.Добавить(Новый Структура("Имя, Адрес",  "autumn-killjoy-flavour ","https://github.com/autumn-library/autumn-killjoy-flavour"));
	Библиотеки.Добавить(Новый Структура("Имя, Адрес",  "autumn-logos ","https://github.com/autumn-library/autumn-logos"));
	
	Ответ.Модель = Новый Структура("Библиотеки", Библиотеки);
КонецПроцедуры

&ТочкаМаршрута("contact")
&Отображение("./view/contact.html")
Процедура Контакты() Экспорт
	
КонецПроцедуры