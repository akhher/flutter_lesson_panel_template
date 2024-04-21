import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({
    super.key,
  });

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'Hr6Yni61rc0',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    // Add listener to update _isFullScreen when fullscreen mode changes
    _controller.addListener(() {
      setState(() {
        _isFullScreen = _controller.value.isFullScreen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
            builder: (context, player) {
              return SizedBox(
                height: _isFullScreen
                    ? MediaQuery.of(context).size.height * 1
                    : MediaQuery.of(context).size.height * 0.27,
                child: player,
              );
            },
          ),
          if (!_isFullScreen)
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Text(
                              'Lorem ipsum dolor sit amet consectetur adipisicing elit. A libero veritatis doloremque, delectus praesentium vel nobis dignissimos quidem non magnam nulla dolorem ea blanditiis, placeat accusamus excepturi porro fugit nisi sunt qui. Doloremque corrupti modi consequatur fuga porro, rerum officia incidunt dolores perferendis alias ipsum quis eveniet repudiandae? Doloremque deleniti dolorum illum cum accusantium quasi, nesciunt quas optio dignissimos adipisci soluta beatae consequuntur delectus placeat rerum aliquid sapiente veniam atque nihil suscipit! Facere voluptates illo iure repellendus eum dolore minima alias laborum cupiditate, quae possimus ratione, aspernatur corrupti aliquam quaerat at esse magnam sapiente maiores? Molestias laborum perspiciatis perferendis doloremque a aut, aliquam quia eius voluptatibus fugiat necessitatibus eveniet pariatur accusantium doloribus hic recusandae repellat sed non, voluptas cumque velit modi voluptates. Veniam voluptate, voluptatum iure perferendis explicabo sunt sequi, aperiam quidem labore consequuntur dolore minus. Facere id quo obcaecati praesentium harum, exercitationem tempora natus accusantium sequi inventore? Deleniti minima earum dolorum quam molestias, perspiciatis consectetur dolor tempora ipsum pariatur corrupti rem sed iusto vitae error fuga expedita tenetur aliquam modi laborum ab suscipit? Unde neque nesciunt exercitationem fuga quibusdam in aliquam dolorem corrupti aliquid explicabo minima qui, sed dignissimos saepe excepturi aut minus perspiciatis dolorum cupiditate laborum rerum animi sunt maxime! Reprehenderit repudiandae mollitia nostrum eveniet ex libero, architecto officiis. Facere distinctio quaerat suscipit aspernatur. Debitis id similique impedit aut eum. Odio, expedita blanditiis officia excepturi molestiae, vitae maxime ratione temporibus possimus ab suscipit labore. Doloremque dolores est nihil odio cumque modi saepe, fuga consectetur voluptatum, minima suscipit nesciunt repellendus excepturi veniam repudiandae reiciendis ipsa similique ex itaque facere eaque labore! Fugiat perferendis, voluptate tenetur odit porro deleniti iste assumenda vitae aliquid. Ducimus nisi commodi quo deleniti quas, provident perferendis repellat incidunt asperiores laboriosam, laborum mollitia. Eius cum et eveniet facilis sunt harum mollitia saepe non excepturi beatae quam quo, voluptatum modi, dolorem asperiores accusantium cupiditate, culpa unde. Quas fugiat vitae, nemo blanditiis doloremque deserunt beatae perferendis quae qui, soluta quisquam inventore nihil similique ipsa minima provident tenetur adipisci harum excepturi? Inventore aliquam debitis nesciunt dolor vero, magni dolorem, nam molestiae earum sequi sint, tempore sit sunt ex repellat obcaecati repudiandae voluptatem dicta aspernatur! Eos quidem iure magnam tenetur ullam veniam excepturi harum corporis tempore, amet tempora aliquam molestiae, soluta similique quam officiis. Eligendi deserunt, veniam architecto laudantium quis quo, accusantium nihil iste soluta facere delectus nulla ab laborum, saepe qui molestiae similique odio pariatur consectetur sed! Consequuntur neque ut doloribus accusantium sed perferendis, laborum non modi sunt eaque pariatur totam iste tenetur veritatis consequatur. Dolorum odio vel autem nobis, praesentium sed, illum, sapiente voluptatem eveniet id excepturi aliquid debitis tempora similique dicta. Temporibus dolor itaque eius non consequuntur vel dicta qui, quisquam ab, esse voluptate dolores adipisci deserunt repudiandae vero reprehenderit aliquid eum. Necessitatibus nobis veniam voluptatibus corporis sit sed temporibus laborum inventore nihil cum commodi eaque doloremque velit hic maxime voluptate fuga incidunt voluptatem, ad quisquam repellat exercitationem? Reiciendis ratione autem nihil architecto eius animi, minus rem ipsum, eligendi sapiente qui delectus tenetur deleniti. Iure, nam libero?')),
                    ),
                  ),
                  // Conditionally show the download link container
                  Link(
                    target: LinkTarget.blank,
                    uri:
                        Uri.parse('https://github.com/akhher?tab=repositories'),
                    builder: (context, followLink) {
                      return InkWell(
                        onTap: followLink,
                        child: Container(
                          height: 50,
                          color: Colors.blue[400],
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Download Module',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
