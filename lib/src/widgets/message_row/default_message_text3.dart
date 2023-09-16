// ignore_for_file: always_specify_types

part of dash_chat_2;

/// {@category Default widgets}
class DefaultMessageText3 extends StatelessWidget {
  DefaultMessageText3({
    required this.message,
    required this.isOwnMessage,
    this.messageOptions = const MessageOptions(),
    Key? key,
  }) : super(key: key);

  /// Message tha contains the text to show
  final ChatMessage message;

  /// If the message is from the current user
  final bool isOwnMessage;

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;
  GlobalKey<State<StatefulWidget>> sizekey = GlobalKey();
  Size? redboxSize;

  Size getRedBoxSize(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  @override
  Widget build(BuildContext context) {
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment:
                isOwnMessage ? CrossAxisAlignment.end : CrossAxisAlignment.end,
            children: <Widget>[
              Wrap(
                alignment: isOwnMessage ? WrapAlignment.end : WrapAlignment.end,
                children: getMessage(context),
              ),
              if (messageOptions.showTime && numLines > 1)
                messageOptions.messageTimeBuilder != null
                    ? messageOptions.messageTimeBuilder!(message, isOwnMessage)
                    : Padding(
                        padding: messageOptions.timePadding,
                        child: Text(
                          (messageOptions.timeFormat ??
                                  intl.DateFormat('HH:mm'))
                              .format(message.createdAt),
                          style: TextStyle(
                            color: isOwnMessage
                                ? message.customProperties!['type'] == 1 ||
                                        message.customProperties!['type'] ==
                                            2 ||
                                        message.customProperties!['type'] == 3
                                    ? Colors.black.withOpacity(0.25)
                                    : messageOptions
                                        .currentUserTimeTextColor(context)
                                : messageOptions.timeTextColor(),
                            fontSize: messageOptions.timeFontSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: messageOptions.letterSpacing,
                          ),
                        ),
                      ),
            ],
          ),
        ),
        if (isOwnMessage &&
            message.customProperties!['type'] != 1 &&
            message.customProperties!['type'] != 2 &&
            message.customProperties!['type'] != 3)
          const SizedBox(width: 3),
        if (isOwnMessage &&
            message.customProperties!['type'] != 1 &&
            message.customProperties!['type'] != 2 &&
            message.customProperties!['type'] != 3)
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/messageseen.svg",
                  package: 'dash_chat_2',
                ),
              ],
            ),
          ),
      ],
    );
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
    print(numLines);

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
            res.add(getMention(context, mention));
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
      if (numLines == 1) SizedBox(width: 3),
      if (numLines == 1)
        Padding(
          padding: numLines == 1
              ? EdgeInsets.only(top: 5, right: 5)
              : messageOptions.timePadding,
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
    return ParsedText(
      parse: messageOptions.parsePatterns != null
          ? messageOptions.parsePatterns!
          : defaultPersePatterns,
      text: message.customProperties!['type'] == 1
          ? 'Your phone number has been sent.'
          : 'Your CV has been sent.',
      style: TextStyle(
        fontSize: 16,
        height: 1.2,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: isOwnMessage
            ? message.customProperties!['type'] == 1 ||
                    message.customProperties!['type'] == 2 ||
                    message.customProperties!['type'] == 3
                ? Color(0xCC212427)
                : messageOptions.currentUserTextColor(context)
            : messageOptions.textColor,
      ),
    );
  }

  Widget getMention(BuildContext context, Mention mention) {
    return RichText(
      text: TextSpan(
        text: mention.title,
        recognizer: TapGestureRecognizer()
          ..onTap = () => messageOptions.onPressMention != null
              ? messageOptions.onPressMention!(mention)
              : null,
        style: TextStyle(
          color: isOwnMessage
              ? messageOptions.currentUserTextColor(context)
              : messageOptions.textColor,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
