Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр ИсторияЗаписей
	Движения.ИсторияЗаписей.Записывать = Истина;
	Движение = Движения.ИсторияЗаписей.Добавить();
	Движение.Период = Дата;
	Движение.Фирма = Салон;
	Движение.Клиент = клиент;
	Движение.Сотрудник = сотрудники;
	Движение.Услуга = услуга;
	Движение.Сумма = сумма;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры