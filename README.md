# Homebrew tap for Tachiko Sheet

```sh
brew install --cask nurockplayer/tap/tachiko-sheet
```

Apple Silicon Macs on macOS 13 or later. Current builds are early previews.

Tachiko Sheet is ad-hoc signed and not notarized by Apple, so macOS blocks the
first launch. Try to open the app once, then go to **System Settings → Privacy &
Security** and choose **Open Anyway**. Installing through Homebrew does not change this.

`brew uninstall --cask tachiko-sheet` removes the app and keeps your work.
`--zap` also deletes the app's local WebKit profile, including work saved there.

## Maintenance

`Casks/tachiko-sheet.rb` is updated by the
[release workflow](https://github.com/nurockplayer/tachiko-sheet/blob/main/.github/workflows/update-cask.yml)
in tachiko-sheet. Only its `version` and `sha256` lines change there.

CI checks style, audit and an install on a macOS runner. It cannot check the
Gatekeeper prompt: after a release, run the install above on a Mac by hand, open
the app once and allow it as described.
