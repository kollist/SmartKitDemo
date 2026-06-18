# SmartKitDemo

A small iOS app showing [SmartKit](https://github.com/kollist/SmartKit) in use.

Two tabs:

- **Summary** — edit the text in the box and watch `SummaryView` stream a live summary.
- **Tags** — edit the item list (one per line) and watch `SmartTagView` sort them into categories.

On a device/OS/region without Apple Intelligence enabled, both tabs still work — they just show SmartKit's plain fallback behavior (truncated summary / single ungrouped list) instead of the AI-generated version.

## Running it

```sh
git clone https://github.com/kollist/SmartKitDemo.git
cd SmartKitDemo
open SmartKitDemo.xcodeproj
```

Pick a simulator (or your own device) and hit Run. Requires Xcode 26+; targets iOS 17+.

To run on a physical device, open the project's Signing & Capabilities tab and select your own Development Team — Xcode can't pick one for you.

The project is generated with [XcodeGen](https://github.com/yonaskolb/XcodeGen) from `project.yml`. If you change `project.yml`, regenerate with `xcodegen generate`.

Note: in iOS Simulator, on-device model inference runs without Neural Engine acceleration, so generation can be much slower than on a real device.

## License

MIT — see [LICENSE](LICENSE).
