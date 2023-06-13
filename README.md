# Flutter Advanced Template

IDK about you, but I'm tired of re-creating flutter projects and installing basic dependencies for my projects.

I created this free template if you wanna skip all that.

## Additional Features

### Actions

I added a simple Github Action so that when pushes to the main branch of your project, all unit tests are running, to let you know when something is broken.

## Useful commands

### Generate string utils from `.arb` files

In order to use the `S` class that holds the string values of the `.arb` files, you'll need to run this command manually everytime you update the `.arb` file.

Optionally if you are using **VSCode** you can install **Flutter Intl** package, which automatically detects when changes are made in those files, and autogenerates in almost realtime to keep the utility updated.

```bash
 dart run intl_utils:generate
```

### Generate Hive Adapters

Everytime you add a Hive object to be stored, it needs to have and adapter 

```bash
 dart run build_runner build --delete-conflicting-outputs
```