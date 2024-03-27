import Foundation

import WinUI

import WindowsFoundation

final class KnuterNavView: NavigationView {
    override init() {
        super.init()
        self.paneTitle = "Nav"
        self.paneDisplayMode = .left
        self.isBackButtonVisible = .auto
        self.menuItems.append(self.mainFrameNavItem)
        self.selectedItem = self.menuItems[0]
        self.content = self.contentFrame
    }

    lazy var mainFrameNavItem = {
        let navItem = NavigationViewItem()
        navItem.tag = "Home"
        navItem.content = "Home view"
        return navItem
    }()

    lazy var contentFrame = {
        let frame = Frame()
        frame.tag = "content-view"
        return frame
    }()
}
