import Foundation

import Observation

import WinAppSDK

import WinUI

import WindowsFoundation

final class MainPage: Page {
    override init() {
        super.init()
        self.content = self.stackPanel
    }

    var h = Hello.shared

    lazy var stackPanel = {
        let stackPanel = StackPanel()
        stackPanel.children.append(self.button)
        return stackPanel
    }()

    lazy var button = {
        let button = Button()
        button.click.addHandler { _, _ in
            debugPrint(self.h.counter)
            self.h.counter += 1
        }
        button.updateContent {
            String(self.h.counter)
        }
        return button
    }()
}

extension Button {
    //taken from https://github.com/thebrowsercompany/windows-samples/issues/14#issuecomment-1977398567
    func updateContent(_ content: @escaping () -> String) {
        withObservationTracking {
            self.content = content()
        } onChange: {
            // We need to defer updating content since this closure is executed **before** the observed state
            // has been updated.
            //
            // Also, `onChange` is invoked once for each `withObservationTracking` call so we need to
            // recursively call `updateContent`.
            guard let dispatcherQueue = WinAppSDK.DispatcherQueue.getForCurrentThread() else {
                return
            }
            let _ = try! dispatcherQueue.tryEnqueue {
                self.updateContent(content)
            }
        }
    }
}
