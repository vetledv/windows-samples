import CWinRT

import WinUI

extension Page {
    func getTypeName() -> TypeName {
        return TypeName(name: "Microsoft.UI.Xaml.Controls.Page", kind: .primitive)
    }
}
