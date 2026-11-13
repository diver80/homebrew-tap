# diver80 Homebrew Tap

Official Homebrew tap for applications and utilities by diver80.

## Installation

To install **Jira Quick Access**:

```bash
brew install --cask diver80/tap/jira-quick-access
```


To upgrade:

```bash
brew upgrade --cask jira-quick-access
```

To uninstall:

```bash
brew uninstall --cask jira-quick-access
```

To install **OmaMac** (menu bar status panels, Jira Quick-Access & Atlassian status):

```bash
brew install --cask diver80/tap/omamac
```

OmaMac updates itself; `brew upgrade --cask omamac` works as well.

To install **OmaThunder** (Omarchy themes, AI writing assistant and mail triage for Thunderbird):

```bash
brew install diver80/tap/omathunder
omathunder setup
```

Then install the add-on in Thunderbird from `$(brew --prefix)/opt/omathunder/share/omathunder/omathunder-extension.xpi`
(Add-ons and Themes → gear icon → Install Add-on From File). Details: https://github.com/diver80/omathunder
