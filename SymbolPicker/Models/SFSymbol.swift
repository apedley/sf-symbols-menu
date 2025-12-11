import Foundation

struct SFSymbol: Identifiable, Hashable {
    let id: String  // The symbol name (e.g., "star.fill")
    let category: SymbolCategory

    var name: String { id }
}
