# archresearch
## Обзор архитектуры
Все строится на базе архитектуры Elm

![elm](https://guide.elm-lang.org/architecture/buttons.svg)

### Основные понятия и сущности

#### State
Состояние виджета
```
class LoginState extends State{
  bool isLoading = false;
  String username;
  String password;
  Map<LoginError, String> errors;
}
```

#### Action
Действие или событие в виджете, например
`LoginButtonPressed("admin", "123")`



#### Reducer
Атомарная часть бизнес-логики.  
Принимает на вход прошлое состояние и Action
и отдает новое состояние.

```
abstract class Reducer<S extends State, A extends Action> {
  Stream<S> call(S prevState, A action) async* {}
}
```

Не зависит от платформ и реализаций, работает с интерфейсами


#### BLOC
Хранитель бизнес-логики приложения, состоит из Reducer

## Про модульность

Модули формируются по экранам и внутри уже по слоям , в отличие от «классического» подхода когда
сначала все делится по слоям, а там уже куча файлов. Как показала практика, очень сложно навигироваться
потом. Чтобы найти допустим все файлы которые относятся к логину нужно будет перерыть кучу пакетов.

![alt text](/readme/arch.png)


### Что делать в данном случае с запросами в сеть/БД которые как бы общие
Dio или аналог описывается в модуле common/network а затаем инжектируется в нужный репозиторий

## Про навигацию
Bloc, которым требуется управлять навигацией получают на вход реализацию абстрактного класса
```
abstract class Navigation {
  void pushNamed(String routeName);
  void pushReplacementNamed(String routeName);
  void pop();
}
```

В main.dart это выглядит вот так:
```
  final navKey = GlobalKey<NavigatorState>(debugLabel: "TestNav");
  final navigation = NavigationImplementation(navigation: navKey.currentState);
```
А вызывается вот так:
```
_navigation.pushNamed("/other");
```
Все это требуется для того чтобы в Reducer не было связи с платформой

#### Что? Reducer создает сайд-эффект вместо нового стейта?
На самом деле, не совсем.
* Во-первых навигация это всегда некий trade-off и неудобства
* Во-вторых мы просто говорим нашему навигатору сделать что-то, для экрана не возникает нового стейта



## Важно про State в Reducer
Каждый стейт должен создаваться заново, а не просто модифицировать свои поля

```
// НЕ НАДО ТАК
class BadReducer {
  Stream<State> call(prevState, Action) async*{
    yield  prevState.calling = true
  }
}
```

```
// Вот так хорошо
class GoodReducer {
  Stream<State> call(prevState, Action) async*{
    yield prevState.copyWith(calling: true)
    // или yield State(calling: true) - если всего один параметр
  }
}
```
Если так не делать, то состояние будет неконсистентым и начнут происходить странные вещи.


#### Почитать про локализацию
[Здесь](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

