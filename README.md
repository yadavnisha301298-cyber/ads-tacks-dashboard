# Adstacks Office Dashboard

A fully responsive **office dashboard** built with Flutter, recreating the
provided Adstacks design pixel-for-pixel while running on **Android, iOS, Web,
Windows, macOS and Linux** from a single codebase.

Built with Clean Architecture, SOLID principles, Riverpod, GoRouter, Freezed and
fl_chart.

---

## ✨ Features

- **Adaptive, not just scaled** layouts for mobile / tablet / desktop:
  - **Desktop (> 1024):** permanent sidebar + main content + right panel (3-column).
  - **Tablet (600–1024):** collapsed icon rail + 2-column cards, right panel below.
  - **Mobile (< 600):** drawer navigation + single-column, chart resizes fluidly.
- Pixel-accurate recreation of every section in the brief:
  - Sidebar (logo, profile, navigation, workspaces, settings, logout)
  - Top bar (search, messages, notifications, theme/power, avatar)
  - Gradient **hero card** with floating abstract shapes
  - **All Projects** list with the featured (red) tile
  - **Top Creators** table with animated rating bars
  - **Over All Performance** interactive line chart (legend, tooltips, years)
  - Monthly **calendar** with today highlighting
  - **Birthday** & **Anniversary** cards with avatar stacks and CTAs
- **Light & dark themes** via a centralized theme system + `ThemeExtension`.
- Tasteful animations: hover scale (web/desktop), fade-in hero, staggered list
  entrance, animated rating/chart, page fade transitions, animated sidebar width.
- Accessibility: semantic labels, tooltips, keyboard-focusable controls,
  ≥ 48px touch targets.

## 🧱 Architecture

Feature-first **Clean Architecture** with a strict dependency rule
(`presentation → domain ← data`; the domain depends on nothing):

```
lib/
├── core/                      # cross-cutting, feature-agnostic
│   ├── constants/             # spacing, radius, breakpoints, sizes, asset paths
│   ├── theme/                 # AppColors, AppTypography, AppTheme, extensions
│   ├── router/                # GoRouter config + routes + nav destinations
│   ├── network/               # Dio client (ready for a real backend)
│   ├── errors/                # Exceptions + typed Failures
│   ├── services/              # AssetBundleService (testable rootBundle)
│   ├── di/                    # Riverpod dependency-injection providers
│   ├── extensions/            # BuildContext helpers (theme + responsive)
│   ├── utils/                 # Responsive helpers, Result<T> (Either-like)
│   └── widgets/               # Reusable UI (DashboardCard, ProfileAvatar, …)
│
└── features/
    ├── dashboard/
    │   ├── data/              # models (Freezed), datasource, repositories impl
    │   ├── domain/            # entities, repository contracts, use cases
    │   └── presentation/      # providers, pages, widgets
    └── shell/
        └── presentation/      # AppShell, Sidebar, TopBar (persistent chrome)
```

**Patterns used:** Repository Pattern, Dependency Inversion, Use Cases,
Result/Either error handling, and Riverpod for DI + state. No business logic
lives inside widgets — they only `watch` providers.

## 🛠 Tech Stack

| Concern            | Package |
|--------------------|---------|
| State management   | `flutter_riverpod` |
| Routing            | `go_router` |
| Immutable models   | `freezed_annotation` + `json_serializable` |
| Networking         | `dio` |
| Responsiveness     | `responsive_framework`, `flutter_screenutil` |
| Charts             | `fl_chart` |
| Fonts              | `google_fonts` (Poppins) |
| Vector assets      | `flutter_svg` |

Material 3, Dart 3, full null-safety, lint-clean (`flutter analyze` → 0 issues).

## 🚀 Getting Started

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate Freezed / json_serializable code
dart run build_runner build --delete-conflicting-outputs

# 3. Run (choose a device)
flutter run -d chrome      # Web
flutter run -d macos       # Desktop
flutter run                # Android / iOS emulator
```

> Re-run step 2 after changing any model (adds/updates the `*.freezed.dart` /
> `*.g.dart` files).

## 📊 Mock Data

The dashboard reads a bundled JSON payload from
[`assets/data/dashboard.json`](assets/data/dashboard.json) through an
`AssetBundleService`, emulating a REST API. Swapping to a live backend only
requires a `DashboardRemoteDataSource` implementing the same interface — nothing
else in the app changes (that is the point of the architecture).

## 🌐 Web Deployment

### Option A — Firebase Hosting

```bash
# One-time
npm install -g firebase-tools
firebase login

# Point .firebaserc at your project id, then:
flutter build web --release
firebase deploy --only hosting
```

`firebase.json` is preconfigured to serve `build/web`, SPA-rewrite all routes to
`index.html`, and set long-lived caching for hashed assets.

### Option B — Vercel

`vercel.json` builds Flutter web on Vercel's build image and serves `build/web`.

```bash
npm install -g vercel
vercel            # preview
vercel --prod     # production
```

Alternatively, build locally and deploy the static output:

```bash
flutter build web --release
vercel deploy build/web --prod
```

## 🎨 Theming

All colours flow from `AppColors` → `ColorScheme` + the `DashboardColors`
`ThemeExtension` (gradients, navy panels, chart colours, shadows). **No widget
hardcodes a colour.** Toggle light/dark from the top bar (power/theme icon).

## ✅ Quality

- `flutter analyze` — no issues.
- `flutter build web --release` — succeeds.
- Small, single-responsibility, mostly `const` `Stateless` widgets.
- `RepaintBoundary` around the chart; `.select` on providers to minimise rebuilds.

## 📁 Notes on Assets

Image/icon/avatar folders under `assets/` are placeholders — avatars and project
thumbnails gracefully fall back to generated monograms/gradients, so the app
looks complete with zero binary assets. Drop real files in and reference them via
`AssetPaths` to replace the fallbacks.
