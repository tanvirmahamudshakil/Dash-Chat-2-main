// ignore_for_file: always_specify_types

part of dash_chat_2;

/// {@category Default widgets}
class DefaultMessageText5 extends StatelessWidget {
  DefaultMessageText5({
    required this.message,
    required this.isOwnMessage,
    this.messageOptions = const MessageOptions(),
    Key? key, this.numbercall, this.numbercopy,
  }) : super(key: key);

  /// Message tha contains the text to show
  final ChatMessage message;
  final GestureTapCallback? numbercall;
  final GestureTapCallback? numbercopy;

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
    tp.layout(maxWidth: (MediaQuery.of(context).size.width * 0.68) - 80);
    final numLines = tp.computeLineMetrics().length;

    return  Stack(
      fit: StackFit.loose,
      children: [
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${message.user.firstName} ${message.user.lastName} Mobile Number',
              style: const TextStyle(
                color: Color(0xCC212427),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset("assets/callicon.svg", package: 'dash_chat_2'),
                const SizedBox(width: 5.25),
                Text(
                  '${message.user.customProperties!['phone']}',
                  style: const TextStyle(
                    color: Color(0xFF0077B5),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                InkWell(
                  onTap: numbercall,
                  child: Container(
                    height: messageOptions.callhight,
                    padding: messageOptions.callpading,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.25, color: Color(0x23212427)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Call',
                          style: TextStyle(
                            color: Color(0xCC212427),
                            fontSize: messageOptions.calltextsize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 11),
               InkWell(
                onTap: numbercopy,
                 child: Container(
                    height: messageOptions.callhight,
                    padding: messageOptions.callpading,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.25, color: Color(0x23212427)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Copy',
                          style: TextStyle(
                            color: Color(0xCC212427),
                            fontSize: messageOptions.calltextsize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
               ),
              ],
            )
          ],
        ),
      
        Positioned(
          bottom: 0,
          right: 7,
          child: Padding(
                padding: messageOptions.timePadding,
                child: Text(
                  (messageOptions.timeFormat ?? intl.DateFormat('HH:mm'))
                      .format(message.createdAt),
                  style: TextStyle(
                    color: isOwnMessage
                        ? messageOptions.currentUserTimeTextColor(context)
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
  }

  List<Widget> getMessage(BuildContext context) {
    final span = TextSpan(
      text: message.text,
    );
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout(maxWidth: (MediaQuery.of(context).size.width * 0.68) - 80);
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
      if (numLines == 1) const SizedBox(width: 3),
      if (numLines == 1)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:  numLines == 1 ? EdgeInsets.only(top: 5) : messageOptions.timePadding,
              child: Text(
                (messageOptions.timeFormat ?? intl.DateFormat('HH:mm'))
                    .format(message.createdAt),
                style: TextStyle(
                  color: isOwnMessage
                      ? messageOptions.currentUserTimeTextColor(context)
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
    ];
  }

  Widget getParsePattern(BuildContext context, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: ParsedText(
            parse: messageOptions.parsePatterns != null
                ? messageOptions.parsePatterns!
                : defaultPersePatterns,
            text: text,
            style: TextStyle(
              fontSize: 16,
              height: 1.2,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: isOwnMessage
                  ? messageOptions.currentUserTextColor(context)
                  : messageOptions.textColor,
            ),
          ),
        ),
      ],
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
