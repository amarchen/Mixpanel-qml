import QtQuick 2.0
import QtTest 1.0

import Mixpanel 0.1

TestCase {
    name: "Mixpanel tests"

    Mixpanel {
        id: mx
        mixpanelToken: "123"
    }

    function test_instantiated() {
        compare(mx.mixpanelToken, "123", "If fails, Mixpanel (or something else in testcase) failed to instantiate")
    }

    function test_simpleTrack() {
        var objToSend = mx._objForTrack("sample event")

        var idealObjToSend = {"event":"sample event","properties":{"token":"123","distinct_id":"d41d8cd98f00b204e9800998ecf8427e"}}
        compare(objToSend, idealObjToSend, "Formed wrong object for a simple event")
    }
}
