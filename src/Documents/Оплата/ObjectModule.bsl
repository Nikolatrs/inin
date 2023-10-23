Процедура ОбработкаЗаполнения(ДанныеЗаполнения,СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Продажа") Тогда
		// Заполнение шапки
		Фирма = ДанныеЗаполнения.Салон;
		Продажа = ДанныеЗаполнения.Ссылка;
		Сотрудник = ДанныеЗаполнения.Сотрудник;
		Услуга = ДанныеЗаполнения.услуга;
		Сумма = ДанныеЗаполнения.сумма;

	КонецЕсли;

	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ

КонецПроцедуры

Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр Деньги
	Движения.Деньги.Записывать = Истина;
	Движение = Движения.Деньги.Добавить();
	Движение.Период = Дата;
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.ТипДенежныхСредств = ОпределениеТипаДернежныхСредвств(СпособОплаты);
	Движение.Сумма = Сумма;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Функция ОпределениеТипаДернежныхСредвств (СпособОплаты)
	Соответствие = Новый Соответствие;
	Соответствие.Вставить(Перечисления.СпособОплаты.Кредитка, Перечисления.ТипДережныхСредств.Безналичный);
	Соответствие.Вставить(Перечисления.СпособОплаты.Налик, Перечисления.ТипДережныхСредств.Наличный);
	Возврат Соответствие [СпособОплаты];	
КонецФункции