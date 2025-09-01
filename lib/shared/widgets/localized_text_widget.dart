import 'package:flutter/material.dart';

class LocalizedTextWidget extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const LocalizedTextWidget({
    super.key,
    required this.textKey,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _getLocalizedText(context),
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  String _getLocalizedText(BuildContext context) {
    switch (textKey) {
      case 'login':
        return 'Войти';
      case 'register':
        return 'Зарегистрироваться';
      case 'email':
        return 'Email';
      case 'password':
        return 'Пароль';
      case 'name':
        return 'Имя';
      case 'phone':
        return 'Телефон';
      case 'serverError':
        return 'Ошибка сервера';
      case 'networkError':
        return 'Нет подключения к интернету';
      case 'loading':
        return 'Загрузка...';
      case 'retry':
        return 'Повторить';
      case 'cancel':
        return 'Отмена';
      case 'save':
        return 'Сохранить';
      case 'delete':
        return 'Удалить';
      case 'edit':
        return 'Редактировать';
      case 'add':
        return 'Добавить';
      case 'search':
        return 'Поиск';
      case 'back':
        return 'Назад';
      case 'next':
        return 'Далее';
      case 'done':
        return 'Готово';
      case 'close':
        return 'Закрыть';
      case 'ok':
        return 'ОК';
      case 'yes':
        return 'Да';
      case 'no':
        return 'Нет';
      case 'success':
        return 'Успешно';
      case 'error':
        return 'Ошибка';
      case 'warning':
        return 'Предупреждение';
      case 'info':
        return 'Информация';
      case 'home':
        return 'Главная';
      case 'profile':
        return 'Профиль';
      case 'settings':
        return 'Настройки';
      case 'cargo':
        return 'Грузы';
      case 'orders':
        return 'Заказы';
      case 'history':
        return 'История';
      case 'notifications':
        return 'Уведомления';
      case 'help':
        return 'Помощь';
      case 'about':
        return 'О приложении';
      case 'contact':
        return 'Контакты';
      case 'enterDestination':
        return 'Введите пункт назначения';
      case 'currentLocation':
        return 'Ваше местоположение';
      case 'selectedLocation':
        return 'Выбранная точка';
      case 'unknownPlace':
        return 'Неизвестное место';
      case 'whereToDeliver':
        return 'Куда доставить?';
      default:
        return textKey;
    }
  }
}
