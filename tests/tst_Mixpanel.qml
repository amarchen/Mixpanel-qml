import QtQuick 2.0
import QtTest 1.0

import Mixpanel 0.1

TestCase {
    name: "Mixpanel tests"

    Component {
        id: mixpanelComponent
        Mixpanel {
            id: mx
            // Sample test project maintained by Artem. Use your own for development if you like
            // If you use this one, well, I'll just be getting notifications when somebody's developing with this module
            mixpanelToken: "d63a96616f0f32c2a4e7b17425bcd100"
        }
    }

    property variant mx: null

    function init() {
        mx = mixpanelComponent.createObject(null)
    }

    function cleanup() {
        mx.destroy()
        mx = null
    }


    function test_instantiated() {
        compare(mx.mixpanelToken, "d63a96616f0f32c2a4e7b17425bcd100", "If fails, Mixpanel (or something else in testcase) failed to instantiate")
    }

    function test_simpleTrack() {
        var objToSend = mx._objForTrack("sample event")

        var idealObjToSend = {"event":"sample event","properties":{"token":"d63a96616f0f32c2a4e7b17425bcd100","distinct_id":"d41d8cd98f00b204e9800998ecf8427e"}}
        compare(objToSend, idealObjToSend, "Formed wrong object for a simple event")
    }

    function test_ipIsPassedIfWanted() {
        mx.sendIp = true
        var objToSend = mx._objForTrack("sample event")

        var idealObjToSend = {"event":"sample event","properties":{"token":"d63a96616f0f32c2a4e7b17425bcd100",
                "distinct_id":"d41d8cd98f00b204e9800998ecf8427e",
                "ip":"1"}
        }
        compare(objToSend, idealObjToSend, "Formed wrong object for a simple event")
    }
}
