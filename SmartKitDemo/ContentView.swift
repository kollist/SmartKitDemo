import SwiftUI
import SmartKit

struct ContentView: View {
    @State private var articleText = """
    The James Webb Space Telescope has captured its most detailed image yet of the \
    Pillars of Creation, revealing thousands of newly formed stars hidden within dense \
    columns of gas and dust. Researchers say the unprecedented resolution will help \
    refine models of how massive stars form and how their radiation reshapes the \
    surrounding nebula over millions of years.
    """

    @State private var itemsText = """
    Milk
    Eggs
    Finish quarterly report
    Book dentist appointment
    Bread
    Review pull request
    Call plumber
    """

    var body: some View {
        TabView {
            summaryTab
                .tabItem { Label("Summary", systemImage: "text.alignleft") }
            tagsTab
                .tabItem { Label("Tags", systemImage: "tag") }
        }
    }

    private var summaryTab: some View {
        NavigationStack {
            Form {
                Section("Paste or edit text") {
                    TextEditor(text: $articleText)
                        .frame(height: 160)
                }
                Section("Summary") {
                    SummaryView(text: articleText)
                }
            }
            .navigationTitle("Summary")
        }
    }

    private var tagsTab: some View {
        NavigationStack {
            Form {
                Section("One item per line") {
                    TextEditor(text: $itemsText)
                        .frame(height: 160)
                }
                Section("Categorized") {
                    SmartTagView(items: parsedItems)
                }
            }
            .navigationTitle("Tags")
        }
    }

    private var parsedItems: [String] {
        itemsText
            .split(separator: "\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { $0.isEmpty == false }
    }
}
