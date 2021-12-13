import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fizzbuzz_provider.dart';

class FizzBuzzView extends StatelessWidget {
  const FizzBuzzView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FizzBuzzProvider(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'FizzBuzz Game',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      _TextInput(),
                      SizedBox(
                        height: 20,
                      ),
                      _Result(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TextInput extends StatelessWidget {
  const _TextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeIn(
          child: Text(
            'Type any number to see if it is Fizz, Buzz or FizzBuzz',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: context.read<FizzBuzzProvider>().formKeyRegister,
          child: TextFormField(
            onChanged: context.read<FizzBuzzProvider>().onTextFieldChanged,
            autocorrect: false,
            validator: (s) {
              if (s != null &&
                  int.tryParse(
                    s,
                  ) is int) {
                return null;
              }
              return 'Please enter a valid number';
            },
            keyboardType: TextInputType.number,
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.format_list_numbered,
                color: Color(0xff444444),
              ),
              hintText: 'Enter a number',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Result extends StatelessWidget {
  const _Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Result:',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 20,
        ),
        Selector<FizzBuzzProvider, String?>(
          selector: (_, p1) => p1.text,
          builder: (context, text, _) {
            return FadeInUp(
              child: Text(
                text ?? '',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          },
        ),
      ],
    );
  }
}
