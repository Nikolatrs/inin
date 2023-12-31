Процедура ОбработкаЗаполнения(ДанныеЗаполнения,СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Запись") Тогда
		// Заполнение шапки
		Салон = ДанныеЗаполнения.Салон;
		Сотрудник = ДанныеЗаполнения.сотрудники;
		клиент = ДанныеЗаполнения.клиент;
		услуга = ДанныеЗаполнения.услуга;
		Длительность = ДанныеЗаполнения.Длительность;
		сумма = ДанныеЗаполнения.сумма;
		Коментарий = ДанныеЗаполнения.Коментарий;
		Запись = ДанныеЗаполнения.Ссылка;

	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Продажа") Тогда
		// Заполнение шапки
	КонецЕсли;

	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр Продажи
	Движения.Продажи.Записывать = Истина;
	Движение = Движения.Продажи.Добавить();
	Движение.Период = Дата;
	Движение.Салон = Салон;
	Движение.Клиент = клиент;
	Движение.Сотрудник = Сотрудник;
	Движение.Услуга = услуга;
	Движение.Сумма = сумма;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ПроцентПоЗарплате.Процент КАК Процент
		|ИЗ
		|	РегистрСведений.ПроцентПоЗарплате КАК ПроцентПоЗарплате
		|ГДЕ
		|	ПроцентПоЗарплате.Сотрудник = &Сотрудник";
	
	Запрос.УстановитьПараметр("Сотрудник", Сотрудник);
	
	РезультатЗапроса = Запрос.Выполнить();
	Процент =Константы.СтандартныйПроцент.Получить();
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	ВыборкаДетальныеЗаписи.Следующий();
	Процент=ВыборкаДетальныеЗаписи.Процент;
	
	Движения.НачислениеЗП.Записывать=Истина;
	Движение = Движения.НачислениеЗП.Добавить();
	Движение.Салон=Салон;
	Движение.Период=Дата;
	Движение.ВидДвижения=ВидДвиженияНакопления.Приход;
	Движение.Сотрудник=Сотрудник;
	Движение.Месяц=НачалоМесяца(Дата);
	Движение.Сумма=сумма*Процент/100;	
	
	
КонецПроцедуры
