import Foundation

import UWP

import WinAppSDK

import WinUI

import WindowsFoundation

@_spi(WinRTImplements) import WindowsFoundation

final class KnuterNavView: NavigationView {
    override init() {
        super.init()
        self.setup()
    }

    func setup() {
        self.paneTitle = "Nav"
        self.paneDisplayMode = .left
        self.isBackButtonVisible = .auto

        self.menuItems.append(self.mainPageNavItem)
        self.menuItems.append(self.secondPageNavItem)
        self.content = self.contentFrame

        //default select home
        self.selectedItem = self.menuItems[0]
        self.header = "Home"

        self.selectionChanged.addHandler { [weak self] (v, a) in
            //TODO: figure out how to do navigation properly

            guard
                let cf = self?.contentFrame,
                let view = v,
                let args = a
            else { return }

            if args.isSettingsSelected {
                view.header = "Settings"
                cf.content = SettingsPage()
                return
            }

            guard let item = view.selectedItem as? NavigationViewItem else { return }
            
            if item.name == self?.mainPageNavItem.name {
                view.header = "Home"
                cf.content = MainPage()
                return
            }
            if item.name == self?.secondPageNavItem.name {
                view.header = "Second"
                cf.content = SecondPage()
                return
            }
        }
    }

    lazy var mainPageNavItem = {
        let navItem = NavigationViewItem()
        navItem.name = "n-home"
        navItem.tag = String("n-home")
        navItem.content = "Home"
        return navItem
    }()

    lazy var secondPageNavItem = {
        let navItem = NavigationViewItem()
        navItem.name = "n-second"
        navItem.tag = String("n-second")
        navItem.content = "Second"
        return navItem
    }()

    lazy var contentFrame = {
        let frame = Frame()
        frame.tag = "content-view"
        frame.content = MainPage()
        return frame
    }()
}
