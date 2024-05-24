import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grupoestudo/bloc/get_post/get_post_bloc.dart';
import 'package:grupoestudo/pages/components/my_text_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Novo APP"),
      ),
      body: Center(child:
          BlocBuilder<GetPostBloc, GetPostState>(builder: (context, state) {
        if (state is GetPostStateLoading) {
          return const CircularProgressIndicator();
        }
        if (state is GetPostStateErro) {
          return Text(state.message);
        }
        if (state is GetPostStateLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: state.post.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.amber,
                    child: Card(
                      child: ListTile(
                        leading: const FlutterLogo(size: 72.0),
                        title: MyText(msg: state.post[index].title),
                        subtitle: Text(""),
                        trailing: const Icon(Icons.more_vert),
                        isThreeLine: true,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
          );
        } else {
          return const Text("Falha Geral");
        }
      })),
    );
  }
}
