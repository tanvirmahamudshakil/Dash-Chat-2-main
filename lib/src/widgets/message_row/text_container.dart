// ignore_for_file: always_specify_types

part of dash_chat_2;

/// @nodoc
class TextContainer extends StatelessWidget {
  const TextContainer({
    required this.message,
    this.messageOptions = const MessageOptions(),
    this.previousMessage,
    this.nextMessage,
    this.isOwnMessage = false,
    this.isPreviousSameAuthor = false,
    this.isNextSameAuthor = false,
    this.isAfterDateSeparator = false,
    this.isBeforeDateSeparator = false,
    this.messageTextBuilder,
    this.cvsend,
    this.numbersend,
    Key? key,
    this.numbercall,
    this.numbercopy,
  }) : super(key: key);

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;

  final GestureTapCallback? cvsend;
  final GestureTapCallback? numbersend;
  final GestureTapCallback? numbercall;
  final GestureTapCallback? numbercopy;

  /// Message that contains the text to show
  final ChatMessage message;

  /// Previous message in the list
  final ChatMessage? previousMessage;

  /// Next message in the list
  final ChatMessage? nextMessage;

  /// If the message is from the current user
  final bool isOwnMessage;

  /// If the previous message is from the same author as the current one
  final bool isPreviousSameAuthor;

  /// If the next message is from the same author as the current one
  final bool isNextSameAuthor;

  /// If the message is preceded by a date separator
  final bool isAfterDateSeparator;

  /// If the message is before by a date separator
  final bool isBeforeDateSeparator;

  /// We could acces that from messageOptions but we want to reuse this widget
  /// for media and be able to override the text builder
  final Widget Function(ChatMessage, ChatMessage?, ChatMessage?)?
      messageTextBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: messageOptions.messageDecorationBuilder != null
          ? messageOptions.messageDecorationBuilder!(
              message, previousMessage, nextMessage)
          : defaultMessageDecoration(
              boxShadow: message.customProperties!['type'] == 1 ||
                      message.customProperties!['type'] == 2 ||
                      message.customProperties!['type'] == 3 ||
                      message.customProperties!['type'] == 4
                  ? []
                  : [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 0,
                          offset: const Offset(0.0, 0.5))
                    ],
              border: message.customProperties!['type'] == 1 ||
                      message.customProperties!['type'] == 2 ||
                      message.customProperties!['type'] == 3 ||
                      message.customProperties!['type'] == 4
                  ? Border.all(color: const Color(0x26212427))
                  : null,
              color: isOwnMessage
                  ? message.customProperties!['type'] == 1 ||
                          message.customProperties!['type'] == 2 ||
                          message.customProperties!['type'] == 3 ||
                          message.customProperties!['type'] == 4
                      ? Colors.transparent
                      : messageOptions.currentUserContainerColor(context)
                  : message.customProperties!['type'] == 3 ||
                          message.customProperties!['type'] == 4 ||
                          message.customProperties!['type'] == 1 ||
                          message.customProperties!['type'] == 2
                      ? Colors.transparent
                      : messageOptions.containerColor,
              borderTopLeft: message.customProperties!['type'] == 1 ||
                      message.customProperties!['type'] == 2 ||
                      message.customProperties!['type'] == 3 ||
                      message.customProperties!['type'] == 4
                  ? 9
                  : isPreviousSameAuthor &&
                          !isOwnMessage &&
                          !isAfterDateSeparator && previousMessage!.customProperties!['type'] != 0
                      ? messageOptions.borderRadius
                      : isPreviousSameAuthor &&
                              !isOwnMessage &&
                              !isAfterDateSeparator
                          ? 0.0
                          : messageOptions.borderRadius,
              borderTopRight: message.customProperties!['type'] == 1 ||
                      message.customProperties!['type'] == 2 ||
                      message.customProperties!['type'] == 3 ||
                      message.customProperties!['type'] == 4
                  ? 9
                  : isPreviousSameAuthor &&
                          isOwnMessage &&
                          !isAfterDateSeparator && previousMessage!.customProperties!['type'] != 0
                      ? messageOptions.borderRadius
                      : isPreviousSameAuthor &&
                          isOwnMessage &&
                          !isAfterDateSeparator
                      ? 0.0
                      : messageOptions.borderRadius,
              borderBottomLeft: message.customProperties!['type'] == 1 ||
                      message.customProperties!['type'] == 2 ||
                      message.customProperties!['type'] == 3 ||
                      message.customProperties!['type'] == 4
                  ? 9
                  : !isOwnMessage && !isBeforeDateSeparator && isNextSameAuthor && nextMessage!.customProperties!['type'] != 0
                      ? messageOptions.borderRadius
                      : !isOwnMessage && !isBeforeDateSeparator && isNextSameAuthor
                      ? 0.0
                      : messageOptions.borderRadius,
              borderBottomRight: message.customProperties!['type'] == 1 ||
                      message.customProperties!['type'] == 2 ||
                      message.customProperties!['type'] == 3 ||
                      message.customProperties!['type'] == 4
                  ? 9
                  :  isOwnMessage && !isBeforeDateSeparator && isNextSameAuthor && nextMessage!.customProperties!['type'] != 0
                      ? messageOptions.borderRadius
                      :  isOwnMessage && !isBeforeDateSeparator && isNextSameAuthor
                      ? 0.0
                      : messageOptions.borderRadius,
            ),
      padding: !isOwnMessage &&
              (message.customProperties!['type'] == 3 ||
                  message.customProperties!['type'] == 4)
          ? const EdgeInsets.only(top: 10, left: 9, right: 11, bottom: 3)
          : messageOptions.messagePadding,
      child: messageTextBuilder != null
          ? messageTextBuilder!(message, previousMessage, nextMessage)
          : !isOwnMessage &&
                  (message.customProperties!['type'] == 3 ||
                      message.customProperties!['type'] == 4)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (message.customProperties!['type'] == 3)
                      SvgPicture.asset('assets/call.svg',
                          package: 'dash_chat_2')
                    else
                      SvgPicture.asset('assets/cv.svg', package: 'dash_chat_2'),
                    const SizedBox(width: 4),
                    Flexible(
                      child: DefaultMessageText2(
                        cvsend: cvsend,
                        numbersend: numbersend,
                        message: message,
                        isOwnMessage: isOwnMessage,
                        messageOptions: messageOptions,
                      ),
                    )
                  ],
                )
              : isOwnMessage &&
                      (message.customProperties!['type'] == 1 || message.customProperties!['type'] == 2)
                  ? DefaultMessageText3(
                      message: message,
                      isOwnMessage: isOwnMessage,
                      messageOptions: messageOptions,
                    )
                  : isOwnMessage &&
                          (message.customProperties!['type'] == 3 ||
                              message.customProperties!['type'] == 4)
                      ? Row(
                          children: [
                            if (message.customProperties!['type'] == 3)
                              SvgPicture.asset('assets/rec_num_req.svg',
                                  package: 'dash_chat_2')
                            else
                              SvgPicture.asset('assets/rec_cv_req.svg',
                                  package: 'dash_chat_2'),
                            const SizedBox(width: 4),
                            Flexible(
                              child: DefaultMessageText4(
                                message: message,
                                isOwnMessage: isOwnMessage,
                                messageOptions: messageOptions,
                              ),
                            ),
                          ],
                        )
                      : !isOwnMessage &&
                              (message.customProperties!['type'] == 1 ||
                                  message.customProperties!['type'] == 2 &&
                                      message.medias!.isEmpty)
                          ? DefaultMessageText5(
                              numbercall: numbercall,
                              numbercopy: numbercopy,
                              message: message,
                              isOwnMessage: isOwnMessage,
                              messageOptions: messageOptions,
                            )
                          : DefaultMessageText(
                              message: message,
                              isOwnMessage: isOwnMessage,
                              messageOptions: messageOptions,
                            ),
    );
  }
}
