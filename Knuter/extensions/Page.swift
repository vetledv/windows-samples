import CWinRT

import WinUI

extension Page {
    func getTypeName() -> TypeName {
        return TypeName(name: "SettingsPage", kind: .primitive)
    }
}
