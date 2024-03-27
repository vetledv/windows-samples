import Foundation

import WinUI

import WindowsFoundation

import CWinRT

final class SettingsPage: Page {
    override init() {
        super.init()
        self.content = self.canvas
        self.tag = "SettingsPage"
        self.name = "SettingsPage"
    }

    lazy var canvas = {
        let canvas = Canvas()
        canvas.horizontalAlignment = .stretch
        canvas.verticalAlignment = .stretch
        return canvas
    }()
}
