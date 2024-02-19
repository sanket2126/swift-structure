# SOLID PRINCIPLES (Code like pro)

> ## S - Single Responsibilty Principle
> - A class should have single responsibilty. Like (Object creation, API calling, Database storage all in different classes)
> - [SRP Video 1](https://www.youtube.com/watch?v=nvceoXrzDGE&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8)
> - [SRP Video 2](https://www.youtube.com/watch?v=PG8XSarFEcg&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8&index=2)

> ## O - Open Closed Principle
> - Open for extension but close for modification
> - Example :- Making a AreaCalculator class which contain a method with a parameter of protocol so object of any class inheriting that protocol can be passed in it and get the area of any Shape Type (Rectangle, Circle , Triangle)
> - [Open Close Video](https://www.youtube.com/watch?v=WJznwyuOHZc&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8&index=3)

> ## L - Liskov Substitution Principle
> - Child class should not change the functionality of Parent class
> - As Rectangle and Square have a minor difference, someone would override property of length and make it equal to width for ease. but instead of that we should make protocol and use that so once cannot override property of parent class and change functionality of that.
> - [](https://www.youtube.com/watch?v=VAA6lZsODh4&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8&index=4)

> ## I - Interface Segregation Principle
> - We can use it to avoid Fat Protocol(Human and Animal protocol can be separated and 1 parent protocol can be created which hold similar methods)
> - [ISP Video 1](https://www.youtube.com/watch?v=ZTmSP-ODoZo&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8&index=5)
> - [ISP Video 2](https://www.youtube.com/watch?v=4SJFko6WnDY&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8&index=8)

> ## D - Dependency Inversion Principle
> - Instead of creating an object of class direct, we can create an obj of protocol type. so if required we can just assign another type of object in depencies. (Can replace DB obj with API or vice versa in future).
> - [DI Video](https://www.youtube.com/watch?v=hJ8qw4vwwy8&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8&index=6)

> [Additonal Infomative Video - Swift Lint](https://www.youtube.com/watch?v=paxhPNBm7ZI&list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8&index=7)
