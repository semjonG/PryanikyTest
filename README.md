# 🍪 PryanikyTest 

## Задание

В качестве тестового задания предлагается создать небольшое приложение, позволяющее:

- получать с сервера json-файл cо списком данных нескольких типов (ex: картинка, блок текста, селектор одного варианта из N) и списком кого, какие блоки данных и в каком порядке надо отобразить.

- отображать список указанных элементов, и, при клике на них (или выборе одного из вариантов ответа), выводить информацию, что за объект инициировал событие (например: id, имя)

- Ссылка на JSON-файл:   https://pryaniky.com/static/json/sample.json (data - данные, view - что и в каком порядке выводить)

## Требования
- Используемый язык: Swift
- Предпочтительный паттерн при реализации приложения: MVVM
- Навык использования Pods (Moya, Alamofire, Kingfisher и т.п.) будет плюсом.
- Знакомство с RxSwift будет плюсом

## Выполнено
- MVVM (простой вариант)
- расширяемый и тестируемый Networking layer
- UIKit
- Alamofire 
- SDWebImage 
- No storyboard (programmatically)
  
    <table>
  <tr>
    <td>Main screen</td>
    <td>Alert information</td>
    <td>Animated</td>
  </tr>
  <tr>
    <td><img width="256" src="https://github.com/semjonG/PryanikyTest/blob/main/screen1.png?raw=true"></td>
   
    <td><img width="256" src="https://github.com/semjonG/PryanikyTest/blob/main/screen2.png?raw=true"></td>
    
    <td><img width="256" src="https://github.com/semjonG/PryanikyTest/blob/main/animated.gif?raw=true"></td>
  </tr>
  <tr>
  
  <img width="256" alt="example" src="https://github.com/semjonG/PryanikyTest/blob/main/animated.gif?raw=true"><br>
