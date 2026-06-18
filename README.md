# SmartKitDemo

A small macOS app showing [SmartKit](https://github.com/kollist/SmartKit) in use.

Two tabs:

- **Summary** — edit the text in the box and watch `SummaryView` stream a live summary.
- **Tags** — edit the item list (one per line) and watch `SmartTagView` sort them into categories.

On a Mac without Apple Intelligence enabled, both tabs still work — they just show SmartKit's plain fallback behavior (truncated summary / single ungrouped list) instead of the AI-generated version.

## Running it

```sh
git clone https://github.com/kollist/SmartKitDemo.git
cd SmartKitDemo
swift run
```

Requires Xcode 26+ to build. Works on macOS 14+; on macOS 26+ with Apple Intelligence turned on, you'll see the real on-device output instead of the fallback.

## License

MIT — see [LICENSE](LICENSE).
