import Foundation

import WinUI

import WindowsFoundation

final class SecondPage: Page {
    override init() {
        super.init()
        self.content = self.stackPanel
    }

    lazy var stackPanel = {
        let stackPanel = StackPanel()
        stackPanel.children.append(self.button)
        return stackPanel
    }()

    lazy var button = {
        let button = Button()
        button.content = "Test second page"
        return button
    }()
}