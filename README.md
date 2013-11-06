Mixpanel-qml
========

Mixpanel library for QtQuick.
Only meaningful file is src/Mixpanel.qml, the rest is infrustructure for imports to work cleverly and tests.

Projects using this library
-----------
- [Wikipedia for Sailfish](https://github.com/amarchen/Wikipedia)
- Add your project here
- Know of other projects? Drop a note or just make a pull request with the addition to this list :)

Usage
-----------
Typically you want to add this project as a git submodule (or just copy-paste src folder to your project) and add src project to qml imports via something like
`view->engine()->addImportPath(SailfishApp::pathTo("components/Mixpanel-qml/src").toString());`
(that is for Sailfish project. Full path to QML file in your project is then components/Mixpanel-qml/src/Mixpanel/Mixpanel.qml )

Then in your code you can do the following

    import Mixpanel 0.1
    Page {  // Or whatever other component you use
      Mixpanel {
       id: mx
       mixpanelToken: "123"  // Nothing works without it, get one at mixpanel.com
      }
        
    ...
    function coolEventHappened() {
      mx.track("cool event")
      mx.track("another event with params", {userLevel: "Top level"} )
    }


You may also like adding this path to QML_IMPORT_PATH so that Qt Creator would use autocompletion for Mixpanel as the test project is doing:
`QML_IMPORT_PATH += $$PWD/../src`

ToDo
----------
- Add some default token for quick starts, just post warnings if it's used
- Buffer events so that we won't make a request for every single call (can we timestamp individual ones then BTW?)
- And sent buffer ASAP if user wants so or on object destruction if possible
- And save buffered events to local storage in case app exits/crashes before events are sent

License
-----------
BSD (3 clause).
Pull requests are welcome.
