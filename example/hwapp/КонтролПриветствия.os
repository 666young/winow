&Пластилин
Перем ОбщийКонтейнер Экспорт;

&Контроллер("/")
&Желудь
Процедура ПриСозданииОбъекта()

КонецПроцедуры

&ТочкаМаршрута("/")
Процедура Приветствие(ВходящийЗапрос, Ответ, Сессия) Экспорт

	Ответ.ТелоТекст = СтрШаблон("<!DOCTYPE html>
								|<div> %1 </div>",  "Привет новый дивный мир !");

КонецПроцедуры

&ТочкаМаршрута("/err")
Процедура Ошибка(ВходящийЗапрос, Ответ, Сессия) Экспорт

	ВызватьИсключение "У меня ошибка";

КонецПроцедуры

&ТочкаМаршрута("/redir")
Процедура Перенаправление(ВходящийЗапрос, Ответ, Сессия) Экспорт

	Ответ.Перенаправить("/");

КонецПроцедуры