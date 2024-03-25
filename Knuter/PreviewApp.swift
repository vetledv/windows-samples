import Foundation

import Observation

import UWP

import WinAppSDK

import WinUI

import WindowsFoundation

@main
public class PreviewApp: SwiftApplication {

    lazy var window: ContentView = .init()

    public required init() {
        super.init()
        unhandledException.addHandler { (_, args: UnhandledExceptionEventArgs!) in
            print("Unhandled exception: \(args.message)")
        }
    }

    override public func onShutdown() {}

    override public func onLaunched(_ args: WinUI.LaunchActivatedEventArgs) {
        try! window.activate()
    }
}
