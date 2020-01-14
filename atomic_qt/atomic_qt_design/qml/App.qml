import QtQuick 2.12
import QtQuick.Layouts 1.3
import "Screens"
import "Constants"
import "Components"

Rectangle {
    color: "#1E2938"

    function firstPage() {
        return MockAPI.getAtomicApp().first_run() ? idx_first_launch : idx_login
    }

    readonly property int idx_first_launch: 0
    readonly property int idx_recover_seed: 1
    readonly property int idx_new_user: 2
    readonly property int idx_login: 3
    readonly property int idx_dashboard: 4
    property int current_page: firstPage()

    StackLayout {
        anchors.fill: parent

        currentIndex: current_page

        FirstLaunch {
            function onClickedNewUser() { current_page = idx_new_user }
            function onClickedRecoverSeed() { current_page = idx_recover_seed }
        }

        RecoverSeed {
            function onClickedBack() { current_page = firstPage() }
            function postConfirmSuccess() { current_page = firstPage() }
        }

        NewUser {
            function onClickedBack() { current_page = idx_first_launch }
            function postCreateSuccess() { current_page = firstPage() }
        }

        Login {
            function onClickedRecoverSeed() { current_page = idx_recover_seed }
            function postLoginSuccess() { current_page = idx_dashboard }
        }

        Item {
            DefaultText {
                text: "Very Minimalistic Dashboard"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/