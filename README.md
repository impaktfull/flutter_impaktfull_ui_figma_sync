# impaktfull_ui_figma_sync

This is a tool to sync the impaktfull ui from figma to the codebase.

## Get started

- Duplicate the [figma file](https://www.figma.com/design/HE5iRqsLnYb9DpHIAyVN4C/impaktfull-ui---figma-sync---starter)
- Create a personal access token on figma
- Add the `impaktfull_ui_figma_sync` dependency to your `pubspec.yaml` file.
  ```yaml
  dependencies:
  impaktfull_ui_figma_sync: latest_version
  ```
- Add the pubspec config to your `pubspec.yaml` file.
  ```yaml
  impaktfull_ui_figma_sync:
    figma_file_key: your_figma_file_key_comes_here
    personal_access_token: your_personal_access_token_comes_here
  ```
- Run the tool with `dart bin/impaktfull_ui_figma_sync.dart`

## Implemented

- Nothing yes

## TODO

- [ ] Sync theme colors
- [ ] Sync dimensions
- [ ] Sync text styles
- [ ] Sync shadows
- [ ] Sync icons
- [ ] Pass a node id to sync only that node

## Other documentation

### Figma documentation

- https://www.figma.com/developers/api#intro

## Limitations

Figma requires an enterprise plan to access the variables over the API! (Which is super expensive in most cases) This is why we are using the `figma_sync` frame to sync the variables.
