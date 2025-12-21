import SwiftUI

struct SettingsView: View {
    @Bindable var viewModel: SymbolBrowserViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Settings")
                .font(.headline)

            VStack(alignment: .leading, spacing: 8) {
                Text("Left Click Copy Format")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                ForEach(CopyFormat.allCases) { format in
                    Button {
                        viewModel.copyFormat = format
                    } label: {
                        HStack {
                            Image(
                                systemName: viewModel.copyFormat == format
                                    ? "circle.fill" : "circle"
                            )
                            .foregroundStyle(
                                viewModel.copyFormat == format
                                    ? Color.accentColor : .secondary
                            )
                            VStack(alignment: .leading, spacing: 2) {
                                Text(format.rawValue)
                                    .font(.body)
                                Text(format.description)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.primary)
                    .focusable(false)
                }
            }

            Divider()
            HStack {
                Text("Thanks for using Symbol Drop!")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                Spacer()
                Link(
                    "Github",
                    destination: URL(
                        string: "https://github.com/apedley/symboldrop"
                    )!
                )
                .font(.caption)
                .focusable(false)
            }
        }
        .padding(16)
        .frame(width: 350)
    }
}

#Preview {
    SettingsView(viewModel: SymbolBrowserViewModel())
}
