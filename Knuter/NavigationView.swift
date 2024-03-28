import Foundation

import UWP

import WinAppSDK

import WinSDK

import WinUI

import WindowsFoundation

final class KnuterNavView: NavigationView {
    override init() {
        super.init()
        self.setup()
    }

    lazy var contentFrame = {
        let frame = Frame()
        frame.name = "content-frame"
        return frame
    }()

    lazy var settingsPage: SettingsPage = .init()
    lazy var mainPage: MainPage = .init()
    lazy var secondPage: SecondPage = .init()

    lazy var mainPageNavItem = {
        let navItem = NavigationViewItem()
        navItem.name = "n-home"
        navItem.tag = String("MainPage")
        navItem.content = "Home"
        return navItem
    }()

    lazy var secondPageNavItem = {
        let navItem = NavigationViewItem()
        navItem.name = "n-second"
        navItem.tag = String("SecondPage")
        navItem.content = "Second"
        return navItem
    }()

    func setup() {
        self.paneTitle = "Nav"
        self.paneDisplayMode = .left
        self.isBackButtonVisible = .init(0)
        self.isBackEnabled = false

        self.menuItems.append(self.mainPageNavItem)
        self.menuItems.append(self.secondPageNavItem)
        self.content = self.contentFrame

        //default select home
        self.selectedItem = self.menuItems[0]
        self.header = "Home"

        // self.contentFrame.content = self.mainPage

        self.selectionChanged.addHandler { [weak self] (view, args) in
            //TODO: figure out how to do navigation properly
            guard
                let self,
                let view,
                let args
            else { return }
            if args.isSettingsSelected {
                self.content = self.settingsPage
                // self?.navigate(self?.settingsPage, args)
                view.header = "Settings"
                return
            }

            guard let item = view.selectedItem as? NavigationViewItem else { return }
            switch item.name {
            case self.mainPageNavItem.name:
                self.content = self.mainPage
                // self?.navigate(self?.mainPage, args)
                view.header = "Home"
            case self.secondPageNavItem.name:
                self.content = self.secondPage
                // self?.navigate(self?.secondPage, args)
                view.header = "Second"
            default:
                return
            }
            return
        }
    }

    func navigate(_ page: Page?, _ args: NavigationViewSelectionChangedEventArgs) {
        guard let page = page else { return }
        do {
            let _ = try self.contentFrame.navigate(
                page.getTypeName(),
                nil,
                args.recommendedNavigationTransitionInfo
            )
        } catch {
            debugPrint("\(page.name) nav error: \(error)")
        }
    }
}
