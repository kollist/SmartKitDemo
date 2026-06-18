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
        .padding()
        .frame(width: 480, height: 460)
    }

    private var summaryTab: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Paste or edit text below:")
                .font(.headline)
            TextEditor(text: $articleText)
                .frame(height: 140)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.separator))

            Divider()

            Text("Summary")
                .font(.headline)
            ScrollView {
                SummaryView(text: articleText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }

    private var tagsTab: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("One item per line:")
                .font(.headline)
            TextEditor(text: $itemsText)
                .frame(height: 140)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.separator))

            Divider()

            Text("Categorized")
                .font(.headline)
            ScrollView {
                SmartTagView(items: parsedItems)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }

    private var parsedItems: [String] {
        itemsText
            .split(separator: "\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { $0.isEmpty == false }
    }
}
