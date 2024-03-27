import Foundation

import WinUI

class ContentView: Window {

    override init() {
        super.init()
        self.setup()
    }

    lazy var navigationView = {
        let view = NavigationView()
        view.paneTitle = "Knuter"
        view.paneDisplayMode = .left
        view.isBackButtonVisible = .auto
        view.content = self.mainFrame
        return view
    }()

    lazy var mainFrame = {
        let frame = Frame()
        frame.content = self.stackPanel
        return frame
    }()

    lazy var stackPanel = {
        let panel = StackPanel()
        panel.orientation = .vertical
        panel.spacing = 10
        panel.horizontalAlignment = .center
        panel.verticalAlignment = .center
        panel.children.append(self.testButton)
        return panel
    }()

    lazy var testButton = {
        let h = Hello.shared
        let button = Button()
        button.content = h.asd
        return button
    }()

    func setup() {
        let backdrop = MicaBackdrop()
        backdrop.kind = .base

        self.title = "Knuter"
        self.extendsContentIntoTitleBar = true
        self.content = self.navigationView
        self.systemBackdrop = backdrop
    }
}
