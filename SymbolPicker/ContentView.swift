//
//  ContentView.swift
//  SymbolPicker
//
//  Created by Andrew Pedley on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = SymbolBrowserViewModel()
    @FocusState private var isSearchFocused: Bool

    private let columns = [
        GridItem(.adaptive(minimum: 70, maximum: 80), spacing: 4)
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                TextField("Search symbols...", text: $viewModel.searchText)
                    .textFieldStyle(.plain)
                    .focused($isSearchFocused)

                if !viewModel.searchText.isEmpty {
                    Button {
                        viewModel.searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(8)
            .background(.quaternary)
            .cornerRadius(8)
            .padding(.horizontal, 12)
            .padding(.top, 12)
            .padding(.bottom, 8)

            // Category filter
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(viewModel.categories) { category in
                        CategoryButton(
                            category: category,
                            isSelected: viewModel.selectedCategory == category
                        ) {
                            viewModel.selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
            .padding(.bottom, 8)

            Divider()

            // Symbol count
            HStack {
                Text("\(viewModel.filteredSymbols.count) symbols")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 4)

            // Symbol grid
            ScrollView {
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(viewModel.filteredSymbols) { symbol in
                        SymbolGridItemView(
                            symbol: symbol,
                            isCopied: viewModel.lastCopiedSymbol?.id == symbol.id,
                            onCopy: {
                                viewModel.copySymbol(symbol)
                            }
                        )
                    }
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
        }
        .onAppear {
            isSearchFocused = true
        }
    }
}

struct CategoryButton: View {
    let category: SymbolCategory
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Image(systemName: category.icon)
                    .font(.caption)
                Text(category.rawValue)
                    .font(.caption)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(isSelected ? Color.accentColor : Color.secondary.opacity(0.2))
            .foregroundStyle(isSelected ? .white : .primary)
            .cornerRadius(6)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
        .frame(width: 400, height: 500)
}
