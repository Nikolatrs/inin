
&НаКлиенте
Процедура ЗаполнитьПоШаблону(Команда)
	ЗаполнитьПоШаблонуНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьПоШаблонуНаСервере()
		СпУслуг  = Новый Запрос;
		СпУслуг.Текст =
			"ВЫБРАТЬ
			|	Услуги.Наименование
			|ИЗ
			|	Справочник.Услуги КАК Услуги
			|ГДЕ
			|	Услуги.ЭтоГруппа = ЛОЖЬ";
		РезультатЗапроса = СпУслуг.Выполнить();
		Выборка = РезультатЗапроса.Выгрузить().ВыгрузитьКолонку(0);
		для Каждого Элемент Из Выборка Цикл
			ЦУслуга= РегистрыСведений.Цены.СоздатьМенеджерЗаписи();
			ЦУслуга.Услуга=Справочники.Услуги.НайтиПоНаименованию(Элемент);
			ЦУслуга.Период=Формат(ТекущаяДата());
			ЦУслуга.Записать();
		КонецЦикла;


КонецПроцедуры
