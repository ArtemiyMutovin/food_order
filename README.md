# README

Чтобы создать тестовые данные - rails db:seed

Есть блюдо, у блюда есть состав (ингредиенты). На главной можно чек-боксами выбрать исключаемые ингредиенты, набор исключенных ингредиентов определяет заказ (в заказе не должно быть блюд с исключенными ингредиентами). При нажатии отправить создается заказ, после чего происходит редирект обратно на главную.

Так же есть запрос, который возвращает JSON вида [ { name: 'Омлет с брокколи', count: 10 }, { name: 'Овсяный сырник с вишней', count: 9 }, ...] count - количество блюд, которое надо приготовить, исходя из заказов. Массив ответа отсортирован в порядке убывания count. Вычисление количества блюд происходит в момент запроса.

Покрытие кода тестами RSpec является плюсом. Должна быть команда, которая наполняет базу данными из yml файла. Используем последние версии Ruby, Rails и PSQ
