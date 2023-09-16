part of dash_chat_2;

/// @nodoc
class MediaContainer extends StatelessWidget {
  const MediaContainer({
    required this.message,
    required this.isOwnMessage,
    this.messageOptions = const MessageOptions(),
    Key? key,
  }) : super(key: key);

  /// Message that contains the media to show
  final ChatMessage message;

  /// If the message is from the current user
  final bool isOwnMessage;

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;

  /// Get the right media widget according to its type
  Widget _getMedia(
    BuildContext context,
    ChatMedia media,
    double? height,
    double? width,
  ) {
    final Widget loading = Container(
      width: 15,
      height: 15,
      margin: const EdgeInsets.all(10),
      child: const CircularProgressIndicator(),
    );
    switch (media.type) {
      case MediaType.video:
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            VideoPlayer(url: media.url, key: GlobalKey()),
            if (media.isUploading) loading
          ],
        );
      case MediaType.image:
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            Image(
              height: height,
              width: width,
              fit: BoxFit.cover,
              alignment: isOwnMessage ? Alignment.topRight : Alignment.topLeft,
              image: getImageProvider(media.url),
            ),
            if (media.isUploading) loading
          ],
        );
      default:
        return !isOwnMessage && message.customProperties!['type'] == 2
            ? TextContainer(
                isOwnMessage: isOwnMessage,
                messageOptions: messageOptions,
                message: message,
                messageTextBuilder:
                    (ChatMessage m, ChatMessage? p, ChatMessage? n) {
                  final span = TextSpan(text: media.fileName);
                  final tp =
                      TextPainter(text: span, textDirection: TextDirection.ltr);
                  tp.layout(
                      maxWidth:
                          (MediaQuery.of(context).size.width * 0.68) - 80);
                  final numLines = tp.computeLineMetrics().length;

                  return Stack(
                    fit: StackFit.loose,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            '${message.user.firstName} ${message.user.lastName} CV',
                            style: const TextStyle(
                              color: Color(0xCC212427),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 7),
                          InkWell(
                            onTap: () {
                              if (!message.medias!.first.url
                                      .startsWith('http://') &&
                                  !message.medias!.first.url
                                      .startsWith('https://')) {
                                message.medias!.first.url =
                                    'http://${message.medias!.first.url}';
                              }
                              launchUrl(Uri.parse(message.medias!.first.url),
                                  mode: LaunchMode.externalApplication);
                            },
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: !media.isUploading
                                      ? SvgPicture.asset(
                                          "assets/doc.svg",
                                          package: "dash_chat_2",
                                        )
                                      : loading,
                                ),
                                Flexible(
                                  child: Text(
                                    media.fileName,
                                    style: TextStyle(
                                      color: isOwnMessage
                                          ? messageOptions
                                              .currentUserTextColor(context)
                                          : const Color(0xFF0077B5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          if (numLines > 1)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: messageOptions.timePadding,
                                  child: Text(
                                    (messageOptions.timeFormat ??
                                            intl.DateFormat('HH:mm'))
                                        .format(message.createdAt),
                                    style: TextStyle(
                                      color: isOwnMessage
                                          ? messageOptions
                                              .currentUserTimeTextColor(context)
                                          : messageOptions.timeTextColor(),
                                      fontSize: messageOptions.timeFontSize,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing:
                                          messageOptions.letterSpacing,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                              ],
                            ),
                          // const SizedBox(height: 5)
                        ],
                      ),
                      if (numLines == 1)
                        Positioned(
                          bottom: 0,
                          right: 7,
                          child: Padding(
                            padding: messageOptions.timePadding,
                            child: Text(
                              (messageOptions.timeFormat ??
                                      intl.DateFormat('HH:mm'))
                                  .format(message.createdAt),
                              style: TextStyle(
                                color: isOwnMessage
                                    ? messageOptions
                                        .currentUserTimeTextColor(context)
                                    : messageOptions.timeTextColor(),
                                fontSize: messageOptions.timeFontSize,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: messageOptions.letterSpacing,
                              ),
                            ),
                          ),
                        )
                    ],
                  );
                },
              )
            : SizedBox();

      // ? TextContainer(
      //     isOwnMessage: isOwnMessage,
      //     messageOptions: const MessageOptions(),
      //     message: message,
      //     messageTextBuilder:
      //         (ChatMessage m, ChatMessage? p, ChatMessage? n) {
      //       return Wrap(
      //         children: getMessage(context),
      //       );
      //     },
      //   )
      // ? SizedBox()
      // :
    }
  }

  List<Widget> getMessage(BuildContext context) {
    final span = TextSpan(
      text: message.text,
    );
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout(
        maxWidth: (MediaQuery.of(context).size.width * 0.68) -
            (message.customProperties!['type'] == 1 ||
                    message.customProperties!['type'] == 2
                ? 50
                : 80));
    final numLines = tp.computeLineMetrics().length;

    if (message.mentions != null && message.mentions!.isNotEmpty) {
      String stringRegex = r'([\s\S]*)';
      String stringMentionRegex = '';
      for (final Mention mention in message.mentions!) {
        stringRegex += '(${mention.title})' r'([\s\S]*)';
        stringMentionRegex += stringMentionRegex.isEmpty
            ? '(${mention.title})'
            : '|(${mention.title})';
      }
      final RegExp mentionRegex = RegExp(stringMentionRegex);
      final RegExp regexp = RegExp(stringRegex);

      RegExpMatch? match = regexp.firstMatch(message.text);
      if (match != null) {
        List<Widget> res = <Widget>[];
        match
            .groups(List<int>.generate(match.groupCount, (int i) => i + 1))
            .forEach((String? part) {
          if (mentionRegex.hasMatch(part!)) {
            Mention mention = message.mentions!.firstWhere(
              (Mention m) => m.title == part,
            );
          } else {
            res.add(getParsePattern(context, part));
          }
        });
        if (res.isNotEmpty) {
          return res;
        }
      }
    }
    return <Widget>[
      getParsePattern(context, message.text),
      const SizedBox(width: 3),
      Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          (messageOptions.timeFormat ?? intl.DateFormat('HH:mm'))
              .format(message.createdAt),
          style: TextStyle(
            color: isOwnMessage
                ? message.customProperties!['type'] == 1 ||
                        message.customProperties!['type'] == 2 ||
                        message.customProperties!['type'] == 3
                    ? Colors.black.withOpacity(0.25)
                    : messageOptions.currentUserTimeTextColor(context)
                : messageOptions.timeTextColor(),
            fontSize: messageOptions.timeFontSize,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            letterSpacing: messageOptions.letterSpacing,
          ),
        ),
      ),
    ];
  }

  Widget getParsePattern(BuildContext context, String text) {
    return Column(
      children: [
        ParsedText(
          parse: messageOptions.parsePatterns != null
              ? messageOptions.parsePatterns!
              : defaultPersePatterns,
          text: message.customProperties!['type'] == 1
              ? "Your phone number has been sent."
              : "Your CV has been sent.",
          style: TextStyle(
            fontSize: 16,
            height: 1.2,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: isOwnMessage
                ? message.customProperties!['type'] == 1 ||
                        message.customProperties!['type'] == 2 ||
                        message.customProperties!['type'] == 3
                    ? const Color(0xCC212427)
                    : messageOptions.currentUserTextColor(context)
                : messageOptions.textColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (message.medias != null && message.medias!.isNotEmpty) {
      final List<ChatMedia> media = message.medias!;
      return Wrap(
        alignment: isOwnMessage ? WrapAlignment.end : WrapAlignment.start,
        children: media.map(
          (ChatMedia m) {
            final double gallerySize =
                (MediaQuery.of(context).size.width * 0.7) / 2 - 5;
            final bool isImage = m.type == MediaType.image;
            return Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 0, right: 5),
              width: media.length > 1 && isImage ? gallerySize : null,
              height: media.length > 1 && isImage ? gallerySize : null,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: GestureDetector(
                onTap: messageOptions.onTapMedia != null
                    ? () => messageOptions.onTapMedia!(m)
                    : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      m.isUploading
                          ? Colors.white54
                          : Colors.white.withOpacity(
                              0.1,
                            ), // Because transparent is causing an issue on flutter web
                      BlendMode.srcATop,
                    ),
                    child: _getMedia(
                      context,
                      m,
                      media.length > 1 ? gallerySize : null,
                      media.length > 1 ? gallerySize : null,
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );
    }
    return const SizedBox();
  }
}
