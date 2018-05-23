﻿#Использовать asserts
// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd
Перем ЛокальныеВременныеФайлы;
// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯИнициализируюПустойРепозиторийВКаталогИзПеременной");
	ВсеШаги.Добавить("ЯСоздаюКаталогSrcВременныйВКаталогеИзПеременнойИСохраняюЕгоВКонтекстВПеременной");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
	ЛокальныеВременныеФайлы = Новый МенеджерВременныхФайлов;

КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	ЛокальныеВременныеФайлы.Удалить();
КонецПроцедуры

//Я инициализирую пустой репозиторий в каталог из переменной "ПутьКаталогаИсходников"
Процедура ЯИнициализируюПустойРепозиторийВКаталогИзПеременной(Знач ПутьКаталогаИсходников) Экспорт
	
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ВременныйКаталог = БДД.ПолучитьИзКонтекста("ПутьКаталогаИсходников");
	ГитРепозиторий.УстановитьРабочийКаталог(ВременныйКаталог);
	ПараметрыКоманды = Новый Массив;
	ПараметрыКоманды.Добавить("init");
	ГитРепозиторий.ВыполнитьКоманду(ПараметрыКоманды);

КонецПроцедуры

//Я создаю каталог src временный в каталоге из переменной "ПутьКаталогаИсходников" и сохраняю его в контекст в переменной "КаталогSRC"
Процедура ЯСоздаюКаталогSrcВременныйВКаталогеИзПеременнойИСохраняюЕгоВКонтекстВПеременной(Знач ПутьКаталогаИсходников, Знач КаталогSRC) Экспорт
	ВременныйКаталог = БДД.ПолучитьИзКонтекста("ПутьКаталогаИсходников");
	КаталогSRC = ОбъединитьПути(ВременныйКаталог, "src");
	СоздатьКаталог(КаталогSRC);
	БДД.СохранитьВКонтекст("КаталогSRC", КаталогSRC);

КонецПроцедуры



