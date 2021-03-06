#language: ru

@tree

Функционал: создание документа Заказ
Как Менеджер по закупкам я хочу
создание документа заказ товаров
чтобы поставить товар в бронь

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа Заказ
И я закрываю все окна клиентского приложения
* Перейти в список документов Заказы
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
* Создать документ Заказ
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнить шапку документа Заказ
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Попов Б.В. ИЧП '
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
* Заполнить список товаров к заказу
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000002' | 'Сапоги'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '150'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000007' | 'Сланцы'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '200'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
* Проверка суммы и цены
	Тогда таблица "Товары" стала равной:
		| 'Товар'  | 'Цена'     | 'Сумма'      |
		| 'Сапоги' | '3 300,00' | '495 000,00' |
		| 'Сланцы' | '500,00'   | '100 000,00' |
* Записать и закрыть созданный документ заказа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
	//
