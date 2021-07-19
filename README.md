# Bones_UI - DEMO App

A demo web app using [bones_ui] and [bones_ui_bootstrap].

[bones_ui]: https://pub.dev/packages/bones_ui
[bones_ui_bootstrap]: https://pub.dev/packages/bones_ui_bootstrap

# webdev

You can use the [webdev] tool to run the project or build it.

[webdev]: https://pub.dev/packages/webdev

First, activate [webdev]:

```bash
 $> dart pub global activate webdev
```

Export `pub` cache `bin` directory if needed:
```bash
 $> export PATH="$PATH":"$HOME/.pub-cache/bin"
```

- Ensure that you are using the last [Dart][get_dart] version.

[get_dart]: https://dart.dev/get-dart

## Running in Development Mode

Just run [webdev] `serve`.

```bash
 $> webdev serve
```

If you need to access from another device:

```bash
  $> webdev serve --hostname 0.0.0.0"
```

To force the compiler into release mode:

```bash
  $> webdev serve --release
```

- Also take a look at file: `run_webdev_serve.sh`

# Build in Release Mode

Just run [webdev] `build`.

```bash
 $> webdev build --release
```

- Also take a look at file: `run_webdev_build.sh`


# Author

Graciliano M. Passos: [gmpassos@GitHub][github].

[github]: https://github.com/gmpassos

## License

[Apache License - Version 2.0][apache_license]

[apache_license]: https://www.apache.org/licenses/LICENSE-2.0.txt
