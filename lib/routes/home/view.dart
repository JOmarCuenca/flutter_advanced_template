import 'package:flutter/material.dart';
import 'package:flutter_advanced_template/generated/l10n.dart';
import 'package:flutter_advanced_template/services/version.service.dart';
import 'package:flutter_advanced_template/widgets/text/h1.widget.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/stateless.view.dart';

import 'view.model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => _HomeView(),
      viewModel: HomeViewModel(),
    );
  }
}

class _HomeView extends StatelessView<HomeViewModel> {
  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                const H1("Current app version"),
                FutureBuilder(
                  future: AppVersionService.appVersion,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(snapshot.data ?? S.current.loadingDots);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              viewModel.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _EasterEgg(
                count: viewModel.counter,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _EasterEgg extends StatelessWidget {
  final int count;

  const _EasterEgg({required this.count});

  @override
  Widget build(BuildContext context) {
    String? message;
    if (count == 0) message = "And so it begins..";
    if (count == 42) message = "Could it be the answer?";
    if (count == 66) message = "Do it...";
    if (count == 69) message = "Nice ;)";
    if (count == 420) message = "yeee..";
    return (message?.isNotEmpty == true)
        ? Padding(
            padding: const EdgeInsets.all(8),
            child: H1Heavy(message!),
          )
        : const SizedBox.shrink();
  }
}
