﻿#Использовать v8find
// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯИщюПлатформуИСохранюНайденныйПуть");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	
КонецПроцедуры


//Я ищю платформу и сохраню найденный путь "ПутьКПлатформе1С"
Процедура ЯИщюПлатформуИСохранюНайденныйПуть(Знач ИмяПеременной) Экспорт

	ПутьКПлатформе1С = Платформа1С.ПутьКПредприятию("8.3");
	
	Если Не ЗначениеЗаполнено(ПутьКПлатформе1С) Тогда
		ВызватьИсключение "Не найден путь к платформе 1С";
	КонецЕсли;

	БДД.СохранитьВКонтекст(ИмяПеременной, ПутьКПлатформе1С);

КонецПроцедуры

Функция ОбернутьВКавычки(Знач Строка);
	Возврат """" + Строка + """";
КонецФункции