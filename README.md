# E-Com
A basic E-Commerce App that fetches data from network, saves it in Core Data for offline use, and displays the list of categories. 
This app uses VIPER architecture and Protocol Oriented Programming with Swift 5 and is Compatible with Xcode 10.2.

# VIPER (View, Interactor, Presenter, Entity and Router.) 

**View** : Class that has all the code to show the app interface to the user and get their responses. Upon receiving a response View alerts the Presenter.

**Presenter**: Nucleus of a module. It gets user response from the View and work accordingly. Only class to communicate with all the other components. Calls the router for wire-framing, Interactor to fetch data (network calls or local data calls), view to update the UI.

**Interactor** : Has the business logics of an app. Primarily make API calls to fetch data from a source. Responsible for making data calls but not necessarily from itself.

**Router** : Does the wire-framing. Listens from the presenter about which screen to present and executes that.

**Entity** : Contains plain model classes used by the interactor.

###### Dependecy Manager : Cocoapods
###### Pods for E-Com
    pod 'Alamofire', '~> 4.7.3'
    pod 'AlamofireObjectMapper', '~> 5.2'
