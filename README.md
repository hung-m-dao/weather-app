# Weather app - Assignment

**Introduction**

This project uses MVVM design pattern, with RxSwift serves as connection between the View and View Model layers.

Folder structure: 

 - `Model`: Holds application data as structs
 - `View`: Custom view used in application
 - `ViewModel`: Main view model of application, responsible of calling network services, transferring model to view
 - `Networking`: Implement network service, define response model and error model.
 - `Util`: Define constants used in project
 - `WeatherApp`: Default folder, include application entry point, delegates and main view controller.

**Frameworks & libraries used**

 - `RxSwift/RxCocoa`: Make use of reactive programming, to implement MVVM design pattern
 - `Alamofire`: Handle HTTP request 
 - `SDWebImage`: Asynchronous image downloader with cache support - to display weather icon

**Installation**

CocoaPods is required to build this project, if you don't already have CocoaPods installed, run the following command:

    $ sudo gem install cocoapods
Then, navigate to project folder, and run

    $ pod install
The project should be able to build & run now

**Checklist**

 - [x] Choosing a design pattern
 - [x] Implement view controller and cell classes following UI requirement
 - [x] Use Rx framework to implement view model and render data on view
 - [x] Create service class to make API request with Alamofire
 - [x] Handling HTTP error, JSON parsing error, show error alert
 - [x] Write unit test

