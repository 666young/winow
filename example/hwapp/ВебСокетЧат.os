&Пластилин Перем БрокерСообщенийВебСокетов;

Перем КешИменПользователей;

&Контроллер("/chat")
Процедура ПриСозданииОбъекта()
	КешИменПользователей = Новый Соответствие();
КонецПроцедуры

&ТочкаМаршрута("message")
Процедура ВходящееСообщение(Идентификатор, Топик, Сообщение) Экспорт

	ИмяПользователя = КешИменПользователей.Получить(Идентификатор);

	ТекстСообщения = СтрШаблон("%1 >> %2: %3", ТекущаяДата(), ИмяПользователя, Сообщение);
	
	БрокерСообщенийВебСокетов.ОтправитьСообщениеВсем(Топик, ТекстСообщения);

КонецПроцедуры

&Отображение("./hwapp/view/chat.html")
&ТочкаМаршрута("")
Процедура Главная(Сессия, Ответ) Экспорт
	Имя = КешИменПользователей.Получить(Сессия.Идентификатор());
	Если Имя = Неопределено Тогда
		Ответ.Перенаправить("/chat/login");
	КонецЕсли;
КонецПроцедуры

&ТочкаМаршрута("login")
&Отображение("./hwapp/view/chatlogin.html")
Процедура Логин() Экспорт
КонецПроцедуры

&ТочкаМаршрута("loginprocess")
Процедура ОбработкаЛогина(ИмяПользователя, Сессия, Ответ) Экспорт
	КешИменПользователей.Вставить(Сессия.Идентификатор(), ИмяПользователя);
	Ответ.Перенаправить("/chat");
КонецПроцедуры

&ПриПодключенииВебСокета("/chat/message")
Процедура ПриПодключенииПользователя(Идентификатор) Экспорт
	ИмяПользователя = КешИменПользователей.Получить(Идентификатор);

	ТекстСообщения = СтрШаблон("%1 >> %2 вошел в чат", ТекущаяДата(), ИмяПользователя);
	
	БрокерСообщенийВебСокетов.ОтправитьСообщениеВсем("/chat/message", ТекстСообщения);
КонецПроцедуры

&ПриОтключенииВебСокета("/chat/message")
Процедура ПриОтключенииПользователя(Идентификатор) Экспорт
	ИмяПользователя = КешИменПользователей.Получить(Идентификатор);

	ТекстСообщения = СтрШаблон("%1 >> %2 покнул чат", ТекущаяДата(), ИмяПользователя);
	
	БрокерСообщенийВебСокетов.ОтправитьСообщениеВсем("/chat/message", ТекстСообщения);
КонецПроцедуры