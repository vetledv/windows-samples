import Foundation

import WinUI

import WindowsFoundation

final class SettingsPage: Page {
    override init() {
        super.init()
        self.content = self.canvas
    }

    lazy var canvas = {
        let canvas = Canvas()
        canvas.horizontalAlignment = .stretch
        canvas.verticalAlignment = .stretch
        return canvas
    }()
}