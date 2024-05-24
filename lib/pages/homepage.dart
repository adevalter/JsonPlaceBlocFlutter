import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grupoestudo/bloc/get_post_bloc.dart';
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
        body: Center(
          child: BlocBuilder<GetPostBloc, GetPostState>(
            builder: (context, state) {
              if (state is GetPostStateLoading) {
                return CircularProgressIndicator();
              }
              if (state is GetPostStateError) {
                return MyText(msg: "Erro Fatal");
              }
              if (state is GetPostStateLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: state.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 100,
                          color: Colors.amber,
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: MyText(
                                    msg: state.posts[index].id.toString()),
                              ),
                              title: MyText(msg: state.posts[index].title),
                              subtitle: MyText(
                                msg: state.posts[index].body,
                              ),
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
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
