import Foundation

import WinUI

import WindowsFoundation

final class ContentView: Window {
    override init() {
        super.init()
        self.setup()
    }

    func setup() {
        self.title = "Knuter"
        self.extendsContentIntoTitleBar = true
        self.content = KnuterNavView()

        let backdrop = MicaBackdrop()
        backdrop.kind = .base
        self.systemBackdrop = backdrop
    }
}
