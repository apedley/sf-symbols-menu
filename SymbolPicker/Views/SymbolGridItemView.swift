import SwiftUI

struct SymbolGridItemView: View {
    let symbol: SFSymbol
    let isCopied: Bool
    let onCopy: () -> Void

    @State private var isHovered = false

    var body: some View {
        Button(action: onCopy) {
            VStack(spacing: 4) {
                ZStack {
                    Image(systemName: symbol.name)
                        .font(.system(size: 24))
                        .frame(width: 44, height: 44)
                        .foregroundStyle(isCopied ? .green : .primary)

                    if isCopied {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundStyle(.green)
                            .offset(x: 16, y: -16)
                    }
                }

                if isHovered || isCopied {
                    Text(isCopied ? "Copied!" : symbol.name)
                        .font(.caption2)
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundStyle(isCopied ? .green : .secondary)
                } else {
                    Text(" ")
                        .font(.caption2)
                }
            }
            .frame(width: 70, height: 70)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isHovered ? Color.accentColor.opacity(0.1) : Color.clear)
            )
        }
        .buttonStyle(.plain)
        .onHover { hovering in
            isHovered = hovering
        }
        .help(symbol.name)
    }
}

#Preview {
    HStack {
        SymbolGridItemView(
            symbol: SFSymbol(id: "star.fill", category: .general),
            isCopied: false,
            onCopy: {}
        )
        SymbolGridItemView(
            symbol: SFSymbol(id: "heart.fill", category: .general),
            isCopied: true,
            onCopy: {}
        )
    }
    .padding()
}
